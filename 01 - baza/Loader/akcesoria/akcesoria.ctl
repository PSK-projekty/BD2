load data 
infile '.\\Dane\\akcesoria.csv' "str '\r\n'"
replace
into table AKCESORIA
fields terminated by ','
OPTIONALLY ENCLOSED BY '"' AND '"'
trailing nullcols
           ( ID_AKCESORIUM,
             NAZWA CHAR(100),
             CENA
           )
