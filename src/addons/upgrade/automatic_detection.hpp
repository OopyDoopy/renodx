/*
 * Copyright (C) 2026 Carlos Lopez
 * SPDX-License-Identifier: MIT
 */

#pragma once

#include <algorithm>
#include <cstdint>
#include <optional>
#include <ranges>
#include <unordered_map>
#include <unordered_set>
#include <vector>

namespace renodx::addons::upgrade::automatic_detection {

struct SwapchainWriter {
  uint32_t shader_hash = 0u;
  uint32_t rtv_index = 0u;
  uint64_t target_resource = 0u;
  uint32_t submission_order = 0u;
  bool has_texture_2d_srv = false;
  bool has_matching_source = false;
};

struct SwapchainCopy {
  enum class Operation : uint32_t {
    copy_resource,
    copy_texture_region,
  };

  uint64_t source_resource = 0u;
  uint64_t target_resource = 0u;
  uint32_t submission_order = 0u;
  Operation operation = Operation::copy_resource;
};

struct Promotion {
  uint32_t shader_hash = 0u;
  uint32_t rtv_index = 0u;
  uint64_t target_resource = 0u;
  uint32_t writer_index = 0u;
};

struct LearnedCandidate {
  uint32_t shader_hash = 0u;

  bool operator==(const LearnedCandidate&) const = default;
};

struct LearnedCandidateHash {
  [[nodiscard]] size_t operator()(const LearnedCandidate& candidate) const {
    return static_cast<size_t>(candidate.shader_hash);
  }
};

class Detector {
 public:
  void Reset() {
    frame_writers.clear();
    last_frame_writers.clear();
    ResetLearned();
    last_promotion.reset();
  }

  void ResetLearned() {
    learned_candidates.clear();
    pending_candidate.reset();
    pending_candidate_frame_count = 0u;
  }

  void ClearFrame() { frame_writers.clear(); }

  void Record(const SwapchainWriter& writer) { frame_writers.push_back(writer); }

  void Record(const std::vector<SwapchainWriter>& writers) {
    frame_writers.insert(frame_writers.end(), writers.begin(), writers.end());
  }

  [[nodiscard]] size_t GetFrameWriterCount(uint64_t target_resource = 0u) const {
    if (target_resource == 0u) return frame_writers.size();
    return static_cast<size_t>(std::ranges::count_if(
        frame_writers,
        [target_resource](const SwapchainWriter& writer) {
          return writer.target_resource == target_resource;
        }));
  }
  
  [[nodiscard]] const std::vector<SwapchainWriter>& GetFrameWriters() const {
    return frame_writers;
  }

  [[nodiscard]] bool IsLearned(uint32_t shader_hash) const {
    return learned_candidates.contains({
        .shader_hash = shader_hash,
    });
  }

  [[nodiscard]] bool HasLearnedCandidate() const {
    return !learned_candidates.empty();
  }

  [[nodiscard]] std::vector<LearnedCandidate> GetLearnedCandidates() const {
    std::vector<LearnedCandidate> candidates;
    candidates.reserve(learned_candidates.size());
    for (const auto& candidate : learned_candidates) {
      candidates.push_back(candidate);
    }
    return candidates;
  }

  [[nodiscard]] const std::optional<Promotion>& GetLastPromotion() const {
    return last_promotion;
  }

  [[nodiscard]] const std::vector<SwapchainWriter>& GetLastFrameWriters() const {
    return last_frame_writers;
  }

  [[nodiscard]] std::optional<Promotion> PromoteFirstFrameCandidate(
      uint64_t target_resource = 0u,
      bool replace_learned = false) {
    if (frame_writers.empty()) {
      pending_candidate.reset();
      pending_candidate_frame_count = 0u;
      return std::nullopt;
    }

    std::ranges::stable_sort(
        frame_writers,
        [](const SwapchainWriter& left, const SwapchainWriter& right) {
          return left.submission_order < right.submission_order;
        });

    const auto matches_target = [target_resource](const SwapchainWriter& writer) {
      return target_resource == 0u || writer.target_resource == target_resource;
    };
    struct ShaderClassification {
      bool has_texture_2d_srv = true;
      bool has_matching_source = true;
    };
    std::unordered_map<uint32_t, ShaderClassification> shader_classifications;
    shader_classifications.reserve(frame_writers.size());
    for (const auto& writer : frame_writers) {
      if (!matches_target(writer)) continue;

      auto& classification = shader_classifications[writer.shader_hash];
      if (!writer.has_texture_2d_srv) {
        classification.has_texture_2d_srv = false;
        classification.has_matching_source = false;
      } else if (!writer.has_matching_source) {
        classification.has_matching_source = false;
      }
    }
    for (auto& writer : frame_writers) {
      if (!matches_target(writer)) continue;
      const auto& classification = shader_classifications.at(writer.shader_hash);
      writer.has_texture_2d_srv = classification.has_texture_2d_srv;
      writer.has_matching_source = classification.has_matching_source;
    }

    auto writer_iterator = frame_writers.end();
    for (auto iterator = frame_writers.begin(); iterator != frame_writers.end(); ++iterator) {
      if (!matches_target(*iterator) || !iterator->has_matching_source) continue;
      const auto next_iterator = std::ranges::find_if(
          std::next(iterator),
          frame_writers.end(),
          matches_target);
      if (next_iterator != frame_writers.end()
          && next_iterator->has_texture_2d_srv
          && !next_iterator->has_matching_source) {
        writer_iterator = iterator;
        break;
      }
    }
    if (writer_iterator == frame_writers.end()) {
      writer_iterator = std::ranges::find_if(
          frame_writers,
          [&matches_target](const SwapchainWriter& writer) {
            return matches_target(writer) && writer.has_matching_source;
          });
    }
    if (writer_iterator == frame_writers.end()) {
      last_frame_writers = frame_writers;
      ClearFrame();
      pending_candidate.reset();
      pending_candidate_frame_count = 0u;
      return std::nullopt;
    }
    const uint32_t writer_index = static_cast<uint32_t>(
        std::distance(frame_writers.begin(), writer_iterator));
    const auto& writer = *writer_iterator;
    const Promotion promotion = {
        .shader_hash = writer.shader_hash,
        .rtv_index = writer.rtv_index,
        .target_resource = writer.target_resource,
        .writer_index = writer_index,
    };
    const bool learned_shader_ran = std::ranges::any_of(
        frame_writers,
        [this, &matches_target](const SwapchainWriter& candidate) {
          return matches_target(candidate)
                 && IsLearned(candidate.shader_hash);
        });
    Learn(
        promotion.shader_hash,
        replace_learned,
        learned_shader_ran,
        2u);
    last_promotion = promotion;
    last_frame_writers = frame_writers;
    ClearFrame();
    return promotion;
  }

 private:
  void Learn(
      uint32_t shader_hash,
      bool replace_learned,
      bool learned_shader_ran,
      uint32_t replacement_confirmation_frames) {
    const LearnedCandidate candidate = {
        .shader_hash = shader_hash,
    };
    if (!learned_candidates.empty()) {
      if (learned_candidates.contains(candidate)) {
        pending_candidate.reset();
        pending_candidate_frame_count = 0u;
        return;
      }
      if (!replace_learned) return;
      if (learned_shader_ran && replacement_confirmation_frames > 1u) {
        if (!pending_candidate.has_value() || *pending_candidate != candidate) {
          pending_candidate = candidate;
          pending_candidate_frame_count = 1u;
          return;
        }
        if (++pending_candidate_frame_count < replacement_confirmation_frames) return;
      }
    }
    learned_candidates.clear();
    learned_candidates.insert(candidate);
    pending_candidate.reset();
    pending_candidate_frame_count = 0u;
  }

  std::vector<SwapchainWriter> frame_writers;
  std::vector<SwapchainWriter> last_frame_writers;
  std::unordered_set<LearnedCandidate, LearnedCandidateHash> learned_candidates;
  std::optional<Promotion> last_promotion;
  std::optional<LearnedCandidate> pending_candidate;
  uint32_t pending_candidate_frame_count = 0u;
};

}  // namespace renodx::addons::upgrade::automatic_detection