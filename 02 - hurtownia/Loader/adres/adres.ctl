load data 
infile '.\\Dane\\adres.csv' "str '\r\n'"
replace
into table ADRES
fields terminated by ','
OPTIONALLY ENCLOSED BY '"' AND '"'
trailing nullcols
           ( ID_ADRES,
             MIASTO CHAR(100),
             MIEJSCOWOSC CHAR(100),
             NUMER_DOMU CHAR(3),
             NUMER_MIESZKANIA CHAR(3),
             KOD_POCZTOWY CHAR(10),
             ULICA CHAR(100)
           )