load data 
infile '.\\Dane\\Wymiar_Adres.csv' "str '\r\n'"
replace
into table WYMIAR_ADRES
fields terminated by ','
OPTIONALLY ENCLOSED BY '"' AND '"'
trailing nullcols
           ( ID_ADRES,
             MIASTO CHAR(100)
           )
