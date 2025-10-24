@echo off

@REM run as Administrator
@echo off
cd /d %~dp0
set DOWNLOADS_DIR=%USERPROFILE%\Downloads
set DOWNLOADS_DIR_LINUX=%DOWNLOADS_DIR:\=/%

set PYTHON_DIR=%DOWNLOADS_DIR%\python-3.10.8-amd64-portable

set PATH=^
%PYTHON_DIR%;^
%PYTHON_DIR%\Scripts;^
%DOWNLOADS_DIR%\PortableGit\bin;^
%DOWNLOADS_DIR%\13.1.0-202407240918mingw1310\Tools\mingw1310_64;^
%DOWNLOADS_DIR%\13.1.0-202407240918mingw1310\Tools\mingw1310_64\bin;^
%DOWNLOADS_DIR%\ninja-win;^
%DOWNLOADS_DIR%\cmake-3.29.3-windows-x86_64\cmake-3.29.3-windows-x86_64\bin;

set QT_VERSION=6.10.0
set QT_VERSION_COARSE=6.10

cd /d "%DOWNLOADS_DIR%\qtbase-everywhere-src-%QT_VERSION%" &&^
mkdir "cmake-build" &&^
cd "cmake-build" &&^
..\configure.bat -static -static-runtime -release -nomake examples -prefix "installation" -opensource -confirm-license -qt-libpng -qt-libjpeg -qt-zlib -qt-pcre -qt-freetype -schannel -opengl desktop -platform win32-g++ &&^
cmake --build . --parallel --config Release &&^
cmake --install .

cd /d "%DOWNLOADS_DIR%\qttools-everywhere-src-%QT_VERSION%" &&^
mkdir "cmake-build" &&^
cd "cmake-build" &&^
cmake ..\CMakeLists.txt -G "Ninja" -DCMAKE_INSTALL_PREFIX="%DOWNLOADS_DIR_LINUX%/qtbase-everywhere-src-%QT_VERSION%/cmake-build/installation" -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH="%DOWNLOADS_DIR_LINUX%/qtbase-everywhere-src-%QT_VERSION%/cmake-build/installation/lib/cmake"
cmake --build . --parallel --config Release &&^
cmake --install .

cd /d "%DOWNLOADS_DIR%\qttranslations-everywhere-src-%QT_VERSION%" &&^
mkdir "cmake-build" &&^
cd "cmake-build" &&^
cmake ..\CMakeLists.txt -G "Ninja" -DCMAKE_INSTALL_PREFIX="%DOWNLOADS_DIR_LINUX%/qtbase-everywhere-src-%QT_VERSION%/cmake-build/installation" -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH="%DOWNLOADS_DIR_LINUX%/qtbase-everywhere-src-%QT_VERSION%/cmake-build/installation/lib/cmake"
cmake --build . --parallel --config Release &&^
cmake --install .

cd /d "%DOWNLOADS_DIR%\qtsvg-everywhere-src-%QT_VERSION%" &&^
mkdir "cmake-build" &&^
cd "cmake-build" &&^
cmake ..\CMakeLists.txt -G "Ninja" -DCMAKE_INSTALL_PREFIX="%DOWNLOADS_DIR_LINUX%/qtbase-everywhere-src-%QT_VERSION%/cmake-build/installation" -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH="%DOWNLOADS_DIR_LINUX%/qtbase-everywhere-src-%QT_VERSION%/cmake-build/installation/lib/cmake"
cmake --build . --parallel --config Release &&^
cmake --install .

@REM ::复制qt.conf
@REM copy %~dp0\qt.conf %INSTALL_DIR%\bin

@REM ::@pause
@REM @cmd /k cd /d %INSTALL_DIR%
