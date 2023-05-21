load data 
infile '.\\Dane\\Wymiar_Model.csv' "str '\r\n'"
replace
into table WYMIAR_MODEL
fields terminated by ','
OPTIONALLY ENCLOSED BY '"' AND '"'
trailing nullcols
           ( ID_MODEL,
             NAZWA CHAR(100),
             SEGMENT CHAR(1)
           )
