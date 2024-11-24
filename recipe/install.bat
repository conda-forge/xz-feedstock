@echo on

ninja install
if errorlevel 1 exit /b 1

if %PKG_NAME% NEQ "xz-tools" (
    del %LIBRARY_PREFIX%/bin/xzdec.exe
    del %LIBRARY_PREFIX%/bin/lzmadec.exe
    del %LIBRARY_PREFIX%/bin/lzmainfo.exe
    del %LIBRARY_PREFIX%/bin/xz.exe
)
