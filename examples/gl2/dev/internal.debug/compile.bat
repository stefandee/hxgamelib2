set APPVERSION=0.0.1

echo %APPVERSION% > appversion.txt

haxe -debug --flash-use-stage compile.hxml
