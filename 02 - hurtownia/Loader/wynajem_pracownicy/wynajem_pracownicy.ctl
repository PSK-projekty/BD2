load data 
infile '.\\Dane\\wynajem_pracownicy.csv' "str '\r\n'"
replace
into table WYNAJEM_PRACOWNICY
fields terminated by ','
OPTIONALLY ENCLOSED BY '"' AND '"'
trailing nullcols
           ( ID_WYNAJEM_PRACOWNICY,
             ID_WYNAJEM,
             ID_PRACOWNIK
           )
