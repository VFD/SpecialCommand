@ECHO OFF
CLS
::COLOR 0A
SETLOCAL
::
:: This script use the ANSI color ESC[XYm scheme color
:: "OEM 850"
:: https://www.robvanderwoude.com/escapechars.php
ECHO.
ECHO When you start a CMD or BAT File it's important to know where you are.
ECHO This mean in what Directory.
ECHO.
ECHO With last Windows OS avoid using .BAT, use only .CMD.
ECHO.
ECHO There is two possibilities for having informations:
ECHO.
ECHO        - The directory of the file.
ECHO        - The directory where realy you are.
ECHO.
ECHO Let's see that.
::-----------------------------------------------------------------------------
::PAUSE > NUL
::CLS
ECHO.
ECHO [4mThe file:[0m
ECHO.
ECHO If you need to know something about the file, you can use:
ECHO.
ECHO ._________.____________________________________________________.
ECHO ^|[7m Code    [0m^|[7m Result                                             [0m^|
ECHO ._________.____________________________________________________.
ECHO ^| [93m%%~d0[0m    ^| Drive of the file                                  ^|
ECHO ^| [93m%%~dp0[0m   ^| Drive and Path of the file                         ^|
ECHO ^| [93m%%~dpn0[0m  ^| Drive, Path and name of the file                   ^|
ECHO ^| [93m%%~dpnx0[0m ^| Drive, Path, name and extension of the file        ^|
ECHO ._________.____________________________________________________.
ECHO ^| [93m%%~f0[0m    ^| Drive, Path, name and extension of the file        ^|
ECHO ._________.____________________________________________________.
ECHO ^| [93m%%~p0[0m    ^| Path, no drive, no name, no extension of the file  ^|
ECHO ._________.____________________________________________________.
ECHO ^| [93m%%~n0[0m    ^| Name of the file, no extension                     ^|
ECHO ^| [93m%%~x0[0m    ^| extension of the file                              ^|
ECHO ^| [93m%%~nx0[0m   ^| Name of the file with extension                    ^|
ECHO ._________.____________________________________________________.
ECHO ^| [93m%%~s0[0m    ^| Contains short names only                          ^|
ECHO ._________.____________________________________________________.
ECHO ^| [93m%%~t0[0m    ^| Contains date/time of file                         ^|
ECHO ._________.____________________________________________________.
ECHO ^| [93m%%~z0[0m    ^| Contains size of the file                          ^|
ECHO ._________.____________________________________________________.
ECHO ^| [93m%%~a0[0m    ^| Contains attributs of the file                     ^|
ECHO ._________.____________________________________________________.
ECHO.
ECHO ~ Mandatory, else it's interpreted as a variable like %%d0.
ECHO 0 mean the file itself, so this is the command file you start
ECHO 1, these mean 1st arg of the command file.
ECHO n, these mean the nth arg of the command file and so on.
ECHO.
ECHO If you have a ligne in your command file with only [93m%%~d0[0m.
ECHO It's interpreted as if you type it.
ECHO [93m%%~d0[0m send you to the drive of the command file.
ECHO Not necessary inside the directory of the command file, but the last
ECHO directory use on this drive.
ECHO.
ECHO So, [91mbe careful with the use of this commands.[0m
ECHO.
::PAUSE > NUL
::-----------------------------------------------------------------------------
::CLS
ECHO.
ECHO [4mThe file Examples:[0m
ECHO.
ECHO Note that there is no " in the results.
ECHO.
ECHO Drive of the file (%%~d0):
ECHO [93m%~d0[0m
ECHO.
ECHO Drive and Path of the file (%%~dp0):
ECHO [93m%~dp0[0m
ECHO.
ECHO Drive, Path and name of the file (%%~dpn0):
ECHO [93m%~dpn0[0m
ECHO.
ECHO Drive, Path, name and extension of the file (%%~dpnx0):
ECHO [93m%~dpnx0[0m
ECHO.
ECHO Drive, Path, name and extension of the file (%%~f0):
ECHO [93m%~f0[0m
ECHO.
ECHO Path, no drive, no name, no extension of the file (%%~p0):
ECHO [93m%~p0[0m
ECHO.
ECHO Name of the file, no extension (%%~n0):
ECHO [93m%~n0[0m
ECHO.
ECHO Name of the file with extension (%%~nx0):
ECHO [93m%~nx0[0m
ECHO.
ECHO Extension of the file (%%~x0):
ECHO [93m%~x0[0m
ECHO.
ECHO Path contains short names only (%%~s0):
ECHO [93m%~s0[0m
ECHO.
ECHO Give date/time of file (%%~t):
ECHO [93m%~t0[0m
ECHO.
ECHO Give size of file (%%~z0):
ECHO [93m%~z0[0m
ECHO.
ECHO Give attributs of the file (%%~a0)
ECHO [93m%~a0[0m
ECHO.
::PAUSE > NUL
::-----------------------------------------------------------------------------
::CLS
ECHO.
ECHO [4mWhere I am:[0m
ECHO.
ECHO This can append when you change from drive to another or
ECHO you change from a directory to another.
ECHO.
ECHO There is only one command:
ECHO ._________.____________________________________________________.
ECHO ^|[7m Code    [0m^|[7m Result                                             [0m^|
ECHO ._________.____________________________________________________.
ECHO ^| [93m%%CD%%[0m   ^| Drive and Path of the file                          ^|
ECHO ._________.____________________________________________________.
ECHO.
ECHO This is very useful with [33mPUSHD[0m and [33mPOPD[0m.
ECHO.
ECHO Use like this: [33mPUSHD %%CD%%[0m
ECHO.
ECHO Then use [33mPOPD[0m to return where you come from.
ECHO.
::PAUSE > NUL
::-----------------------------------------------------------------------------
::CLS
ECHO [4mWhere I am example:[0m
ECHO.
ECHO Drive, Path where I am:
ECHO.
ECHO [93m%CD%[0m
ECHO.
ECHO There is a difference with [93m%%~dp0[0m.
ECHO No \ at the end with [93m%%CD%%[0m.
ECHO.
ECHO Manipulation with [93m%%CD%%[0m:
ECHO.
ECHO   [93m%%CD%%[0m                  %CD%
ECHO   [93m%%CD:~2%%[0m               %CD:~2%
ECHO   [93m%%CD:~2,-5%%[0m            %CD:~2,-5%
ECHO   [93m%%CD:~-7%%[0m              %CD:~-7%
ECHO.
ECHO [93m%%CD%%[0m is a variable, that's why you can manipulate it.
ECHO.
ECHO See after how to.
ECHO.
::PAUSE > NUL
::-----------------------------------------------------------------------------
::CLS
ECHO [4mManipulate the result:[0m
ECHO.
ECHO There are additions to manipulate the results from the commands.
ECHO 1st, you need to use a variable, with [33mSET[0m.
ECHO Because this does not work directly.
ECHO.
ECHO Example: [97mSET MyVar=%%~dp0[0m
ECHO.
ECHO 2nd, at the end of the variable, you can add:
ECHO.
ECHO   [93m:~x,-y[0m        - refer from the end of the variable (right).
ECHO   [93m:~x,+y[0m        + refer from the begin of the variable (left).
ECHO.
ECHO   x and y are number. From 0 to ...
ECHO   x is the starting char, if 0, first, etc.
ECHO   y is the count, if 5, this mean five char.
ECHO.
ECHO   [93m:~4,+5[0m        From the 5th char from the left, take 5 char.
ECHO                 Count begin at 0, so 4 mean 5.
ECHO   [93m:~0,-7[0m        From the last char, trunc 7 char.
ECHO.
ECHO But unfortunatly, this [97m%%~dp0:~0,-1%%[0m does not work.
ECHO.
ECHO We set a variable [97m%%drive%%[0m and after we manipulate it.
ECHO.
ECHO   [93m%%drive:~0,-1%%[0m        Trunc 1 char from the end (right).
ECHO   [93m%%drive:~0,+2%%[0m        Keep 2 char from the beginning (left).
ECHO   [93m%%drive:~2%%[0m           Trunc 2 char from the beginning (left).
ECHO   [93m%%drive:~2,-1%%[0m        Trunc 2 char from the beginning (left),
ECHO                    and Trunc 1 char from the end (right).
ECHO   [93m%%drive:~-7%%[0m          Keep 7 char from the end (left).
ECHO.
SET drive=%~dp0
ECHO   [93m%%drive%%[0m              %drive%
ECHO   [93m%%drive:~0,-1%%[0m        %drive:~0,-1%
ECHO   [93m%%drive:~0,+2%%[0m        %drive:~0,+2%
ECHO   [93m%%drive:~2%%[0m           %drive:~2%
ECHO   [93m%%drive:~2,-1%%[0m        %drive:~2,-1%
ECHO   [93m%%drive:~-7%%[0m          %drive:~-7%
ECHO.
ECHO This manipulations works for any variable.
ECHO.
::PAUSE > NUL
::-----------------------------------------------------------------------------
::CLS
ECHO [4mWhat is the directory name:[0m
ECHO.
ECHO Sometimes you need to know the name of the directory which is ".".
ECHO You need to use FOR. No " in the return name.
ECHO.
ECHO	[93mFOR %%* IN (.) DO SET DirName=%%~n*[0m
ECHO.
ECHO.
FOR %%* IN (.) DO SET DirName=%%~n*
ECHO The directory name is: "[93m%DirName%[0m"
ECHO.
ENDLOCAL
::PAUSE > NUL
::-----------------------------------------------------------------------------
