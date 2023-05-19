load data 
infile '.\\Dane\\platnosc.csv' "str '\r\n'"
replace
into table PLATNOSC
fields terminated by ','
OPTIONALLY ENCLOSED BY '"' AND '"'
trailing nullcols
           ( ID_PLATNOSC,
             ID_SPRZEDAZ,
             RODZAJ_DOKUMENTU CHAR(10),
             FORMA_PLATNOSCI CHAR(10),
             DATA DATE "YYYY-MM-DD"
           )
