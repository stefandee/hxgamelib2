set GameToolkitPath=E:\Home\Karg\Projects\GameToolkit
set ProjectPath=E:\Home\Karg\Projects\Haxe\GameLib2\examples\leaderboard

@rem Build the language library
perl.exe "%ProjectPath%\tools\makelanglib.pl" "%GameToolkitPath%\bin\StringTool\StringTool.exe" "%ProjectPath%\tools\StringTool\StringScript_AS30_ByteArray_Lang.csl" "%ProjectPath%\data\strings" "%ProjectPath%\data\strings\langlib"

@rem These should be common for all languages
cp -f "%ProjectPath%\data\strings\EN_US\AllStrings.hx" "%ProjectPath%\src\data"

@rem uncomment if you use string packages
@rem cp -f "%ProjectPath%\data\strings\EN_US\StringPackages.hx" "%ProjectPath%\src\data"

@echo Building the Sprites Data Library
perl.exe "%ProjectPath%\tools\makedatalib.pl" "%ProjectPath%\data\sprites" "%ProjectPath%\data\sprites\sprlib" "%ProjectPath%\src\data\SprId.hx" bin SprId SPR

"E:\Home\Karg\Projects\Haxe\tools\samhaxe\bin\samhaxe.exe" -c E:\Home\Karg\Projects\Haxe\tools\samhaxe\bin\samhaxe.conf.personal.xml data.xml data.swf
