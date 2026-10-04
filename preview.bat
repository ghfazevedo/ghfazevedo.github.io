@echo off
rem -------------------------------------------------------------
rem  Double-click to preview the website on this computer.
rem  Your browser opens at http://localhost:1313 and the page
rem  refreshes automatically every time you save a file.
rem  Close this window (or press Ctrl+C) to stop the preview.
rem -------------------------------------------------------------
cd /d "%~dp0"
title Website preview

where hugo >nul 2>nul
if errorlevel 1 (
  echo.
  echo  Hugo is not installed yet. It is needed only once.
  echo.
  choice /m " Install it now with winget"
  if errorlevel 2 goto :nohugo
  winget install --exact --id Hugo.Hugo.Extended --accept-source-agreements --accept-package-agreements
  echo.
  echo  Hugo was installed. Close this window and double-click preview.bat again.
  pause
  exit /b
)

echo.
echo  Starting preview... (drafts are shown here, but not on the published site)
echo.
hugo server --buildDrafts --disableFastRender --navigateToChanged --openBrowser
pause
exit /b

:nohugo
echo.
echo  To install Hugo later, open PowerShell and run:
echo     winget install Hugo.Hugo.Extended
echo.
pause
