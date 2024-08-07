if(CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
    message("MSVC 版本：" ${MSVC_VERSION})
    message("MSVC 工具集版本：" ${MSVC_TOOLSET_VERSION})
endif()

add_compile_options("$<$<CXX_COMPILER_ID:MSVC>:/source-charset:utf-8>")
# add_compile_options("$<$<CXX_COMPILER_ID:MSVC>:/execution-charset:gbk>")
message("码源编码：UTF_8")
