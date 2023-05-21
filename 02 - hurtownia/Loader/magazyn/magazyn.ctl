load data 
infile '.\\Dane\\magazyn.csv' "str '\r\n'"
replace
into table MAGAZYN
fields terminated by ','
OPTIONALLY ENCLOSED BY '"' AND '"'
trailing nullcols
           ( ID_MAGAZYN,
             ID_SAMOCHOD,
             ID_SILNIK,
             ID_CZESC,
             ID_AKCESORIUM,
             ILOSC
           )
