#pragma once

#include <algorithm>
#include <array>
#include <cmath>
#include <cstdio>

#include <deps/imgui/imgui.h>

#include "prism.hpp"

// ImGui visualization helpers for Prism CPU primary authoring.
//
// Renders the authoritative CPU-side authoring result for a RenoDX CUSTOM
// setting during normal tuning.
//
// The chart shows:
//   * CIE 1931 xy spectral locus + line of purples
//   * selected starting basis (BT.709 / DCI-P3 / BT.2020 / AP1 / normalized LMS)
//   * current authored Prism primary triangle
//   * resolved structural white point
//   * requested white point if the solver constrained it
//   * xy grid / compact diagnostics

namespace renodx::utils::prism::ui {

struct CIEChartOptions {
  // 0 = automatic from available width. Explicit height is clamped to a sane
  // overlay range for smaller settings panels.
  float height = 0.f;
  bool show_grid = true;
  bool show_spectral_locus = true;
  bool show_authoring_hull = true;
  bool show_requested_white = true;
  bool show_diagnostics = true;
};

namespace detail {

struct XY {
  float x;
  float y;
};

// CIE 1931 2-degree spectral-locus xy coordinates sampled every 5 nm from
// 380..700 nm. Source values correspond to the CIE 1931 standard observer.
// The final point is connected back to 380 nm to draw the line of purples.
inline constexpr std::array<XY, 65> kSpectralLocus = {{
    {0.17411f, 0.00496f},  // 380
    {0.17401f, 0.00498f},  // 385
    {0.17380f, 0.00492f},  // 390
    {0.17356f, 0.00492f},  // 395
    {0.17334f, 0.00480f},  // 400
    {0.17302f, 0.00478f},  // 405
    {0.17258f, 0.00480f},  // 410
    {0.17209f, 0.00483f},  // 415
    {0.17141f, 0.00510f},  // 420
    {0.17030f, 0.00579f},  // 425
    {0.16888f, 0.00690f},  // 430
    {0.16690f, 0.00856f},  // 435
    {0.16441f, 0.01086f},  // 440
    {0.16110f, 0.01379f},  // 445
    {0.15664f, 0.01770f},  // 450
    {0.15099f, 0.02274f},  // 455
    {0.14396f, 0.02970f},  // 460
    {0.13550f, 0.03988f},  // 465
    {0.12412f, 0.05780f},  // 470
    {0.10959f, 0.08684f},  // 475
    {0.09129f, 0.13270f},  // 480
    {0.06871f, 0.20072f},  // 485
    {0.04539f, 0.29498f},  // 490
    {0.02346f, 0.41270f},  // 495
    {0.00817f, 0.53842f},  // 500
    {0.00386f, 0.65482f},  // 505
    {0.01387f, 0.75019f},  // 510
    {0.03885f, 0.81202f},  // 515
    {0.07430f, 0.83380f},  // 520
    {0.11416f, 0.82621f},  // 525
    {0.15472f, 0.80586f},  // 530
    {0.19288f, 0.78163f},  // 535
    {0.22962f, 0.75433f},  // 540
    {0.26578f, 0.72432f},  // 545
    {0.30160f, 0.69231f},  // 550
    {0.33736f, 0.65885f},  // 555
    {0.37310f, 0.62445f},  // 560
    {0.40874f, 0.58961f},  // 565
    {0.44406f, 0.55471f},  // 570
    {0.47877f, 0.52020f},  // 575
    {0.51249f, 0.48659f},  // 580
    {0.54479f, 0.45443f},  // 585
    {0.57515f, 0.42423f},  // 590
    {0.60293f, 0.39650f},  // 595
    {0.62704f, 0.37249f},  // 600
    {0.64823f, 0.35139f},  // 605
    {0.66576f, 0.33401f},  // 610
    {0.68008f, 0.31975f},  // 615
    {0.69150f, 0.30834f},  // 620
    {0.70061f, 0.29930f},  // 625
    {0.70792f, 0.29203f},  // 630
    {0.71403f, 0.28593f},  // 635
    {0.71903f, 0.28093f},  // 640
    {0.72303f, 0.27695f},  // 645
    {0.72599f, 0.27401f},  // 650
    {0.72827f, 0.27173f},  // 655
    {0.72997f, 0.27003f},  // 660
    {0.73109f, 0.26891f},  // 665
    {0.73199f, 0.26801f},  // 670
    {0.73272f, 0.26728f},  // 675
    {0.73342f, 0.26658f},  // 680
    {0.73405f, 0.26595f},  // 685
    {0.73439f, 0.26561f},  // 690
    {0.73459f, 0.26541f},  // 695
    {0.73469f, 0.26531f},  // 700
}};

struct PlotBounds {
  float x_min = 0.f;
  float x_max = 0.8f;
  float y_min = 0.f;
  float y_max = 0.9f;
};

inline void ExpandBounds(PlotBounds& bounds, XY point) {
  bounds.x_min = std::min(bounds.x_min, point.x);
  bounds.x_max = std::max(bounds.x_max, point.x);
  bounds.y_min = std::min(bounds.y_min, point.y);
  bounds.y_max = std::max(bounds.y_max, point.y);
}

inline PlotBounds ComputePlotBounds(
    const ResolvedConfig& resolved,
    Gamut gamut,
    bool include_requested_white) {
  // Preserve the familiar CIE view for ordinary bases, but expand
  // automatically when a selected or authored basis contains signed or
  // otherwise out-of-range coordinates.
  PlotBounds bounds{};

  const auto hull = GetGamutChromaticities(gamut);
  ExpandBounds(bounds, {hull.red.x, hull.red.y});
  ExpandBounds(bounds, {hull.green.x, hull.green.y});
  ExpandBounds(bounds, {hull.blue.x, hull.blue.y});

  ExpandBounds(bounds, {resolved.red_xy[0], resolved.red_xy[1]});
  ExpandBounds(bounds, {resolved.green_xy[0], resolved.green_xy[1]});
  ExpandBounds(bounds, {resolved.blue_xy[0], resolved.blue_xy[1]});
  ExpandBounds(bounds, {resolved.white_xy[0], resolved.white_xy[1]});
  if (include_requested_white) {
    ExpandBounds(bounds, {resolved.requested_white_xy[0], resolved.requested_white_xy[1]});
  }

  const bool expanded =
      bounds.x_min < -1e-5f || bounds.x_max > 0.80001f
      || bounds.y_min < -1e-5f || bounds.y_max > 0.90001f;
  if (expanded) {
    const float x_padding = std::max(0.03f, (bounds.x_max - bounds.x_min) * 0.06f);
    const float y_padding = std::max(0.03f, (bounds.y_max - bounds.y_min) * 0.06f);
    bounds.x_min -= x_padding;
    bounds.x_max += x_padding;
    bounds.y_min -= y_padding;
    bounds.y_max += y_padding;
  }
  return bounds;
}

inline float NiceGridStep(float range) {
  if (range <= 1.05f) return 0.1f;
  if (range <= 2.1f) return 0.2f;
  if (range <= 5.1f) return 0.5f;
  return 1.f;
}

struct PlotTransform {
  float x_min = 0.f;
  float x_max = 0.8f;
  float y_min = 0.f;
  float y_max = 0.9f;
  ImVec2 plot_min{};
  ImVec2 plot_max{};
  float scale = 1.f;

  ImVec2 ToScreen(float x, float y) const {
    return {
        plot_min.x + (x - x_min) * scale,
        plot_max.y - (y - y_min) * scale,
    };
  }
};

inline PlotTransform MakePlotTransform(
    ImVec2 canvas_min,
    ImVec2 canvas_max,
    const PlotBounds& bounds) {
  constexpr float left_margin = 44.f;
  constexpr float right_margin = 10.f;
  constexpr float top_margin = 10.f;
  constexpr float bottom_margin = 24.f;

  const float available_width = std::max(1.f, canvas_max.x - canvas_min.x - left_margin - right_margin);
  const float available_height = std::max(1.f, canvas_max.y - canvas_min.y - top_margin - bottom_margin);
  const float x_range = std::max(1e-5f, bounds.x_max - bounds.x_min);
  const float y_range = std::max(1e-5f, bounds.y_max - bounds.y_min);
  const float scale = std::min(available_width / x_range, available_height / y_range);

  const float plot_width = x_range * scale;
  const float plot_height = y_range * scale;
  const float slack_x = available_width - plot_width;
  const float slack_y = available_height - plot_height;

  const ImVec2 plot_min = {
      canvas_min.x + left_margin + slack_x * 0.5f,
      canvas_min.y + top_margin + slack_y * 0.5f,
  };
  const ImVec2 plot_max = {plot_min.x + plot_width, plot_min.y + plot_height};
  return {
      bounds.x_min,
      bounds.x_max,
      bounds.y_min,
      bounds.y_max,
      plot_min,
      plot_max,
      scale,
  };
}

inline void DrawDashedLine(
    ImDrawList* draw_list,
    ImVec2 a,
    ImVec2 b,
    ImU32 color,
    float thickness = 1.f,
    float dash_length = 6.f,
    float gap_length = 4.f) {
  const ImVec2 delta = {b.x - a.x, b.y - a.y};
  const float length = std::sqrt(delta.x * delta.x + delta.y * delta.y);
  if (length <= 1e-5f) return;

  const ImVec2 direction = {delta.x / length, delta.y / length};
  const float step = dash_length + gap_length;
  for (float distance = 0.f; distance < length; distance += step) {
    const float segment_end = std::min(distance + dash_length, length);
    const ImVec2 p0 = {a.x + direction.x * distance, a.y + direction.y * distance};
    const ImVec2 p1 = {a.x + direction.x * segment_end, a.y + direction.y * segment_end};
    draw_list->AddLine(p0, p1, color, thickness);
  }
}

inline void DrawTriangle(
    ImDrawList* draw_list,
    const PlotTransform& plot,
    XY red,
    XY green,
    XY blue,
    ImU32 color,
    float thickness,
    bool dashed) {
  const ImVec2 r = plot.ToScreen(red.x, red.y);
  const ImVec2 g = plot.ToScreen(green.x, green.y);
  const ImVec2 b = plot.ToScreen(blue.x, blue.y);
  if (dashed) {
    DrawDashedLine(draw_list, r, g, color, thickness);
    DrawDashedLine(draw_list, g, b, color, thickness);
    DrawDashedLine(draw_list, b, r, color, thickness);
  } else {
    draw_list->AddLine(r, g, color, thickness);
    draw_list->AddLine(g, b, color, thickness);
    draw_list->AddLine(b, r, color, thickness);
  }
}

inline void DrawPoint(
    ImDrawList* draw_list,
    const PlotTransform& plot,
    XY point,
    const char* label,
    ImU32 fill,
    ImU32 outline,
    ImU32 text_color,
    float radius = 4.5f) {
  const ImVec2 p = plot.ToScreen(point.x, point.y);
  draw_list->AddCircleFilled(p, radius, fill, 16);
  draw_list->AddCircle(p, radius, outline, 16, 1.25f);
  draw_list->AddText({p.x + radius + 3.f, p.y - ImGui::GetFontSize() * 0.5f}, text_color, label);
}

inline bool IsDifferentWhite(const ResolvedConfig& resolved) {
  const float dx = resolved.requested_white_xy[0] - resolved.white_xy[0];
  const float dy = resolved.requested_white_xy[1] - resolved.white_xy[1];
  return resolved.white_was_constrained || (dx * dx + dy * dy > 1e-10f);
}

}  // namespace detail

inline void DrawCIE1931Chart(
    const ResolvedConfig& resolved,
    Gamut gamut,
    const CIEChartOptions& options = {}) {
  using detail::XY;

  const float available_width = std::max(220.f, ImGui::GetContentRegionAvail().x);
  const float automatic_height = std::clamp(available_width * 0.82f, 260.f, 430.f);
  const float height = options.height > 0.f
      ? std::clamp(options.height, 220.f, 520.f)
      : automatic_height;

  ImGui::TextDisabled("CIE 1931 xy - %s working basis", GamutName(gamut));
  ImGui::Dummy({available_width, height});

  const ImVec2 canvas_min = ImGui::GetItemRectMin();
  const ImVec2 canvas_max = ImGui::GetItemRectMax();
  ImDrawList* draw_list = ImGui::GetWindowDrawList();
  const auto bounds = detail::ComputePlotBounds(resolved, gamut, options.show_requested_white);
  const auto plot = detail::MakePlotTransform(canvas_min, canvas_max, bounds);

  const ImU32 background = ImGui::GetColorU32(ImGuiCol_FrameBg);
  const ImU32 border = ImGui::GetColorU32(ImGuiCol_Border);
  const ImU32 grid = ImGui::GetColorU32(ImGuiCol_Separator);
  const ImU32 muted = ImGui::GetColorU32(ImGuiCol_TextDisabled);
  const ImU32 text = ImGui::GetColorU32(ImGuiCol_Text);
  const ImU32 accent = ImGui::GetColorU32(ImGuiCol_SliderGrabActive);
  const ImU32 marker_fill = ImGui::GetColorU32(ImGuiCol_FrameBgHovered);

  draw_list->AddRectFilled(canvas_min, canvas_max, background, 3.f);
  draw_list->AddRect(canvas_min, canvas_max, border, 3.f, 0, 1.f);

  draw_list->PushClipRect(canvas_min, canvas_max, true);

  if (options.show_grid) {
    const float x_step = detail::NiceGridStep(plot.x_max - plot.x_min);
    const float y_step = detail::NiceGridStep(plot.y_max - plot.y_min);
    const float x_start = std::ceil(plot.x_min / x_step) * x_step;
    const float y_start = std::ceil(plot.y_min / y_step) * y_step;

    for (float x = x_start; x <= plot.x_max + x_step * 0.25f; x += x_step) {
      const ImVec2 p0 = plot.ToScreen(x, plot.y_min);
      const ImVec2 p1 = plot.ToScreen(x, plot.y_max);
      draw_list->AddLine(p0, p1, grid, 1.f);

      char label[16];
      std::snprintf(label, sizeof(label), "%.1f", x);
      const ImVec2 text_size = ImGui::CalcTextSize(label);
      draw_list->AddText(
          {p0.x - text_size.x * 0.5f, plot.plot_max.y + 4.f},
          muted,
          label);
    }

    for (float y = y_start; y <= plot.y_max + y_step * 0.25f; y += y_step) {
      const ImVec2 p0 = plot.ToScreen(plot.x_min, y);
      const ImVec2 p1 = plot.ToScreen(plot.x_max, y);
      draw_list->AddLine(p0, p1, grid, 1.f);

      char label[16];
      std::snprintf(label, sizeof(label), "%.1f", y);
      const ImVec2 text_size = ImGui::CalcTextSize(label);
      draw_list->AddText(
          {plot.plot_min.x - text_size.x - 5.f, p0.y - text_size.y * 0.5f},
          muted,
          label);
    }
  }

  draw_list->AddRect(plot.plot_min, plot.plot_max, border, 0.f, 0, 1.f);

  if (options.show_spectral_locus) {
    for (std::size_t i = 1; i < detail::kSpectralLocus.size(); ++i) {
      const auto& a = detail::kSpectralLocus[i - 1];
      const auto& b = detail::kSpectralLocus[i];
      draw_list->AddLine(plot.ToScreen(a.x, a.y), plot.ToScreen(b.x, b.y), muted, 1.5f);
    }
    const auto& first = detail::kSpectralLocus.front();
    const auto& last = detail::kSpectralLocus.back();
    draw_list->AddLine(plot.ToScreen(last.x, last.y), plot.ToScreen(first.x, first.y), muted, 1.5f);
  }

  if (options.show_authoring_hull) {
    const auto hull = GetGamutChromaticities(gamut);
    detail::DrawTriangle(
        draw_list,
        plot,
        {hull.red.x, hull.red.y},
        {hull.green.x, hull.green.y},
        {hull.blue.x, hull.blue.y},
        muted,
        1.5f,
        true);
  }

  // Current Prism primary triangle: solid and thicker than the authoring hull.
  detail::DrawTriangle(
      draw_list,
      plot,
      {resolved.red_xy[0], resolved.red_xy[1]},
      {resolved.green_xy[0], resolved.green_xy[1]},
      {resolved.blue_xy[0], resolved.blue_xy[1]},
      accent,
      2.5f,
      false);

  detail::DrawPoint(
      draw_list,
      plot,
      {resolved.red_xy[0], resolved.red_xy[1]},
      "R",
      marker_fill,
      accent,
      text);
  detail::DrawPoint(
      draw_list,
      plot,
      {resolved.green_xy[0], resolved.green_xy[1]},
      "G",
      marker_fill,
      accent,
      text);
  detail::DrawPoint(
      draw_list,
      plot,
      {resolved.blue_xy[0], resolved.blue_xy[1]},
      "B",
      marker_fill,
      accent,
      text);

  // Structural white is deliberately distinguished from the primaries.
  const XY white = {resolved.white_xy[0], resolved.white_xy[1]};
  const ImVec2 white_screen = plot.ToScreen(white.x, white.y);
  draw_list->AddCircleFilled(white_screen, 5.f, text, 16);
  draw_list->AddCircle(white_screen, 6.5f, background, 16, 1.5f);
  draw_list->AddText(
      {white_screen.x + 8.f, white_screen.y - ImGui::GetFontSize() * 0.5f},
      text,
      "W");

  if (options.show_requested_white && detail::IsDifferentWhite(resolved)) {
    const XY requested = {resolved.requested_white_xy[0], resolved.requested_white_xy[1]};
    const ImVec2 requested_screen = plot.ToScreen(requested.x, requested.y);
    detail::DrawDashedLine(draw_list, requested_screen, white_screen, muted, 1.f, 4.f, 3.f);
    draw_list->AddCircle(requested_screen, 5.f, muted, 16, 1.25f);
    draw_list->AddText(
        {requested_screen.x + 7.f, requested_screen.y - ImGui::GetFontSize() * 0.5f},
        muted,
        "W requested");
  }

  draw_list->PopClipRect();

  if (options.show_diagnostics) {
    ImGui::Text(
        "R %.4f, %.4f   G %.4f, %.4f   B %.4f, %.4f",
        resolved.red_xy[0], resolved.red_xy[1],
        resolved.green_xy[0], resolved.green_xy[1],
        resolved.blue_xy[0], resolved.blue_xy[1]);
    ImGui::Text(
        "White %.4f, %.4f   Hue headroom +/-%.1f deg",
        resolved.white_xy[0], resolved.white_xy[1],
        resolved.independent_hue_limit_degrees);
    if (resolved.white_was_constrained) {
      ImGui::TextDisabled(
          "Requested white %.4f, %.4f was constrained inside the authoring hull.",
          resolved.requested_white_xy[0], resolved.requested_white_xy[1]);
    }
      if (IsSignedBasis(gamut)) {
      ImGui::TextDisabled(
          "Normalized LMS is an adapted RGB-like basis; its CIE points are a working-space embedding, not a display-gamut limit.");
    }
  }
}

}  // namespace renodx::utils::prism::ui
