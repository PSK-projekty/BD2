@echo off
set "user=c##DB2
set "pass=toor"
set "instance=xe"

sqlldr %user%/%pass%@%instance% CONTROL=Loader\Wymiar_Adres\Wymiar_Adres.ctl
sqlldr %user%/%pass%@%instance% CONTROL=Loader\Wymiar_Akcesoria\Wymiar_Akcesoria.ctl
sqlldr %user%/%pass%@%instance% CONTROL=Loader\Wymiar_Model\Wymiar_Model.ctl
sqlldr %user%/%pass%@%instance% CONTROL=Loader\Wymiar_Stanowisko\Wymiar_Stanowiska.ctl
sqlldr %user%/%pass%@%instance% CONTROL=Loader\Wymiar_Salon\Wymiar_Salon.ctl
sqlldr %user%/%pass%@%instance% CONTROL=Loader\Wymiar_Klient\Wymiar_Klient.ctl
sqlldr %user%/%pass%@%instance% CONTROL=Loader\Wymiar_Pracownik\Wymiar_Pracownicy.ctl
sqlldr %user%/%pass%@%instance% CONTROL=Loader\Wymiar_Samochod\Wymiar_Samochod.ctl
sqlldr %user%/%pass%@%instance% CONTROL=Loader\Wymiar_Naprawa\Wymiar_Naprawa.ctl
sqlldr %user%/%pass%@%instance% CONTROL=Loader\Fakt_Sprzedaz\Fakt_Sprzedaz.ctl
move *.log Log
PAUSE