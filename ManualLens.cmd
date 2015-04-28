@echo off

cls
echo ===============================================================================
echo  Manual Lens into EXIF data
echo ===============================================================================
echo [1] 12mm f/2.0         Samyang
echo [2] 50mm f/1.4         Canon FD
echo [3] 85mm f/1.8         Canon FDn
echo [4] 70-210mm f/4.0     Canon FDn
echo [x] Exit
echo.
set /p UserChoice=Please choose which lens to put into EXIF data: 
echo.
echo.
goto CHOICE_%UserChoice%



:CHOICE_1
set myLens="12.0 mm"
set myFocalLength="12.0 mm"
set myFocalLength35="18 mm"
set myLensInfo="12mm f/?"
set myLensModel="12.0 mm"
set myDNGLensInfo="12mm f/?"
goto doit

:CHOICE_2
set myLens="50.0 mm"
set myFocalLength="50.0 mm"
set myFocalLength35="75 mm"
set myLensInfo="50mm f/?"
set myLensModel="50.0 mm"
set myDNGLensInfo="50mm f/?"
goto doit

:CHOICE_3
set myLens="85.0 mm"
set myFocalLength="85.0 mm"
set myFocalLength35="128 mm"
set myLensInfo="85mm f/?"
set myLensModel="85.0 mm"
set myDNGLensInfo="85mm f/?"
goto doit

:CHOICE_4
set myLens="70-210.0 mm"
set myFocalLength="70-210.0 mm"
set myFocalLength35="105-315.0 mm"
set myLensInfo="70-210mm f/?"
set myLensModel="70-210.0 mm"
set myDNGLensInfo="70-210mm f/?"
goto doit

:CHOICE_X
goto end

:doit
for %%a in (%*) do (
		echo * %%a
		"C:\Program Files (x86)\exiftoolgui\exiftool.exe" -overwrite_original -Lens=%myLens% -FocalLength=%myFocalLength% -FocalLengthIn35mmFormat=%myFocalLength35% -LensInfo=%myLensInfo% -LensModel=%myLensModel% -DNGLensInfo=%myDNGLensInfo% %%a
		echo.
)
pause

:end
