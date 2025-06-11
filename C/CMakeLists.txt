# CMake 最低版本号要求
cmake_minimum_required(VERSION 3.15)
add_compile_options("$<$<C_COMPILER_ID:MSVC>:/utf-8>")
add_compile_options("$<$<CXX_COMPILER_ID:MSVC>:/utf-8>")

# 项目信息
project(C)

# 查找当前目录下的所有源文件
# 并将名称保存到 all_file 变量
aux_source_directory(. all_file)

# 添加 fmt 子目录 编译 fmt
add_subdirectory(fmt)
# 包含 fmt 头文件
include_directories(fmt/include)

# 添加 fmt 链接库
link_directories(../build/C/S/fmt/Debug/)

# 指定生成目标
add_executable(${PROJECT_NAME} ${all_file})

# 链接 fmt 链接库
target_link_libraries(${PROJECT_NAME} fmtd)
