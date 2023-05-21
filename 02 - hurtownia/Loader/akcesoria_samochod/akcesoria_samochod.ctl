load data 
infile '.\\Dane\\akcesoria_samochod.csv' "str '\r\n'"
replace
into table AKCESORIA_SAMOCHOD
fields terminated by ','
OPTIONALLY ENCLOSED BY '"' AND '"'
trailing nullcols
           ( ID_AKCESORIA_SAMOCHOD,
             ID_AKCESORIA,
             ID_SAMOCHOD
           )
