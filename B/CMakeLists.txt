# CMake 最低版本号要求
cmake_minimum_required(VERSION 3.15)

# 项目信息
project(B)

# C 标准
set(C_STANDARD 11)
set(C_STANDARD_REQUIRED ON)

# C++ 标准
set(CXX_STANDARD 11)
set(CXX_STANDARD_REQUIRED ON)

# Debug 还是 Release
if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE Debug)
endif()

# 设置输出目录
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR})

# 头文件 和 源文件
FILE(GLOB_RECURSE SRC_FILES "*.cpp")
FILE(GLOB HEAD_FILES "*.h")

# 指定生成目标
add_executable(${PROJECT_NAME} ${SRC_FILES} ${HEAD_FILES})
