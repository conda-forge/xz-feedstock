@echo on

ninja install
if errorlevel 1 exit /b 1

if [[ "${PKG_NAME}" != "xz-tools" ]]; then
    rm ${PREFIX}/share/doc/xz/COPYING.0BSD
    rm ${PREFIX}/bin/{lzcat,lzma,lzmadec,lzmainfo,xz,xzcat,unlzma,xzdec,unxz}
    rm ${PREFIX}/share/man/man1/{lzcat,lzma,lzmadec,lzmainfo,xz,xzcat,unlzma,xzdec,unxz}.1
fi
if %PKG_NAME% NEQ "xz-tools" (
    del %LIBRARY_PREFIX%/bin/xzdec.exe
    del %LIBRARY_PREFIX%/bin/lzmadec.exe
    del %LIBRARY_PREFIX%/bin/lzmainfo.exe
    del %LIBRARY_PREFIX%/bin/xz.exe
)
