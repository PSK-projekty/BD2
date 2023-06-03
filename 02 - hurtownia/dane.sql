DELETE FROM Fakt_Sprzedaz;
DELETE FROM Wymiar_Akcesoria_Samochod;
DELETE FROM Wymiar_Naprawa;
DELETE FROM Wymiar_Pracownik;
DELETE FROM Wymiar_Klient;
DELETE FROM Wymiar_Samochod;
DELETE FROM Wymiar_Akcesoria;
DELETE FROM Wymiar_Salon;
DELETE FROM Wymiar_Stanowisko;
DELETE FROM Wymiar_Model;
DELETE FROM Wymiar_Adres;

DROP PROCEDURE SkopiujDoHurtowni;

CREATE OR REPLACE PROCEDURE SkopiujDoHurtowni AS
BEGIN
  INSERT INTO Wymiar_Adres (ID_Adres, Miasto)
  SELECT ID_Adres, Miasto
  FROM Adres;

  INSERT INTO Wymiar_Model (ID_Model, Nazwa, Segment)
  SELECT ID_Model, Nazwa, Segment
  FROM Model;

  INSERT INTO Wymiar_Stanowisko (ID_Stanowiska, Nazwa)
  SELECT ID_Stanowiska, Nazwa
  FROM Stanowiska;

  INSERT INTO Wymiar_Akcesoria (ID_Akcesorium, Nazwa, Cena)
  SELECT ID_Akcesorium, Nazwa, Cena
  FROM Akcesoria;

  INSERT INTO Wymiar_Salon (ID_Salonu, ID_Adres, Nazwa)
  SELECT ID_Salonu, ID_Adres, Nazwa
  FROM Salon_Samochodowy;

  INSERT INTO Wymiar_Samochod (ID_Samochod, ID_Model, ID_Salonu, Naped, VIN, RokProdukcji, Kolor)
  SELECT ID_Samochodu, ID_Model, ID_Salonu, Naped, VIN, RokProdukcji, Kolor
  FROM Samochod;

  INSERT INTO Wymiar_Klient (ID_Klient, ID_Adres, Imie, Nazwisko)
  SELECT ID_Klient, ID_Adres, Imie, Nazwisko
  FROM Klient;

  INSERT INTO Wymiar_Pracownik (ID_Pracownik, ID_Stanowisko, ID_Salon, Imie, Nazwisko)
  SELECT ID_Pracownik, ID_Stanowisko, ID_Salon, Imie, Nazwisko
  FROM Pracownicy;

  INSERT INTO Wymiar_Naprawa (ID_Naprawa, ID_Samochod, Typ_naprawy, Data_przyjecia, Data_wydania ,Cena)
  SELECT ID_Naprawa, ID_Samochod, Typ_naprawy, Data_przyjecia, Data_wydania, Cena
  FROM Naprawa;

  INSERT INTO Wymiar_Akcesoria_Samochod (ID_Akcesoria_Samochod, ID_Samochod, ID_Akcesorium)
  SELECT ID_Akcesoria_Samochod, ID_Samochod, ID_Akcesoria
  FROM Akcesoria_Samochod;
  
  INSERT INTO Fakt_Sprzedaz (ID_Sprzedaz, ID_Samochod, ID_Klient, ID_Pracownik, ID_Salonu, ID_Akcesorium, ID_Naprawa, Data, Kwota)
  SELECT ID_Sprzedaz, ID_Samochod, ID_Klient, ID_Pracownik, ID_Salon, ID_Akcesorium, ID_Naprawa, Data, Kwota
  FROM Sprzedaz;
  COMMIT;
END;
/

BEGIN
  SkopiujDoHurtowni;
END;
/