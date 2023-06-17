@echo off
setlocal

set "targetFolder=F:\Semestr IV\Bazy danych 2\Projekt\01 - baza\Loader"
set "extension=.bad"

for /r "%targetFolder%" %%F in (*%extension%) do (
    echo Usuwanie: %%F
    del "%%F" /q
)
endlocal