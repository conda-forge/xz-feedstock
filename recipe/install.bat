ninja install
if errorlevel 1 exit /b 1

if %PKG_NAME%==xz-static (
  echo "Keeping all files, conda will dedupe"
) else (
  exit /b 0
)
