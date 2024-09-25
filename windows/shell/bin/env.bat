@echo off
setlocal enableDelayedExpansion
rem env @ --help

set sign=@
set "env=%*"
set command=
set input= 

:loop  
  set /p input="[env] %env% $ "
  if "!input!" equ "/quit" (goto:eof)

  rem iteration on the env to reaplace the sign by comm
  for %%c in (%env%) do (
    if "%%c" equ "%sign%" (
      set "command=!command! !input!"
    ) else (
      set "command=!command! %%c"
    )
  )

  echo running [!command! ]
  echo.
  call !command!
  @echo off

  set command=
  set input=

goto:loop
echo on