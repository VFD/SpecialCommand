@ECHO OFF
CLS
::
::=============================================================================
:: Script:  Backupme.cmd
:: Comment: Backup All from run point to another drive
:: Version: v20221107
::=============================================================================
::
:: help here for cmd: https://ss64.com/nt/
:: ANSI Color: https://ss64.com/nt/syntax-ansi.html
:: "ESC[xxm" to do it type ALT+027
:: see: https://altcodeunicode.com/
::
::-----------------------------------------------------------------------------
:: Display the ANSI colours ESC[xxm
:: Requires Windows 1909 or newer
::-----------------------------------------------------------------------------
CALL :saveActualCodePage
::-----------------------------------------------------------------------------
ECHO. [31m
ECHO               ____             _                
ECHO              ^|  _ \           ^| ^|               
ECHO              ^| ^|_) ^| __ _  ___^| ^| ___   _ _ __  
ECHO              ^|  _ ^< / _` ^|/ __^| ^|/ / ^| ^| ^| '_ \ 
ECHO              ^| ^|_) ^| (_^| ^| (__^|   ^<^| ^|_^| ^| ^|_) ^|
ECHO              ^|____/ __________^|_^|\_\\__,_^| .__/ 
ECHO                    ^|__   __^|        ^| ^|  ^| ^|    
ECHO                       ^| ^| ___   ___ ^| ^|  ^|_^|    
ECHO                       ^| ^|/ _ \ / _ \^| ^|         
ECHO                       ^| ^| (_) ^| (_) ^| ^|         
ECHO                       ^|_^|\___/ \___/^|_^|         
ECHO.
::-----------------------------------------------------------------------------
ECHO.[97m
ECHO ╔═════════════════════════════════════════════════════════════════════════════╗
ECHO ║                                                                             ║
ECHO ║                    Runing script: %0.cmd                             ║ 
ECHO ║                                                                             ║
ECHO ║ Backup all the directory and subdirectory where you are (CD)                ║
ECHO ║ To another drive you specify (mirror)                                       ║
ECHO ║ Duplicate an USB key is possible: start backup at root                      ║
ECHO ║ So, be careful                                                              ║
ECHO ║ [31mCTRL+C[97m to cancel this cmd file                                              ║
ECHO ║                                                                             ║
ECHO ╚═════════════════════════════════════════════════════════════════════════════╝
ECHO.[0m
::-----------------------------------------------------------------------------
SETLOCAL
::-----------------------------------------------------------------------------
::                           /!\   WARNING   /!\
:: %~dp0 is the directory of the batch (\ at the end... is escape char!)
:: %~dp0 is not necessary the current path
:: %CD% IS the current path (drive include, 2 char) Always no \ at the end
:: %CD:~2% IS the current path whithout drive letter (2 char)
::-----------------------------------------------------------------------------
SET Source=%CD%
::-----------------------------------------------------------------------------
:: Destination drive
:: TO DO: reduce to 1 char
::-----------------------------------------------------------------------------
SET /P ChoosenDrive=Enter destination drive (1 letter please): || SET ChoosenDrive=
IF NOT DEFINED ChoosenDrive GOTO NoDrive
CALL :UpCase ChoosenDrive
SET ChoosenDrive=%ChoosenDrive%:
SET Dest=%ChoosenDrive%%CD:~2%
::-----[Reduce or not destination]---------------------------------------------------------
ECHO Backup will be here: [91m %Dest% [92m
CHOICE /C:YN /N /T 10 /D N /M "Reduce %Dest% (no tree) (Y/N)?"
IF %ERRORLEVEL% EQU 2 GOTO CONFIRM
IF %ERRORLEVEL% EQU 1 GOTO REDUCE
GOTO END
::-----[Reduce]----------------------------------------------------------------------------
:REDUCE
FOR %%* IN (.) DO SET Dest=%ChoosenDrive%\%%~n*
GOTO CONFIRM
GOTO END
::-----[Confirm]---------------------------------------------------------------------------
:CONFIRM
ECHO.
ECHO You choose drive:    [91m %ChoosenDrive% [92m
ECHO Backup will be here: [91m %Dest% [92m
ECHO.
::-----[Are you sure?]---------------------------------------------------------
CHOICE /C:YN /N /T 10 /D N /M "Are you sure (Y/N)?"
IF %ERRORLEVEL% EQU 2 GOTO NoDrive
IF %ERRORLEVEL% EQU 1 GOTO MAIN
GOTO END
::-----------------------------------------------------------------------------
:: MAIN
::-----------------------------------------------------------------------------
:MAIN
::-----[Timestamp]-------------------------------------------------------------
CALL :TimeStamp Start
::-----------------------------------------------------------------------------
:: Using robocopy
:: /V Verbose
:: /E All
:: /MIR Mirror (destination will be same as source) so delete is active in destination
:: /MT[:16] use 16 Threads
:: /J no temp
::-----------------------------------------------------------------------------
robocopy "%Source%" "%Dest%" /V /E /J /MIR /MT[:16]
GOTO END
::-----------------------------------------------------------------------------
:: If No Drive Specofied
::-----------------------------------------------------------------------------
:NoDrive
ECHO.
ECHO [91m          ==== NO choice, NO Backup, END ==== [92m
ECHO.
GOTO END
::-----------------------------------------------------------------------------
:: Subroutine for Timestamp
::-----------------------------------------------------------------------------
:TimeStamp
ECHO.
ECHO [97m          %1 Backup: %DATE% - %TIME% [92m
ECHO.
EXIT /B
::-----------------------------------------------------------------------------
:: Subroutine to convert a variable VALUE to all UPPER CASE
:: The argument for this subroutine is the variable
::-----------------------------------------------------------------------------
:UpCase
FOR %%i IN ("a=A" "b=B" "c=C" "d=D" "e=E" "f=F" "g=G" "h=H" "i=I" "j=J" "k=K" "l=L" "m=M" "n=N" "o=O" "p=P" "q=Q" "r=R" "s=S" "t=T" "u=U" "v=V" "w=W" "x=X" "y=Y" "z=Z") DO CALL SET "%1=%%%1:%%~i%%"
EXIT /B
:: ----------------------------------------------------------------------
:: Sub routine for backup initial CHCP
:: ----------------------------------------------------------------------
:saveActualCodePage
FOR /F "tokens=1-6 delims= " %%A IN ('chcp') DO (
	SET codePageSaved=%%E
	CHCP 65001 > NUL
)
EXIT /B
::-----------------------------------------------------------------------------
:: End of script
::-----------------------------------------------------------------------------
:END
::-----[Timestamp]-------------------------------------------------------------
CALL :TimeStamp End
::
CHCP %codePageSaved% > NUL
SET codePageSaved=
::
ENDLOCAL
::PAUSE
ECHO [0m
:EOF