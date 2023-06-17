load data 
infile '.\\Dane\\adres.csv' "str '\r\n'"
replace
into table ADRES
fields terminated by ','
OPTIONALLY ENCLOSED BY '"' AND '"'
trailing nullcols
           ( ID_ADRES,
             ID_ULICA,
             NUMER_DOMU CHAR(3),
             NUMER_MIESZKANIA CHAR(3)
           )