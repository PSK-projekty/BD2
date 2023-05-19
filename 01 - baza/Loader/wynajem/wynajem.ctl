load data 
infile 'F:\Semestr IV\Bazy danych 2\Projekt\01 - baza\Dane\wynajem.csv' "str '\r\n'"
append
into table WYNAJEM
fields terminated by ','
OPTIONALLY ENCLOSED BY '"' AND '"'
trailing nullcols
           ( ID_WYNAJEM,
             DATA_WYNAJMU DATE "RRRR-MM-DD",
             DATA_ZWROTU DATE "RRRR-MM-DD",
             CENA
           )
