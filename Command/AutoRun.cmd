@ECHO OFF
:: ============================================================
:: Script:  AutoRun.cmd
:: Comment: To be use with a CMD shortcup
:: so this act as a profile you can found on *nix
:: ============================================================
:: ------------------------------------------------------------
:: call evrything you need
:: ------------------------------------------------------------
:: put CMD in UTF8 mode, because other sucks
CALL Set-cpUTF8
:: Build specific prompt using UTF8 char
CALL Set-prompt
:: ------------------------------------------------------------
:: Welcome the user
:: ------------------------------------------------------------
ECHO.
ECHO Welcome to the machine %USERNAME%.
ECHO.
:: ------------------------------------------------------------
:: END
:: ------------------------------------------------------------
:END
:: -----[EOF]--------------------------------------------------