load data 
infile '.\\Dane\\czesci_samochod.csv' "str '\r\n'"
replace
into table CZESCI_SAMOCHOD
fields terminated by ','
OPTIONALLY ENCLOSED BY '"' AND '"'
trailing nullcols
           ( ID_CZESCI_SAMOCHOD,
             ID_CZESCI,
             ID_SAMOCHOD
           )
