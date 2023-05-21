load data 
infile '.\\Dane\\klient.csv' "str '\r\n'"
replace
into table KLIENT
fields terminated by ','
OPTIONALLY ENCLOSED BY '"' AND '"'
trailing nullcols
           ( ID_KLIENT,
             ID_ADRES,
             IMIE CHAR(100),
             NAZWISKO CHAR(100),
             EMAIL CHAR(100),
             TELEFON
           )
