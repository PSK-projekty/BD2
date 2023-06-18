load data 
infile '.\\Dane\\wynajem.csv' "str '\r\n'"
append
into table WYNAJEM
fields terminated by ','
OPTIONALLY ENCLOSED BY '"' AND '"'
trailing nullcols
           ( ID_WYNAJEM,
             ID_KLIENT,
             ID_SAMOCHOD,
             ID_PRACOWNIK,
             DATA_WYNAJMU DATE "RRRR-MM-DD",
             DATA_ZWROTU DATE "RRRR-MM-DD",
             CENA
           )
