DROP TABLE Fakt_Sprzedazy;
DROP TABLE Wymiar_Salon_Samochodowy;
DROP TABLE Wymiar_Pracownicy;
DROP TABLE Wymiar_Model CASCADE CONSTRAINTS;
DROP TABLE Wymiar_Klient;
DROP TABLE Wymiar_Stanowiska;
DROP TABLE Wymiar_Samochod;

CREATE TABLE Fakt_Sprzedazy (
  ID_Sprzedaz NUMBER(10) NOT NULL,
  ID_Salon NUMBER(10) NOT NULL,
  ID_Pracownik NUMBER(10) NOT NULL,
  ID_Klient NUMBER(10) NOT NULL,
  ID_Stanowisko NUMBER(10) NOT NULL,
  ID_Samochod NUMBER(10) NOT NULL,
  Data DATE NOT NULL,
  Kwota NUMBER(10,2) NOT NULL,
  PRIMARY KEY (ID_Sprzedaz)
);

CREATE TABLE Wymiar_Salon_Samochodowy (
  ID_Salon NUMBER(10) NOT NULL,
  Nazwa_Salonu VARCHAR2(100) NOT NULL,
  PRIMARY KEY (ID_Salon)
);

CREATE TABLE Wymiar_Pracownicy (
  ID_Pracownik NUMBER(10) NOT NULL,
  Imie VARCHAR2(100) NOT NULL,
  Nazwisko VARCHAR2(100) NOT NULL,
  PRIMARY KEY (ID_Pracownik)
);

CREATE TABLE Wymiar_Model (
  ID_Model NUMBER(10) NOT NULL,
  Nazwa_Modelu VARCHAR2(100) NOT NULL,
  Generacja NUMBER(4) NOT NULL,
  Segment VARCHAR2(1) NOT NULL,
  Srednie_spalanie NUMBER(5,2) NOT NULL,
  PRIMARY KEY (ID_Model)
);

CREATE TABLE Wymiar_Klient (
  ID_Klient NUMBER(10) NOT NULL,
  Imie VARCHAR2(100) NOT NULL,
  Nazwisko VARCHAR2(100) NOT NULL,
  PRIMARY KEY (ID_Klient)
);

CREATE TABLE Wymiar_Stanowiska (
  ID_Stanowisko NUMBER(10) NOT NULL,
  Nazwa_Stanowiska VARCHAR2(100) NOT NULL,
  PRIMARY KEY (ID_Stanowisko)
);

CREATE TABLE Wymiar_Samochod (
    ID_Samochod NUMBER(10) NOT NULL,
    ID_Model NUMBER(10) NOT NULL,
    RokProdukcji NUMBER(5) NOT NULL,
    Przebieg NUMBER(10) NOT NULL,
    Cena NUMBER(8,2) NOT NULL,
    PRIMARY KEY (ID_Samochod)
);


ALTER TABLE Wymiar_Samochod ADD FOREIGN KEY (ID_Model) REFERENCES Wymiar_Model(ID_Model);

ALTER TABLE Fakt_Sprzedazy ADD FOREIGN KEY (ID_Salon) REFERENCES Wymiar_Salon_Samochodowy (ID_Salon);
ALTER TABLE Fakt_Sprzedazy ADD FOREIGN KEY (ID_Pracownik) REFERENCES Wymiar_Pracownicy (ID_Pracownik);
ALTER TABLE Fakt_Sprzedazy ADD FOREIGN KEY (ID_Klient) REFERENCES Wymiar_Klient (ID_Klient);
ALTER TABLE Fakt_Sprzedazy ADD FOREIGN KEY (ID_Stanowisko) REFERENCES Wymiar_Stanowiska (ID_Stanowisko);
ALTER TABLE Fakt_Sprzedazy ADD FOREIGN KEY (ID_Samochod) REFERENCES Wymiar_Samochod (ID_Samochod);