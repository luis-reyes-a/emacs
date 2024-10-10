@echo off

set ext_filter=-name '*.cpp' -o -name '*.h' -o -name '*.hpp' -o -name '*.txt'

find.exe %~1 -type f %ext_filter%
rem -exec grep -nH --null %~2 {} ;
