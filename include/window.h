#pragma once
#include <GLFW/glfw3.h>

#include "defines.h"

GLFWwindow *initWindow(uint32 width, uint32 height, const char *title);

int32 freeWindow(GLFWwindow *window);
