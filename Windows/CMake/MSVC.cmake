
include("${CMAKE_CURRENT_LIST_DIR}/FindVS.cmake")

# Find Visual Studio
if(NOT CMAKE_VS_VERSION_RANGE)
    set(CMAKE_VS_VERSION_RANGE "[16.0,)")
endif()

if(NOT CMAKE_VS_VERSION_PRERELEASE)
    set(CMAKE_VS_VERSION_PRERELEASE OFF)
endif()

if(NOT CMAKE_VS_PRODUCTS)
    set(CMAKE_VS_PRODUCTS "*")
endif()

if(NOT VS_INSTALLATION_PATH)
    findVisualStudio(
        VERSION ${CMAKE_VS_VERSION_RANGE}
        PRERELEASE ${CMAKE_VS_VERSION_PRERELEASE}
        PRODUCTS ${CMAKE_VS_PRODUCTS}
        PROPERTIES
            installationVersion VS_INSTALLATION_VERSION
            installationPath VS_INSTALLATION_PATH
    )
endif()

if(NOT VS_INSTALLATION_PATH)
    message(FATAL_ERROR "没有找到 Visual Studio")
endif()

message("Visual Studio 版本：" ${VS_INSTALLATION_VERSION})
message("Visual Studio 路径：" ${VS_INSTALLATION_PATH})

cmake_path(NORMAL_PATH VS_INSTALLATION_PATH)

set(VS_MSVC_PATH "${VS_INSTALLATION_PATH}/VC/Tools/MSVC")

# Use 'VS_PLATFORM_TOOLSET_VERSION' to resolve 'CMAKE_VS_PLATFORM_TOOLSET_VERSION'
#
if(NOT VS_PLATFORM_TOOLSET_VERSION)
    if(VS_TOOLSET_VERSION)
        message(WARNING "旧版本的WindowsToolchain错误地使用'VS_TOOLSET_VERSION'来指定VS工具集版本。此功能已被弃用-请使用'VS_PLATFORM_TOOLSET_VERSION'代替")
        set(VS_PLATFORM_TOOLSET_VERSION ${VS_TOOLSET_VERSION})
    else()
        file(GLOB VS_PLATFORM_TOOLSET_VERSIONS RELATIVE ${VS_MSVC_PATH} ${VS_MSVC_PATH}/*)
        list(SORT VS_PLATFORM_TOOLSET_VERSIONS COMPARE NATURAL ORDER DESCENDING)
        list(POP_FRONT VS_PLATFORM_TOOLSET_VERSIONS VS_PLATFORM_TOOLSET_VERSION)
        unset(VS_PLATFORM_TOOLSET_VERSIONS)
    endif()
endif()


set(CMAKE_VS_PLATFORM_TOOLSET_VERSION ${VS_PLATFORM_TOOLSET_VERSION})
set(VS_TOOLSET_PATH "${VS_INSTALLATION_PATH}/VC/Tools/MSVC/${CMAKE_VS_PLATFORM_TOOLSET_VERSION}")

message("Visual Studio 工具集版本：" ${CMAKE_VS_PLATFORM_TOOLSET_VERSION})
message("Visual Studio 工具集路径：" ${VS_TOOLSET_PATH})

# 设置工具变量 include_directories 和 link_directories
# 将CMAKE_SYSTEM_PROCESSOR值映射到CMAKE_VS_PLATFORM_TOOLSET_ARCHITECTURE，该架构标识应该使用的工具
#用于生成CMAKE_SYSTEM_PROCESSOR的代码。
if((CMAKE_SYSTEM_PROCESSOR STREQUAL AMD64) OR (CMAKE_SYSTEM_PROCESSOR STREQUAL x64))
    set(CMAKE_VS_PLATFORM_TOOLSET_ARCHITECTURE x64)
elseif((CMAKE_SYSTEM_PROCESSOR STREQUAL arm)
    OR (CMAKE_SYSTEM_PROCESSOR STREQUAL arm64)
    OR (CMAKE_SYSTEM_PROCESSOR STREQUAL x86))
    set(CMAKE_VS_PLATFORM_TOOLSET_ARCHITECTURE ${CMAKE_SYSTEM_PROCESSOR})
else()
    message(FATAL_ERROR "Unable identify compiler architecture for CMAKE_SYSTEM_PROCESSOR ${CMAKE_SYSTEM_PROCESSOR}")
endif()
message("Visual Studio 工具集架构：" ${CMAKE_VS_PLATFORM_TOOLSET_ARCHITECTURE})

set(CMAKE_CXX_COMPILER "${VS_TOOLSET_PATH}/bin/Host${CMAKE_VS_PLATFORM_TOOLSET_HOST_ARCHITECTURE}/${CMAKE_VS_PLATFORM_TOOLSET_ARCHITECTURE}/cl.exe")
set(CMAKE_C_COMPILER "${VS_TOOLSET_PATH}/bin/Host${CMAKE_VS_PLATFORM_TOOLSET_HOST_ARCHITECTURE}/${CMAKE_VS_PLATFORM_TOOLSET_ARCHITECTURE}/cl.exe")

message("Visual Studio C 编译器：" ${CMAKE_C_COMPILER})
message("Visual Studio C++ 编译器：" ${CMAKE_CXX_COMPILER})

if(CMAKE_SYSTEM_PROCESSOR STREQUAL arm)
    set(CMAKE_CXX_FLAGS_INIT "${CMAKE_CXX_FLAGS_INIT} /EHsc")
endif()

foreach(LANG C CXX RC)
    list(APPEND CMAKE_${LANG}_STANDARD_INCLUDE_DIRECTORIES "${VS_TOOLSET_PATH}/ATLMFC/include")
    list(APPEND CMAKE_${LANG}_STANDARD_INCLUDE_DIRECTORIES "${VS_TOOLSET_PATH}/include")
endforeach()

if(VS_USE_SPECTRE_MITIGATION_ATLMFC_RUNTIME)
    # 确保在添加'link_directories'之前存在必要的文件夹和文件
    toolchain_validate_vs_files(
        DESCRIPTION "ATLMFC Spectre libraries"
        FOLDER "${VS_TOOLSET_PATH}/ATLMFC/lib/spectre/${CMAKE_VS_PLATFORM_TOOLSET_ARCHITECTURE}"
        FILES
            atls.lib
    )
    link_directories("${VS_TOOLSET_PATH}/ATLMFC/lib/spectre/${CMAKE_VS_PLATFORM_TOOLSET_ARCHITECTURE}")
else()
    link_directories("${VS_TOOLSET_PATH}/ATLMFC/lib/${CMAKE_VS_PLATFORM_TOOLSET_ARCHITECTURE}")
endif()

if(VS_USE_SPECTRE_MITIGATION_RUNTIME)
    # 确保在添加'link_directories'之前存在必要的文件夹和文件
    toolchain_validate_vs_files(
        DESCRIPTION "Spectre libraries"
        FOLDER "${VS_TOOLSET_PATH}/lib/spectre/${CMAKE_VS_PLATFORM_TOOLSET_ARCHITECTURE}"
        FILES
            msvcrt.lib vcruntime.lib vcruntimed.lib
    )
    link_directories("${VS_TOOLSET_PATH}/lib/spectre/${CMAKE_VS_PLATFORM_TOOLSET_ARCHITECTURE}")
else()
    link_directories("${VS_TOOLSET_PATH}/lib/${CMAKE_VS_PLATFORM_TOOLSET_ARCHITECTURE}")
endif()

link_directories("${VS_TOOLSET_PATH}/lib/x86/store/references")

# Module support
if(VS_EXPERIMENTAL_MODULE)
    set(CMAKE_CXX_FLAGS_INIT "${CMAKE_CXX_FLAGS_INIT} /experimental:module")
    set(CMAKE_CXX_FLAGS_INIT "${CMAKE_CXX_FLAGS_INIT} /stdIfcDir \"${VS_TOOLSET_PATH}/ifc/${CMAKE_VS_PLATFORM_TOOLSET_ARCHITECTURE}\"")
endif()

# Windows Kits
include("${CMAKE_CURRENT_LIST_DIR}/Windows10Include.cmake")