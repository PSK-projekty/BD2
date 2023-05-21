load data 
infile '.\\Dane\\salon_samochodowy.csv' "str '\r\n'"
replace
into table SALON_SAMOCHODOWY
fields terminated by ','
OPTIONALLY ENCLOSED BY '"' AND '"'
trailing nullcols
           ( ID_SALONU,
             ID_ADRES,
             NAZWA CHAR(100)
           )
