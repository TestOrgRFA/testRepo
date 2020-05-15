#!/bin/sh

#insert pre-build script here.



#build steps for cmake in unix
mkdir build
cmake -S . -B build
cmake --build build

#insert post-build script here
