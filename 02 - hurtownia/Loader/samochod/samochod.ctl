load data 
infile '.\\Dane\\samochod.csv' "str '\r\n'"
replace
into table SAMOCHOD
fields terminated by ','
OPTIONALLY ENCLOSED BY '"' AND '"'
trailing nullcols
           ( ID_SAMOCHODU,
             ID_MODEL,
             ID_SALONU,
             ID_WERSJA,
             ID_SILNIK,
             ID_WYPOSAZENIE,
             NAPED CHAR(10),
             KOLOR CHAR(10),
             VIN CHAR(20),
             ROKPRODUKCJI,
             PRZEBIEG,
             CENA
           )
