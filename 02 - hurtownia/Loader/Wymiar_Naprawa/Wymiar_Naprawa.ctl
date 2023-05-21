load data 
infile '.\\Dane\\Wymiar_Naprawa.csv' "str '\r\n'"
replace
into table WYMIAR_NAPRAWA
fields terminated by ','
OPTIONALLY ENCLOSED BY '"' AND '"'
trailing nullcols
           ( ID_NAPRAWA,
             ID_SAMOCHOD,
             TYP_NAPRAWY CHAR(15),
             DATA_PRZYJECIA DATE "YYYY-MM-DD",
             CENA
           )
