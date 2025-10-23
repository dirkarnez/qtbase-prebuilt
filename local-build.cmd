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
@REM set INSTALL_DIR=%QT_VERSION%-static\13.1.0-202407240918mingw1310"


@REM %SEVENZIP% x qtbase-everywhere-src-%QT_VERSION%.zip

@REM curl "https://download.qt.io/official_releases/qt/%QT_VERSION_COARSE%/%QT_VERSION%/submodules/qttools-everywhere-src-%QT_VERSION%.zip" -L -O -J
@REM %SEVENZIP% x qttools-everywhere-src-%QT_VERSION%.zip

@REM curl "https://download.qt.io/official_releases/qt/%QT_VERSION_COARSE%/%QT_VERSION%/submodules/qttranslations-everywhere-src-%QT_VERSION%.zip" -L -O -J
@REM %SEVENZIP% x qttranslations-everywhere-src-%QT_VERSION%.zip

@REM curl "https://download.qt.io/official_releases/qt/%QT_VERSION_COARSE%/%QT_VERSION%/submodules/qtsvg-everywhere-src-%QT_VERSION%.zip" -L -O -J
@REM %SEVENZIP% x qtsvg-everywhere-src-%QT_VERSION%.zip

cd /d "%DOWNLOADS_DIR%"

cd "qtbase-everywhere-src-%QT_VERSION%" &&^
mkdir "cmake-build" &&^
cd "cmake-build" &&^
..\configure.bat -static -static-runtime -release -nomake examples -prefix "installation" -opensource -confirm-license -qt-libpng -qt-libjpeg -qt-zlib -qt-pcre -qt-freetype -schannel -opengl desktop -platform win32-g++ &&^
cmake --build . --parallel &&^
pause &&^
cmake --install .

@REM cd "qttools-everywhere-src-%QT_VERSION%" &&^
@REM mkdir "cmake-build" &&^
@REM cd "cmake-build" &&^
@REM cmake ..\CMakeLists.txt -G "Ninja" -DCMAKE_INSTALL_PREFIX=installation -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH=%INSTALL_DIR%\lib\cmake"
@REM cmake --build . --parallel --config Release &&^
@REM cmake --install .


@REM ::编译qttools
@REM mkdir build-qttools
@REM cd build-qttools
@REM cmake %SRC_qttools%\CMakeLists.txt -G "Ninja" -DCMAKE_INSTALL_PREFIX=%INSTALL_DIR% -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH=%INSTALL_DIR%\lib\cmake"
@REM cmake --build . --parallel
@REM cmake --install .
@REM cd ..

@REM ::编译qttranslations
@REM mkdir build-qttranslations
@REM cd build-qttranslations
@REM cmake %SRC_qttranslations%\CMakeLists.txt -G "Ninja" -DCMAKE_INSTALL_PREFIX=%INSTALL_DIR% -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH=%INSTALL_DIR%\lib\cmake"
@REM cmake --build . --parallel
@REM cmake --install .
@REM cd ..

@REM ::编译qtsvg
@REM mkdir build-qtsvg
@REM cd build-qtsvg
@REM cmake %SRC_qtsvg%\CMakeLists.txt -G "Ninja" -DCMAKE_INSTALL_PREFIX=%INSTALL_DIR% -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH=%INSTALL_DIR%\lib\cmake"
@REM cmake --build . --parallel
@REM cmake --install .
@REM cd ..

@REM ::复制qt.conf
@REM copy %~dp0\qt.conf %INSTALL_DIR%\bin

@REM ::@pause
@REM @cmd /k cd /d %INSTALL_DIR%