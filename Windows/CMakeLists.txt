cmake_minimum_required(VERSION 3.12)

project(project_name)

include(CMake/C.cmake)
include(CMake/CPP.cmake)
include(CMake/MSVC.cmake)
include(CMake/Compiler.cmake)

# include(CMake/GLM.cmake)

add_definitions(-DUNICODE -D_UNICODE)
add_definitions("/MP")

add_executable(windows  WIN32 src/App.cpp)
