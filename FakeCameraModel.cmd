@echo off

cls
echo ===============================================================================
echo  Fake Unique Camera Model
echo ===============================================================================
echo [1] Fujifilm X-E2
echo [2] Fujifilm X-T1
echo [3] Fujifilm X100S
echo [4] Fujifilm X100T
echo [x] Exit
echo.
set /p UserChoice=Please choose which camera model to put into EXIF data: 
echo.
echo.
goto CHOICE_%UserChoice%



:CHOICE_1
set myUniqueCameraModel="Fujifilm X-E2"
goto doit

:CHOICE_2
set myUniqueCameraModel="Fujifilm X-T1"
goto doit

:CHOICE_3
set myUniqueCameraModel="Fujifilm X100S"
goto doit

:CHOICE_4
set myUniqueCameraModel="Fujifilm X100T"
goto doit


:CHOICE_X
goto end

:doit
for %%a in (%*) do (
		echo * %%a
		"C:\Program Files (x86)\exiftoolgui\exiftool.exe" -overwrite_original -ifd0:UniqueCameraModel=%myUniqueCameraModel% %%a
		echo.
)
pause

:end
