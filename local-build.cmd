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
%DOWNLOADS_DIR%\cmake-3.29.3-windows-x86_64\bin;


set QT_VERSION=6.10.0
set QT_VERSION_COARSE=6.10

@REM cd /d "%DOWNLOADS_DIR%\qtbase-everywhere-src-%QT_VERSION%" &&^
@REM mkdir "cmake-build" &&^
@REM cd "cmake-build" &&^
@REM ..\configure.bat -static -static-runtime -release -nomake examples -prefix "installation" -opensource -confirm-license -qt-libpng -qt-libjpeg -qt-zlib -qt-pcre -qt-freetype -schannel -opengl desktop -platform win32-g++ &&^
@REM cmake --build . --parallel --config Release &&^
@REM cmake --install .

cd /d "%DOWNLOADS_DIR%\qttools-everywhere-src-%QT_VERSION%" &&^
mkdir "cmake-build" &&^
cd "cmake-build" &&^
cmake ..\CMakeLists.txt -G "Ninja" -DCMAKE_INSTALL_PREFIX="%DOWNLOADS_DIR_LINUX%/qtbase-everywhere-src-%QT_VERSION%/cmake-build/installation" -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH="%DOWNLOADS_DIR_LINUX%/qtbase-everywhere-src-%QT_VERSION%/cmake-build/installation/lib/cmake"
cmake --build . --parallel --config Release &&^
cmake --install .


@REM ::编译qttools
@REM mkdir build-qttools
@REM cd build-qttools
@REM cmake %SRC_qttools%\CMakeLists.txt -G "Ninja" -DCMAKE_INSTALL_PREFIX="%DOWNLOADS_DIR_LINUX%/qtbase-everywhere-src-%QT_VERSION%/cmake-build/installation" -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH="%DOWNLOADS_DIR_LINUX%/qtbase-everywhere-src-%QT_VERSION%/cmake-build/installation/lib/cmake"
@REM cmake --build . --parallel --config Release &&^
@REM cmake --install .
@REM cd ..

@REM ::编译qttranslations
@REM mkdir build-qttranslations
@REM cd build-qttranslations
@REM cmake %SRC_qttranslations%\CMakeLists.txt -G "Ninja" -DCMAKE_INSTALL_PREFIX="%DOWNLOADS_DIR_LINUX%/qtbase-everywhere-src-%QT_VERSION%/cmake-build/installation" -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH="%DOWNLOADS_DIR_LINUX%/qtbase-everywhere-src-%QT_VERSION%/cmake-build/installation/lib/cmake"
@REM cmake --build . --parallel --config Release &&^
@REM cmake --install .
@REM cd ..

@REM ::编译qtsvg
@REM mkdir build-qtsvg
@REM cd build-qtsvg
@REM cmake %SRC_qtsvg%\CMakeLists.txt -G "Ninja" -DCMAKE_INSTALL_PREFIX="%DOWNLOADS_DIR_LINUX%/qtbase-everywhere-src-%QT_VERSION%/cmake-build/installation" -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH="%DOWNLOADS_DIR_LINUX%/qtbase-everywhere-src-%QT_VERSION%/cmake-build/installation/lib/cmake"
@REM cmake --build . --parallel --config Release &&^
@REM cmake --install .
@REM cd ..

@REM ::复制qt.conf
@REM copy %~dp0\qt.conf %INSTALL_DIR%\bin

@REM ::@pause
@REM @cmd /k cd /d %INSTALL_DIR%