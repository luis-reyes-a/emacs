@echo off
rem set environment variables
pushd .
call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvarsall" x64
popd

pushd ..
"D:\emacs\bin\runemacs.exe"   %*
start vc.bat
popd 

