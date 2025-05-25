#!/bin/bash

mkdir -p dxcbuild

cd dxcbuild

#can't genenerate xcode project for SPIRV-Tools
#cmake ../ -B . -GXcode -DCMAKE_BUILD_TYPE=Release -C ../cmake/caches/PredefinedParams.cmake -DCMAKE_C_COMPILER=clang

cmake ../ -B . -GNinja -DCMAKE_BUILD_TYPE=Release -C ../cmake/caches/PredefinedParams.cmake -DCMAKE_C_COMPILER=clang

ninja

