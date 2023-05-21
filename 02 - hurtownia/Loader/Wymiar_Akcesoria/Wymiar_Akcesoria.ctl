load data 
infile '.\\Dane\\Wymiar_Akcesoria.csv' "str '\r\n'"
replace
into table WYMIAR_AKCESORIA
fields terminated by ','
OPTIONALLY ENCLOSED BY '"' AND '"'
trailing nullcols
           ( ID_AKCESORIUM,
             NAZWA CHAR(100)
           )
