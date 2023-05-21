load data 
infile '.\\Dane\\Fakt_Sprzedaz.csv' "str '\r\n'"
replace
into table FAKT_SPRZEDAZ
fields terminated by ','
OPTIONALLY ENCLOSED BY '"' AND '"'
trailing nullcols
           ( ID_SPRZEDAZ,
             ID_SAMOCHOD,
             ID_MODEL,
             ID_KLIENT,
             ID_PRACOWNIK,
             ID_STANOWISKO,
             ID_SALONU,
             ID_AKCESORIUM,
             ID_NAPRAWA,
             ID_ADRES,
             DATASPRZEDAZY DATE,
             KWOTA
           )
