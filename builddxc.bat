mkdir build_win

cmake . -B build_win -C ./cmake/caches/PredefinedParams.cmake -DCMAKE_BUILD_TYPE=Release -G "Visual Studio 17 2022"

rem cmake . -B build_win -G "Visual Studio 17 2022" -C ./cmake/caches/PredefinedParams.cmake -DCMAKE_BUILD_TYPE=Release -DMETAL_IRCONVERTER_ROOT=d:/MetalShaderConverter

cmake --build build_win --config Release

pause
