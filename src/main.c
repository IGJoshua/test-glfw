#include <GLFW/glfw3.h>

#include "defines.h"
#include "window.h"

#include <stdio.h>

#ifdef _WIN32
#include <windows.h>
#else
#include <unistd.h>
#endif

internal
void keyCallback(
		GLFWwindow *window,
		int key,
		int scancode,
		int action,
		int mods)
{
		if (key == GLFW_KEY_ESCAPE && action == GLFW_PRESS)
		{
				glfwSetWindowShouldClose(window, GLFW_TRUE);
		}
}

//static double delta = 1.0/60.0;

int main()
{
		GLFWwindow *window = initWindow(640, 480, "Hello, world!");

		if (!window)
		{
				return -1;
		}

		glfwMakeContextCurrent(window);
		glfwSwapInterval(1);
		glfwSetKeyCallback(window, &keyCallback);

		glClearColor(1.0f, 1.0f, 1.0f, 1.0f);

		//double nextFrameTime = 0.0;
		// main loop
		while(!glfwWindowShouldClose(window))
		{
				int32 width, height;
				float32 aspect;

				glfwGetFramebufferSize(window, &width, &height);

				aspect = (float32)width / (float32)height;

				glViewport(0, 0, width, height);
				glClear(GL_COLOR_BUFFER_BIT);
				glClear(GL_DEPTH_BUFFER_BIT);

				// Input

				// Update

				// Render

				glfwSwapBuffers(window);

				// Timestep

				// Ensure that enough time has gone by
				/*
				while (glfwGetTime() < nextFrameTime)
				{
#ifdef _WIN32
						Sleep(1);
#else
						usleep(1 * 1000);
#endif
				}

				nextFrameTime += delta;
				*/
				glfwPollEvents();
		}

		freeWindow(window);
    return -0;
}
