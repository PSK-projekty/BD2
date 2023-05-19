load data 
infile '.\\Dane\\stanowiska.csv' "str '\r\n'"
replace
into table STANOWISKA
fields terminated by ','
OPTIONALLY ENCLOSED BY '"' AND '"'
trailing nullcols
           ( ID_STANOWISKA,
             NAZWA CHAR(100),
             PREMIA_ZA_STANOWISKO
           )
