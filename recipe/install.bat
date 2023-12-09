@echo on

echo "first output"

if  %vc% LEQ 9 set MSVC_VER=1500
if  %vc% GTR 9 set MSVC_VER=1900

mkdir build
if errorlevel 1 exit 1
cd build
if errorlevel 1 exit 1

cmake -G "Ninja" ^
      "%CMAKE_ARGS%" ^
      -DCMAKE_INSTALL_PREFIX="%LIBRARY_PREFIX%" ^
      -DMSVC_VERSION="%MSVC_VER%" ^
      -DCMAKE_C_USE_RESPONSE_FILE_FOR_OBJECTS:BOOL=FALSE ^
      -DCMAKE_BUILD_TYPE=Release ^
      -DCMAKE_PREFIX_PATH:PATH="%LIBRARY_PREFIX%" ^
      -DCMAKE_INSTALL_PREFIX:PATH="%LIBRARY_PREFIX%" ^
      -DBUILD_SHARED_LIBS=ON ^
      "%SRC_DIR%"

if errorlevel 1 exit /b 1

cmake --build . -j %CPU_COUNT% --verbose --config Release
if errorlevel 1 exit /b 1


cmake --build . --config Release --target install
if errorlevel 1 exit /b 1

cd ..

if %PKG_NAME%==xz-static (
	echo "Keeping all files, conda will dedupe"
) else (
	DEL src\common\inttypes.h
	DEL src\common\stdint.h
	DEL %LIBRARY_LIB%\liblzma_static.lib

	cd %SRC_DIR%
	MOVE src\liblzma\api\lzma %LIBRARY_INC%\
	COPY src\liblzma\api\lzma.h %LIBRARY_INC%\
	exit /b 0
)
