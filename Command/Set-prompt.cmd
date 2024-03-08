@ECHO OFF
:: ============================================================
:: Script:  Set-prompt.cmd
:: Comment: Change the prompt
:: ============================================================
:: ------------------------------------------------------------
:: Trap infos
:: ------------------------------------------------------------
SET Domain=%USERDNSDOMAIN%
SET User=%USERNAME%
:: ------------------------------------------------------------
:: Make Lower case
:: ------------------------------------------------------------
CALL :LoCase Domain
CALL :LoCase User
:: ------------------------------------------------------------
:: Build nice Prompt using ANSI color and this (case sensitive)
:: $A : Ampersand &
:: $B : Pipe |
:: $C : Left parenthesis (
:: $D : Current date
:: $E : Escape code (ASCII code 27) (Alt+027)
:: $F : Right parenthesis )
:: $G : Greater-than sign >
:: $H : Backspace (erases previous character)
:: $L : Less-than sign <
:: $N : Current drive
:: $P : Current drive and path
:: $Q : Equal sign =
:: $S : Space
:: $T : Current time
:: $V : Windows version number
:: $_ : Carriage return and linefeed
:: $$ : Dollar sign $
:: ------------------------------------------------------------
PROMPT $_[$E[97m$D$B$T$E[0m]$S$E[92m%User%@%Domain%$E[0m$Son$S$E[93m%COMPUTERNAME%$E[0m$_$G$E[91m$P$E[0m$L$_$S¢$G$S
GOTO END
:: ------------------------------------------------------------
:: Subroutine to convert the argument to all lower case.
:: ------------------------------------------------------------
:LoCase
FOR %%i IN ("A=a" "B=b" "C=c" "D=d" "E=e" "F=f" "G=g" "H=h" "I=i" "J=j" "K=k" "L=l" "M=m" "N=n" "O=o" "P=p" "Q=q" "R=r" "S=s" "T=t" "U=u" "V=v" "W=w" "X=x" "Y=y" "Z=z") DO CALL SET "%1=%%%1:%%~i%%"
EXIT /B
:: ------------------------------------------------------------
:: END
:: ------------------------------------------------------------
SET Domain=
SET User=
:END
:: -----[EOF]--------------------------------------------------