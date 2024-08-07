include(FetchContent)

set(GLFW_ROOT_DIR "${CMAKE_CURRENT_SOURCE_DIR}/vendor/glm")

message(${GLFW_ROOT_DIR})

FetchContent_Declare(
    glfw
    GIT_REPOSITORY https://github.com/glfw/glfw.git
    GIT_TAG 3.4
	SOURCE_DIR ${GLFW_ROOT_DIR}
)

FetchContent_MakeAvailable(glfw)
