load data 
infile '.\\Dane\\wynajem_klient.csv' "str '\r\n'"
replace
into table WYNAJEM_KLIENT
fields terminated by ','
OPTIONALLY ENCLOSED BY '"' AND '"'
trailing nullcols
           ( ID_WYNAJEM_KLIENT,
             ID_WYNAJEM,
             ID_KLIENT
           )
