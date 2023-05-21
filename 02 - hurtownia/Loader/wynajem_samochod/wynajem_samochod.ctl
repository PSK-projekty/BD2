load data 
infile '.\\Dane\\wynajem_samochod.csv' "str '\r\n'"
replace
into table WYNAJEM_SAMOCHOD
fields terminated by ','
OPTIONALLY ENCLOSED BY '"' AND '"'
trailing nullcols
           ( ID_WYNAJEM_SAMOCHOD,
             ID_WYNAJEM,
             ID_SAMOCHOD
           )
