add_library(OpenGL INTERFACE)

find_package(OpenGL REQUIRED)
if (OpenGL_FOUND)
    message("OpenGL 包含目录：" ${OPENGL_INCLDUE_DIRS})
    foreach(item IN LISTS OPENGL_LIBRARIES)
        message("OpenGL 库目录：" ${item})
    endforeach()
else()
    message(FATAL_ERROR "没有发现 OpenGL")
endif()

target_link_libraries(OpenGL INTERFACE ${OPENGL_LIBRARYS})
