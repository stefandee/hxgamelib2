@echo Starting compilation at%time%

rem set APPVERSION=0.0.1
rem echo %APPVERSION% > appversion.txt

"C:\Program Files\Motion-Twin\haxe-2.07-win\haxe.exe" -debug --flash-use-stage build.hxml

cp -f E:\Home\Karg\Projects\Haxe\GameLib2\test\leaderboard\bin\internal.debug\leaderboard.swf E:\Home\Karg\Projects\Web\pirongames.com\res\swf