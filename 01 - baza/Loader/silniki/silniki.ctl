load data 
infile '.\\Dane\\silniki.csv' "str '\r\n'"
replace
into table SILNIKI
fields terminated by ','
OPTIONALLY ENCLOSED BY '"' AND '"'
trailing nullcols
           ( ID_SILNIK,
             POJEMNOSC,
             MOC_KW,
             MOC_KM,
             MOMENT_OBROTOWY,
             TYP_SILNIKA CHAR(20),
             PALIWO CHAR(20),
             NUMER CHAR(15)
           )
