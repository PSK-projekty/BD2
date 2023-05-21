load data 
infile '.\\Dane\\pracownicy.csv' "str '\r\n'"
replace
into table PRACOWNICY
fields terminated by ','
OPTIONALLY ENCLOSED BY '"' AND '"'
trailing nullcols
           ( ID_PRACOWNIK,
             ID_SALON,
             ID_ADRES,
             ID_STANOWISKO,
             IMIE CHAR(100),
             NAZWISKO CHAR(100),
             EMAIL CHAR(100),
             TELEFON,
             PENSJA
           )
