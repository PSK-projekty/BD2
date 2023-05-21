load data 
infile '.\\Dane\\Wymiar_Pracownicy.csv' "str '\r\n'"
replace
into table WYMIAR_PRACOWNIK
fields terminated by ','
OPTIONALLY ENCLOSED BY '"' AND '"'
trailing nullcols
           ( ID_PRACOWNIK,
             ID_STANOWISKO,
             ID_SALON,
             IMIE CHAR(100),
             NAZWISKO CHAR(100)
           )
