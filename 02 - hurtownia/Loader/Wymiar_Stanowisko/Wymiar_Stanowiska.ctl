load data 
infile '.\\Dane\\Wymiar_Stanowiska.csv' "str '\r\n'"
replace
into table WYMIAR_STANOWISKO
fields terminated by ','
OPTIONALLY ENCLOSED BY '"' AND '"'
trailing nullcols
           ( ID_STANOWISKA,
             NAZWA CHAR(100)
           )
