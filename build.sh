#!/bin/sh

#insert pre-build script here.
echo -n "executing pre-build steps"


#build steps for cmake in unix
echo -n "creating CMAKE project and building source"
mkdir build
cmake -S . -B build
cmake --build build

#insert post-build script here
echo -n "executing post-build steps"
