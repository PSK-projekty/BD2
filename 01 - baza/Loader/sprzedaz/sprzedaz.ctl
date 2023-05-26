load data 
infile '.\\Dane\\sprzedaz.csv' "str '\r\n'"
replace
into table SPRZEDAZ
fields terminated by ','
OPTIONALLY ENCLOSED BY '"' AND '"'
trailing nullcols
           ( ID_SPRZEDAZ,
             ID_SAMOCHOD,
             ID_AKCESORIUM,
             ID_PRACOWNIK,
             ID_KLIENT,
             ID_CZESC,
             ID_WYNAJEM,
             ID_WERSJA,
             ID_NAPRAWA,
             ID_SALON,
             DATA DATE "YYYY-MM-DD",
             KWOTA
           )
