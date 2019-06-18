@echo off
echo:
echo [Build] Setting up environment variables...
echo:
call "C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Auxiliary\Build\vcvarsall.bat" x64
echo:
echo [Build] Removing old files...
echo:
del *.log
del *.obj
del *.exe
del *.ilk
echo:
echo [Build] Assembling object file...
echo:
ml64.exe /c /Cx bughunt_syscall_x64.asm
echo:
echo [Build] Final compilation and linking...
echo:
cl.exe /Zi  /Tc  bughunt.c gdi32.lib bcrypt.lib Kernel32.lib User32.lib Advapi32.lib Shell32.lib Msimg32.lib Dxva2.lib Mscms.lib bughunt_syscall_x64.obj
::cl.exe /Zi /Tc reproduce/repro.c gdi32.lib kernel32.lib User32.lib Advapi32.lib Shell32.lib Msimg32.lib Dxva2.lib Mscms.lib bughunt_syscall_x64.obj