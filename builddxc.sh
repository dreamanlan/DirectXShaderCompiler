#!/bin/bash

cd dxcbuild
cmake ../DirectXShaderCompiler -GNinja -DCMAKE_BUILD_TYPE=Release -C ../DirectXShaderCompiler/cmake/caches/PredefinedParams.cmake -DCMAKE_C_COMPILER=clang
ninja

