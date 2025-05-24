rem working directory

set workdir=%~dp0
cd %workdir%

xcopy /Y/S build_win\Release\bin\*.exe ..\Hlsl2Numpy\bin\Debug\net6.0\*.exe
xcopy /Y/S build_win\Release\bin\*.dll ..\Hlsl2Numpy\bin\Debug\net6.0\*.dll

xcopy /Y/S build_win\Release\bin\*.exe ..\Hlsl2Python\bin\Debug\net6.0\*.exe
xcopy /Y/S build_win\Release\bin\*.dll ..\Hlsl2Python\bin\Debug\net6.0\*.dll
