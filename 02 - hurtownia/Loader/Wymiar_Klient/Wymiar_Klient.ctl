load data 
infile '.\\Dane\\Wymiar_Klient.csv' "str '\r\n'"
replace
into table WYMIAR_KLIENT
fields terminated by ','
OPTIONALLY ENCLOSED BY '"' AND '"'
trailing nullcols
           ( ID_KLIENT,
             ID_ADRES,
             IIMIE CHAR(100),
             NAZWISKO CHAR(100)
           )
