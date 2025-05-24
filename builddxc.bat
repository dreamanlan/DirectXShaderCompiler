mkdir build_win

cmake . -B build_win -C ./cmake/caches/PredefinedParams.cmake -DCMAKE_BUILD_TYPE=Release -G "Visual Studio 17 2022"

cmake --build build_win --config Release

pause
