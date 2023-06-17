DROP TABLE Fakt_Sprzedazy;
DROP TABLE Wymiar_Salon_Samochodowy;
DROP TABLE Wymiar_Pracownicy;
DROP TABLE Wymiar_Akcesoria;
DROP TABLE Wymiar_Miasto_slownik;
DROP TABLE Wymiar_Klient;
DROP TABLE Wymiar_Czesci;
DROP TABLE Wymiar_Stanowiska;
DROP TABLE Wymiar_Wynajem;

CREATE TABLE Fakt_Sprzedazy (
  ID_Sprzedaz NUMBER(10) NOT NULL,
  ID_Salon NUMBER(10),
  ID_Pracownik NUMBER(10),
  ID_Akcesorium NUMBER(10),
  ID_Miasto NUMBER(10) NOT NULL,
  ID_Klient NUMBER(10) NOT NULL,
  ID_Czesc NUMBER(10),
  ID_Stanowisko NUMBER(10) NOT NULL,
  ID_Wynajem NUMBER(10),
  Data DATE NOT NULL,
  Kwota NUMBER(10,2) NOT NULL,
  PRIMARY KEY (ID_Sprzedaz)
);

CREATE TABLE Wymiar_Salon_Samochodowy (
  ID_Salon NUMBER(10) NOT NULL,
  Nazwa VARCHAR2(100) NOT NULL,
  PRIMARY KEY (ID_Salon)
);

CREATE TABLE Wymiar_Pracownicy (
  ID_Pracownik NUMBER(10) NOT NULL,
  Imie VARCHAR2(100) NOT NULL,
  Nazwisko VARCHAR2(100) NOT NULL,
  PRIMARY KEY (ID_Pracownik)
);

CREATE TABLE Wymiar_Akcesoria (
  ID_Akcesorium NUMBER(10) NOT NULL,
  Nazwa VARCHAR2(100) NOT NULL,
  Cena NUMBER(6,2) NOT NULL,
  PRIMARY KEY (ID_Akcesorium)
);

CREATE TABLE Wymiar_Miasto_slownik (
  ID_Miasto NUMBER(10) NOT NULL,
  Nazwa_miasta VARCHAR(100) NOT NULL,
  PRIMARY KEY (ID_Miasto)
);

CREATE TABLE Wymiar_Klient (
  ID_Klient NUMBER(10) NOT NULL,
  Imie VARCHAR2(100) NOT NULL,
  Nazwisko VARCHAR2(100) NOT NULL,
  PRIMARY KEY (ID_Klient)
);

CREATE TABLE Wymiar_Czesci (
  ID_Czesc NUMBER(10) NOT NULL,
  Nazwa VARCHAR2(100) NOT NULL,
  Cena NUMBER(6,2) NOT NULL,
  PRIMARY KEY (ID_Czesc)
);

CREATE TABLE Wymiar_Stanowiska (
  ID_Stanowisko NUMBER(10) NOT NULL,
  Nazwa VARCHAR2(100) NOT NULL,
  PRIMARY KEY (ID_Stanowisko)
);

CREATE TABLE Wymiar_Wynajem (
  ID_Wynajem NUMBER(10) NOT NULL,
  Data_wynajmu DATE NOT NULL,
  Cena NUMBER(7,2) NOT NULL,
  PRIMARY KEY (ID_Wynajem)
);

 ALTER TABLE Fakt_Sprzedazy ADD FOREIGN KEY (ID_Salon) REFERENCES Wymiar_Salon_Samochodowy (ID_Salon);
 ALTER TABLE Fakt_Sprzedazy ADD FOREIGN KEY (ID_Pracownik) REFERENCES Wymiar_Pracownicy (ID_Pracownik);
 ALTER TABLE Fakt_Sprzedazy ADD FOREIGN KEY (ID_Akcesorium) REFERENCES Wymiar_Akcesoria (ID_Akcesorium);
 ALTER TABLE Fakt_Sprzedazy ADD FOREIGN KEY (ID_Miasto) REFERENCES Wymiar_Miasto_slownik (ID_Miasto);
 ALTER TABLE Fakt_Sprzedazy ADD FOREIGN KEY (ID_Klient) REFERENCES Wymiar_Klient (ID_Klient);
 ALTER TABLE Fakt_Sprzedazy ADD FOREIGN KEY (ID_Czesc) REFERENCES Wymiar_Czesci (ID_Czesc);
 ALTER TABLE Fakt_Sprzedazy ADD FOREIGN KEY (ID_Stanowisko) REFERENCES Wymiar_Stanowiska (ID_Stanowisko);
 ALTER TABLE Fakt_Sprzedazy ADD FOREIGN KEY (ID_Wynajem) REFERENCES Wymiar_Wynajem (ID_Wynajem);