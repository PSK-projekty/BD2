load data 
infile '.\\Dane\\dodatkowe_samochod.csv' "str '\r\n'"
replace
into table DODATKOWE_SAMOCHOD
fields terminated by ','
OPTIONALLY ENCLOSED BY '"' AND '"'
trailing nullcols
           ( ID_DODATKOWE_SAMOCHOD,
             ID_DODATKOWE,
             ID_SAMOCHOD
           )
