include_guard()

# -----------------------------------------------------------------------------
# Windows 系统检测
if(${CMAKE_HOST_SYSTEM_NAME} STREQUAL Windows)
    message("当前系统：Windows, 版本号：${CMAKE_HOST_SYSTEM_VERSION}")
else()
    message("当前系统：${CMAKE_HOST_SYSTEM_NAME}, 版本号：${CMAKE_HOST_SYSTEM_VERSION}")
endif()

if(NOT CMAKE_VS_PLATFORM_TOOLSET_HOST_ARCHITECTURE)
    if(CMAKE_HOST_SYSTEM_PROCESSOR STREQUAL ARM64)
        set(CMAKE_VS_PLATFORM_TOOLSET_HOST_ARCHITECTURE arm64)
    else()
        set(CMAKE_VS_PLATFORM_TOOLSET_HOST_ARCHITECTURE x64)
    endif()
    message("当前系统架构：${CMAKE_VS_PLATFORM_TOOLSET_HOST_ARCHITECTURE}")
endif()
