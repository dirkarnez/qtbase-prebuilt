@REM run as Administrator
@echo off

set DOWNLOADS_DIR=%USERPROFILE%\Downloads

set SEVENZIP=C:\"Program Files"\7-Zip\7z.exe

set QT_VERSION=6.10.0
set QT_VERSION_COARSE=6.10

cd /d "%DOWNLOADS_DIR%"

curl "https://download.qt.io/official_releases/qt/%QT_VERSION_COARSE%/%QT_VERSION%/submodules/qtbase-everywhere-src-%QT_VERSION%.zip" -L -O -J
%SEVENZIP% x qtbase-everywhere-src-%QT_VERSION%.zip

curl "https://download.qt.io/official_releases/qt/%QT_VERSION_COARSE%/%QT_VERSION%/submodules/qttools-everywhere-src-%QT_VERSION%.zip" -L -O -J
%SEVENZIP% x qttools-everywhere-src-%QT_VERSION%.zip

curl "https://download.qt.io/official_releases/qt/%QT_VERSION_COARSE%/%QT_VERSION%/submodules/qttranslations-everywhere-src-%QT_VERSION%.zip" -L -O -J
%SEVENZIP% x qttranslations-everywhere-src-%QT_VERSION%.zip

curl "https://download.qt.io/official_releases/qt/%QT_VERSION_COARSE%/%QT_VERSION%/submodules/qtsvg-everywhere-src-%QT_VERSION%.zip" -L -O -J
%SEVENZIP% x qtsvg-everywhere-src-%QT_VERSION%.zip

