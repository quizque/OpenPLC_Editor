@echo off
echo Checking python...
python --version 2>NUL
if errorlevel 1 goto errorNoPython
echo Done!

if exist venv\ (
	goto activateVenv
) else (
	echo Creating venv, please wait...
	python -m venv venv/
	call venv\Scripts\activate.bat
	echo Done!
)

:activateVenv
call venv\Scripts\activate.bat

echo Checking pip...
if exist piplock (
	echo Done!
) else (
	echo Installing requiremnts...
	pip install -r requirements.txt
	echo Done!
	echo . > piplock
)


call python ".\editor\Beremiz.py"
pause

goto:eof

:errorNoPython
echo.
echo Error: Python not installed
