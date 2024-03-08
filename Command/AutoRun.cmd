@ECHO OFF
:: ============================================================
:: Script:  AutoRun.cmd
:: Comment: To be use with a CMD shortcut
:: so this act as a profile you can found on *nix
:: ============================================================
:: ------------------------------------------------------------
:: call everything you need
:: ------------------------------------------------------------
:: Set Title up to 243 characters.
Title The %USERNAME% machine
:: put CMD in UTF8 mode, because other sucks
CALL Set-cpUTF8
:: Build specific prompt using UTF8 char
CALL Set-prompt
:: ------------------------------------------------------------
:: Welcome the user
:: ------------------------------------------------------------
VER
ECHO Welcome to the machine %USERNAME%.
ECHO.
:: ------------------------------------------------------------
:: END
:: ------------------------------------------------------------
:END
:: -----[EOF]--------------------------------------------------