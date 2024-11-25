@echo on

md static-build
cd static-build

cmake %CMAKE_ARGS% -GNinja ^
      -DCMAKE_INSTALL_PREFIX="%LIBRARY_PREFIX%" ^
      -DCMAKE_C_USE_RESPONSE_FILE_FOR_OBJECTS:BOOL=FALSE ^
      -DCMAKE_BUILD_TYPE=Release ^
      -DBUILD_SHARED_LIBS=OFF ^
      ..
if errorlevel 1 exit /b 1

ninja
if errorlevel 1 exit /b 1

ninja install
if errorlevel 1 exit /b 1

