load data 
infile '.\\Dane\\wersja_wyposazenia.csv' "str '\r\n'"
replace
into table WERSJA_WYPOSAZENIA
fields terminated by ','
OPTIONALLY ENCLOSED BY '"' AND '"'
trailing nullcols
           ( ID_WERSJA,
             NAZWA CHAR(100),
             POZIOM_WYPOSAZENIA,
             CENA
           )
