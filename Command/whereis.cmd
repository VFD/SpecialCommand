:: ------------------------------------------------------------
:: An equivalent for whereis
:: Search in the PATH
:: ------------------------------------------------------------
@for %%e in (%PATHEXT%) do @for %%i in (%1%%e) do @if NOT "%%~$PATH:i"=="" echo %%~$PATH:i
:: -----[EOF]--------------------------------------------------