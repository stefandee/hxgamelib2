set GameToolkitPath=E:\Home\Karg\Projects\GameToolkit
set ProjectPath=E:\Home\Karg\Projects\Haxe\Gamelib2
set ExampleProjectPath="%ProjectPath%\examples\gl2"

@rem Make the language data library
perl.exe "%ProjectPath%\tools\makelanglib.pl" "%GameToolkitPath%\bin\StringTool\StringTool.exe" "%ProjectPath%\tools\StringTool\StringScript_AS30_ByteArray_Lang.csl" "%ExampleProjectPath%\data\strings" "%ExampleProjectPath%\data\strings\langlib"

cp -f "%ExampleProjectPath%\data\strings\EN_US\AllStrings.hx" "%ExampleProjectPath%\src\data"

@rem uncomment if you use string packages
@rem cp -f "%ExampleProjectPath%\data\strings\EN_US\StringPackages.hx" "%ExampleProjectPath%\src\data"

@echo Building the Sprite Library
perl.exe "%ProjectPath%\tools\makedatalib.pl" "%ExampleProjectPath%\data\sprites" "%ExampleProjectPath%\data\sprites\sprlib" "%ExampleProjectPath%\src\data\SprId.hx" bin SprId SPR

@rem put everything together
"c:\program files\samhaxe\samhaxe.exe" data.xml data.swf
