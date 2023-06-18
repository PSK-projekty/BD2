load data 
infile '.\\Dane\\dodatkowe_wyposazenie.csv' "str '\r\n'"
replace
into table DODATKOWE_WYPOSAZENIE
fields terminated by ','
OPTIONALLY ENCLOSED BY '"' AND '"'
trailing nullcols
           ( ID_WYPOSAZENIE,
             NAZWA CHAR(100),
             CENA
           )
