load data 
infile '.\\Dane\\Wymiar_Salon.csv' "str '\r\n'"
replace
into table WYMIAR_SALON
fields terminated by ','
OPTIONALLY ENCLOSED BY '"' AND '"'
trailing nullcols
           ( ID_SALONU,
             ID_ADRES,
             NAZWA CHAR(100)
           )
