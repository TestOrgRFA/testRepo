cmake_minimum_required(VERSION 3.13)
project(cmake_testapp)

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CONFIGURATION_TYPES Debug;Release;MinSizeRel;RelWithDebInfo)

add_executable(cmake_testapp main.cpp)