load data 
infile '.\\Dane\\model.csv' "str '\r\n'"
replace
into table MODEL
fields terminated by ','
OPTIONALLY ENCLOSED BY '"' AND '"'
trailing nullcols
           ( ID_MODEL,
             NAZWA CHAR(100),
             GENERACJA,
             TYP_NADWOZIA CHAR(40),
             SEGMENT CHAR(1),
             LICZBA_DRZWI CHAR(20),
             SREDNIE_SPALANIE,
             WAGA
           )
