include(FetchContent)

set(GLM_ROOT_DIR "${CMAKE_CURRENT_SOURCE_DIR}/vendor/glm")

message(${GLM_ROOT_DIR})

FetchContent_Declare(
    glm
    GIT_REPOSITORY https://github.com/g-truc/glm
    GIT_TAG 1.0.1
	SOURCE_DIR ${GLM_ROOT_DIR}
)

FetchContent_MakeAvailable(glm)
if (NOT glm_POPULATED)
    FetchContent_Populate(glm)
endif()
