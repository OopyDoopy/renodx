#version 450


layout(location = 0) noperspective in vec4 in;
layout(location = 0) out vec4 out;

void main()
{
  out = in.x;
}

