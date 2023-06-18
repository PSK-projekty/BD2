load data 
infile '.\\Dane\\ulica_slownik.csv' "str '\r\n'"
replace
into table ULICA_SLOWNIK
fields terminated by ','
OPTIONALLY ENCLOSED BY '"' AND '"'
trailing nullcols
           ( ID_ULICA,
             ID_MIASTO,
             NAZWA_ULICY CHAR(100)
           )
