load data 
infile '.\\Dane\\jazda_probna.csv' "str '\r\n'"
replace
into table JAZDA_PROBNA
fields terminated by ','
OPTIONALLY ENCLOSED BY '"' AND '"'
trailing nullcols
           ( ID_JAZDA_PROBNA,
             ID_SAMOCHOD,
             ID_PRACOWNIK,
             ID_KLIENT,
             DATA DATE "RRRR-MM-DD"
           )
