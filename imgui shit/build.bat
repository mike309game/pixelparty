set CMAKE="C:\Users\PC\Downloads\cmake-3.21.3-windows-i386\bin\cmake.exe"

%CMAKE% -B build -DCMAKE_BUILD_TYPE=%1
%CMAKE% --build build --config %1