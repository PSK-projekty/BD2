load data 
infile '.\\Dane\\miasto_slownik.csv' "str '\r\n'"
replace
into table MIASTO_SLOWNIK
fields terminated by ','
OPTIONALLY ENCLOSED BY '"' AND '"'
trailing nullcols
           ( ID_MIASTO,
             NAZWA_MIASTA CHAR(100)
           )
