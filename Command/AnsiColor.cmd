@ECHO OFF
:: ----------------------------------------------------------------------
:: Backup
:: ----------------------------------------------------------------------
CALL :saveActualCodePage
:: ----------------------------------------------------------------------
::
:: ----------------------------------------------------------------------
:: 185:╣ 186:║ 187:╗ 188:╝ 200:╚ 201:╔ 202:╩ 203:╦ 204:╠ 205:═ 206:╬
ECHO.
ECHO WARN: [91mWindows version 1909 or newer.[0m 
ECHO "[94mESC[0m" mean ESCAPE Char,
ECHO. To do it type "[94mALT+027[0m" in a text editor such Notepad++
ECHO.
ECHO ╔══════════════════════════════╦════════════╦════════════╦═════════════╗
ECHO ║ Color description            ║ Foreground ║ Background ║ COLOR (cmd) ║
ECHO ╠══════════════════════════════╬════════════╬════════════╬═════════════╣
ECHO ║[30m[107m Black BLACK                  [0m║ Esc[30m    ║ Esc[40m    ║ 0           ║
ECHO ║[31m Red DARK_RED                 [0m║ Esc[31m    ║ Esc[41m    ║ 4           ║
ECHO ║[32m Green DARK_GREEN             [0m║ Esc[32m    ║ Esc[42m    ║ 2           ║
ECHO ║[33m Yellow DARK_YELLOW           [0m║ Esc[33m    ║ Esc[43m    ║ 6           ║
ECHO ║[34m Blue DARK_BLUE               [0m║ Esc[34m    ║ Esc[44m    ║ 1           ║
ECHO ║[35m Magenta DARK_MAGENTA         [0m║ Esc[35m    ║ Esc[45m    ║ 5           ║
ECHO ║[36m Cyan DARK_CYAN               [0m║ Esc[36m    ║ Esc[46m    ║ 3           ║
ECHO ║[37m Light gray DARK_WHITE        [0m║ Esc[37m    ║ Esc[47m    ║ 7           ║
ECHO ║[90m Dark gray BRIGHT_BLACK       [0m║ Esc[90m    ║ Esc[100m   ║ 8           ║
ECHO ║[91m Light red BRIGHT_RED         [0m║ Esc[91m    ║ Esc[101m   ║ C           ║
ECHO ║[92m Light green BRIGHT_GREEN     [0m║ Esc[92m    ║ Esc[102m   ║ A           ║
ECHO ║[93m Light yellow BRIGHT_YELLOW   [0m║ Esc[93m    ║ Esc[103m   ║ E           ║
ECHO ║[94m Light blue BRIGHT_BLUE       [0m║ Esc[94m    ║ Esc[104m   ║ 9           ║
ECHO ║[95m Light magenta BRIGHT_MAGENTA [0m║ Esc[95m    ║ Esc[105m   ║ D           ║
ECHO ║[96m Light cyan BRIGHT_CYAN       [0m║ Esc[96m    ║ Esc[106m   ║ B           ║
ECHO ║[97m White WHITE                  [0m║ Esc[97m    ║ Esc[107m   ║ F           ║
ECHO ╠══════════════════════════════╬════════════╬════════════╩═════════════╝
ECHO ║[1m Bold                         [0m║ Esc[1m     ║ (2)
ECHO ║ [4mUnderline[0m                    ║ Esc[4m     ║
ECHO ║[24m No underline                 [0m║ Esc[24m    ║
ECHO ║ [7mReverse text[0m                 ║ Esc[7m     ║
ECHO ║[27m Positive text (not reversed) [0m║ Esc[27m    ║
ECHO ║[0m Default                      [0m║ Esc[0m     ║ (1)
ECHO ╚══════════════════════════════╩════════════╝
ECHO.
ECHO (1): The Default is the colors set for the Command Window.
ECHO This depend about what you have choosen.
ECHO.
ECHO (2) Seem not working.
ECHO.
ECHO Color column is the number to use for the COLOR Command.
ECHO [91m/!\ COLOR XY change all the Foreground (Y) and Background (X)
ECHO     of the Window Command.[0m
ECHO.
:: ----------------------------------------------------------------------
GOTO:END
:: ----------------------------------------------------------------------
:: Sub routine for backup initial CHCP
:: ----------------------------------------------------------------------
:saveActualCodePage
FOR /F "tokens=1-6 delims= " %%A IN ('chcp') DO (
	SET codePageSaved=%%E
	CHCP 65001 > NUL
)
EXIT /B
:: ----------------------------------------------------------------------
:: END
:: ----------------------------------------------------------------------
:END
CHCP %codePageSaved% > NUL
SET codePageSaved=
