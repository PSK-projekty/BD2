load data 
infile '.\\Dane\\Wymiar_Samochod.csv' "str '\r\n'"
replace
into table WYMIAR_SAMOCHOD
fields terminated by ','
OPTIONALLY ENCLOSED BY '"' AND '"'
trailing nullcols
           ( ID_SAMOCHOD,
             ID_MODEL,
             ID_SALONU,
             ID_AKCESORIUM,
             NAPED CHAR(10),
             VIN CHAR(20),
             ROKPRODUKCJI,
             KOLOR CHAR(10)
           )
