#支持CMAKE最低版本
cmake_minimum_required(VERSION 2.8)

#项目名称
project(leveldb_example)

set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_CROSSCOMPILING TRUE)
set(CMAKE_C_COMPILER "arm-linux-gcc")
set(CMAKE_CXX_COMPILER "arm-linux-g++")
set(CMAKE_FIND_ROOT_PATH  "/opt/gcc-4.4.4-glibc-2.11.1-multilib-1.0/arm-fsl-linux-gnueabi/")
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

SET(CMAKE_BUILD_TYPE Release)
#SET(CMAKE_BUILD_TYPE Debug)

#配置编译选项
SET(CMAKE_CXX_FLAGS_DEBUG "$ENV{CXXFLAGS} -O0 -g -ggdb -Wall")
#set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 -fpermissive")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fpermissive")

OPTION(UDP "OFF to close UDP_SWITCH ON to open" OFF) # Enabled by default
IF(UDP)
    ADD_DEFINITIONS(-DUDP_COM)
ENDIF(UDP)

set(SOURCE_FILES main.cpp)

#配置头文件目录
include_directories("./include")
include_directories("./easylogger/include")
include_directories( "/opt/fsu_packages/paho_1.1.0/include" "/opt/fsu_packages/boost/include" "/opt/fsu_packages/icu/include" )
include_directories("/opt/fsu_packages/leveldb-1.20/include")
#添加源文件目录
aux_source_directory(./src SOURCE_FILES)



aux_source_directory(./easylogger SOURCE_FILES)
#添加共享库文件
set(LIBRARIES
        /opt/gcc-4.4.4-glibc-2.11.1-multilib-1.0/arm-fsl-linux-gnueabi/arm-fsl-linux-gnueabi/multi-libs/usr/lib/libpthread.so
        /opt/fsu_packages/boost/lib/libboost_serialization.so
        /opt/fsu_packages/boost/lib/libboost_wserialization.so
        /opt/fsu_packages/leveldb-1.20/lib/libleveldb.so
        )

add_executable(leveldb_example ${SOURCE_FILES})

#共享库链接
target_link_libraries(leveldb_example ${LIBRARIES})