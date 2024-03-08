@ECHO OFF
:: ----------------------------------------------------------------------
:: Add NODE.JS to the PATH only if you launch this
:: ----------------------------------------------------------------------

:: no \ at the end for add to the path
SET nodePath=%USERPROFILE%\Programs\node

ECHO.
ECHO The NODE.JS path to try:
ECHO %nodePath%
ECHO.
:: ----------------------------------------------------------------------
:: eq Try/Catch
:: ----------------------------------------------------------------------
IF /I EXIST "%nodePath%\node.exe" (
	ECHO.
	ECHO node.exe located in %nodePath%
	ECHO.
	GOTO pathNodejs
) ELSE (
	ECHO.
	ECHO node.exe not found in %nodePath%
	ECHO Check your directories.
	ECHO.
)
GOTO END
:: ----------------------------------------------------------------------
:: if ok add to PATH
:: ----------------------------------------------------------------------
:pathNodejs
SET PATH=%nodePath%;%PATH%
ECHO New PATH =
ECHO %PATH%
ECHO.
:: ----------------------------------------------------------------------
:: End of script, remove variable
:: ----------------------------------------------------------------------
:END
SET nodePath=
:: -----[EOF]------------------------------------------------------------