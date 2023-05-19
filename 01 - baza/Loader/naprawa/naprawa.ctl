load data 
infile '.\\Dane\\naprawa.csv' "str '\r\n'"
replace
into table NAPRAWA
fields terminated by ','
OPTIONALLY ENCLOSED BY '"' AND '"'
trailing nullcols
           ( ID_NAPRAWA,
             ID_SAMOCHOD,
             ID_PRACOWNIKA,
             ID_CZESC,
             TYP_NAPRAWY CHAR(15),
             DATA_PRZYJECIA DATE "YYYY-MM-DD",
             DATA_WYDANIA DATE "YYYY-MM-DD" NULLIF (DATA_WYDANIA = 'NULL'),
             CENA
           )
