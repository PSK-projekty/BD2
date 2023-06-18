load data 
infile '.\\Dane\\czesci.csv' "str '\r\n'"
replace
into table CZESCI
fields terminated by ','
OPTIONALLY ENCLOSED BY '"' AND '"'
trailing nullcols
           ( ID_CZESC,
             NAZWA CHAR(100),
             NUMER CHAR(15),
             CENA
           )
