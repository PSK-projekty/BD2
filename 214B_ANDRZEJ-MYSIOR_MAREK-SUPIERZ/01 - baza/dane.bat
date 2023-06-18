@echo off
set "user=c##DB2"
set "pass=toor" 
set "instance=xe"

sqlldr %user%/%pass%@%instance% CONTROL=Loader\miasto_slownik\miasto_slownik.ctl
sqlldr %user%/%pass%@%instance% CONTROL=Loader\ulica_slownik\ulica_slownik.ctl
sqlldr %user%/%pass%@%instance% CONTROL=Loader\adres\adres.ctl
sqlldr %user%/%pass%@%instance% CONTROL=Loader\akcesoria\akcesoria.ctl
sqlldr %user%/%pass%@%instance% CONTROL=Loader\model\model.ctl
sqlldr %user%/%pass%@%instance% CONTROL=Loader\silniki\silniki.ctl
sqlldr %user%/%pass%@%instance% CONTROL=Loader\stanowiska\stanowiska.ctl
sqlldr %user%/%pass%@%instance% CONTROL=Loader\czesci\czesci.ctl
sqlldr %user%/%pass%@%instance% CONTROL=Loader\dodatkowe_wyposazenie\dodatkowe_wyposazenie.ctl
sqlldr %user%/%pass%@%instance% CONTROL=Loader\wersja_wyposazenia\wersja_wyposazenia.ctl
sqlldr %user%/%pass%@%instance% CONTROL=Loader\salon_samochodowy\salon_samochodowy.ctl
sqlldr %user%/%pass%@%instance% CONTROL=Loader\klient\klient.ctl
sqlldr %user%/%pass%@%instance% CONTROL=Loader\pracownicy\pracownicy.ctl
sqlldr %user%/%pass%@%instance% CONTROL=Loader\samochod\samochod.ctl
sqlldr %user%/%pass%@%instance% CONTROL=Loader\jazda_probna\jazda_probna.ctl
sqlldr %user%/%pass%@%instance% CONTROL=Loader\magazyn\magazyn.ctl
sqlldr %user%/%pass%@%instance% CONTROL=Loader\naprawa\naprawa.ctl
sqlldr %user%/%pass%@%instance% CONTROL=Loader\czesci_samochod\czesci_samochod.ctl
sqlldr %user%/%pass%@%instance% CONTROL=Loader\dodatkowe_samochod\dodatkowe_samochod.ctl
sqlldr %user%/%pass%@%instance% CONTROL=Loader\akcesoria_samochod\akcesoria_samochod.ctl
sqlldr %user%/%pass%@%instance% CONTROL=Loader\wynajem\wynajem.ctl
sqlldr %user%/%pass%@%instance% CONTROL=Loader\sprzedaz\sprzedaz.ctl
sqlldr %user%/%pass%@%instance% CONTROL=Loader\platnosc\platnosc.ctl
move *.log Log
PAUSE