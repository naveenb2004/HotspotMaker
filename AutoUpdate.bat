::For more about task schedul
::visit--->
::https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/schtasks

:AUTOUPDATE
::check autoupdate setup
if EXIST "C:\ProgramData\HotspotMakerData\AutoUpdate.nnb" goto AUTOUPDATETRUE
if NOT EXIST "C:\ProgramData\HotspotMakerData\AutoUpdate.nnb" goto AUTOUPDATEFALSE

:AUTOUPDATEFALSE
::clear before outputs
cls
::title
title %title%
::credits
echo %CREDIT0%&echo %CREDIT1%&echo %CREDIT2%&echo %CREDIT4%&echo %CREDIT5%&echo %CREDIT6%&echo %CREDIT7%&echo %CREDIT8%
::tab title
echo [ Auto Update ]
echo.
::little instructions
echo Hotspot Maker Auto Update...
echo You can setup auto update option for Hotspot Maker.
echo If you setup this option,
echo    the Hotspot Maker will check and download updates when you loged in.
echo THE UPDATER WILL NOT WORK WHILE YOU ARE WORKING ON BATTERY POWER
echo.
echo Do you wish to continue...?
echo.
::user choicess
echo A - Continue&echo B - Cancle and back to Home&echo C - Exit
echo.
set/p "aufcho=>"
if %aufcho%==A goto AUSETUP
if %aufcho%==a goto AUSETUP
if %aufcho%==B call "%nowpath%\Home.bat"
if %aufcho%==b call "%nowpath%\Home.bat"
if %aufcho%==C call "%nowpath%\Exit.bat"
if %aufcho%==c call "%nowpath%\Exit.bat"
echo invalid choice... Try again...
timeout 6
goto AUTOUPDATEFALSE

:AUSETUP
::clear before outputs
cls
::credits
echo %CREDIT0%&echo %CREDIT1%&echo %CREDIT2%&echo %CREDIT4%&echo %CREDIT5%&echo %CREDIT6%&echo %CREDIT7%&echo %CREDIT8%
::tab title
echo [ Auto Update Setup ]
echo.
::steps
echo Setting Auto Update for Hotspot Maker...
echo (Please wait...)
::shedule task to run at computer startup
SCHTASKS /CREATE /SC ONLOGON /TN "HotspotMaker\AutoUpdate" /TR "%nowpath%\MiniUpdater.bat" /RL HIGHEST
::generate true file for this oparation
echo taskadded>"C:\ProgramData\HotspotMakerData\AutoUpdate.nnb"
echo Compleated!
echo.
::user choicess
echo A - Home&echo B - Exit
echo.
set/p "ausetupcho=>"
if %ausetupcho%==A call "%nowpath%\Home.bat"
if %ausetupcho%==a call "%nowpath%\Home.bat"
if %ausetupcho%==B call "%nowpath%\Exit.bat"
if %ausetupcho%==b call "%nowpath%\Exit.bat"
echo invalid choice... Try again...
timeout 6
call "%nowpath%\Home.bat"

:AUTOUPDATETRUE
::clear before outputs
cls
::credits
echo %CREDIT0%&echo %CREDIT1%&echo %CREDIT2%&echo %CREDIT4%&echo %CREDIT5%&echo %CREDIT6%&echo %CREDIT7%&echo %CREDIT8%
::tab title
echo [ Auto Update Change ]
echo.
::comments
echo Do you want to stop the Auto Update...?
echo.
::user choicess
echo A - Continue&echo B - Cancle and back to Home&echo C - Exit
echo.
set/p "autcho=>"
if %autcho%==A goto AUSTOP
if %autcho%==a goto AUSTOP
if %autcho%==B call "%nowpath%\Home.bat"
if %autcho%==b call "%nowpath%\Home.bat"
if %autcho%==C call "%nowpath%\Exit.bat"
if %autcho%==c call "%nowpath%\Exit.bat"
echo invalid choice... Try again...
timeout 6
goto AUTOUPDATETRUE

:AUSTOP
::clear before outputs
cls
::credits
echo %CREDIT0%&echo %CREDIT1%&echo %CREDIT2%&echo %CREDIT4%&echo %CREDIT5%&echo %CREDIT6%&echo %CREDIT7%&echo %CREDIT8%
::tab title
echo [ Auto Update Change Setup ]
echo.
::steps
echo Removing Auto Update for Hotspot Maker...
echo (Please wait...)
::remove sheduled task
echo Press [Y] and [ENTER] to continue...
SCHTASKS /DELETE /TN "HotspotMaker\AutoUpdate"
::remove generated true file for true oparation
del "C:\ProgramData\HotspotMakerData\AutoUpdate.nnb"
echo Compleated!
echo.
::user choicess
echo A - Home&echo B - Exit
echo.
set/p "ausetuptcho=>"
if %ausetuptcho%==A call "%nowpath%\Home.bat"
if %ausetuptcho%==a call "%nowpath%\Home.bat"
if %ausetuptcho%==B call "%nowpath%\Exit.bat"
if %ausetuptcho%==b call "%nowpath%\Exit.bat"
echo invalid choice... Try again...
timeout 6
call "%nowpath%\Home.bat"