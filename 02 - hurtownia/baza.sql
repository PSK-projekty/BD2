DROP TABLE Fakt_Sprzedaz;
DROP TABLE Wymiar_Naprawa;
DROP TABLE Wymiar_Pracownik;
DROP TABLE Wymiar_Klient;
DROP TABLE Wymiar_Samochod;
DROP TABLE Wymiar_Akcesoria;
DROP TABLE Wymiar_Salon;
DROP TABLE Wymiar_Stanowisko;
DROP TABLE Wymiar_Model;
DROP TABLE Wymiar_Adres;

CREATE TABLE Wymiar_Adres (
    ID_Adres NUMBER(10) NOT NULL,
    Miasto VARCHAR2(100) NOT NULL,
    PRIMARY KEY (ID_Adres)
);

CREATE TABLE Wymiar_Model (
    ID_Model NUMBER(10) NOT NULL,
    Nazwa VARCHAR2(100) NOT NULL,
    Segment VARCHAR2(1) NOT NULL,
    PRIMARY KEY (ID_Model)
);

CREATE TABLE Wymiar_Stanowisko (
    ID_Stanowiska NUMBER(10) NOT NULL,
    Nazwa VARCHAR2(100) NOT NULL,
    PRIMARY KEY (ID_Stanowiska)
);

CREATE TABLE Wymiar_Akcesoria (
    ID_Akcesorium NUMBER(10) NOT NULL,
    Nazwa VARCHAR2(100) NOT NULL,
    PRIMARY KEY (ID_Akcesorium)
);

CREATE TABLE Wymiar_Salon (
    ID_Salonu NUMBER(10) NOT NULL,
    ID_Adres NUMBER(10) NOT NULL, 
    Nazwa VARCHAR2(100) NOT NULL,
    PRIMARY KEY (ID_Salonu)
);

CREATE TABLE Wymiar_Samochod (
    ID_Samochod NUMBER(10) NOT NULL,
    ID_Model NUMBER(10) NOT NULL,
    ID_Salonu NUMBER(10),
    ID_Akcesorium NUMBER(10) NOT NULL,
    Naped VARCHAR2(10) NOT NULL,
    VIN VARCHAR2(20) NOT NULL,
    RokProdukcji NUMBER(5) NOT NULL,
    Kolor VARCHAR2(10) NOT NULL,
    PRIMARY KEY (ID_Samochod),
    UNIQUE (VIN)
);

CREATE TABLE Wymiar_Klient (
    ID_Klient NUMBER(10) NOT NULL,
    ID_Adres NUMBER(10) NOT NULL, 
    Imie VARCHAR2(100) NOT NULL,
    Nazwisko VARCHAR2(100) NOT NULL,
    PRIMARY KEY (ID_Klient)
);

CREATE TABLE Wymiar_Pracownik (
    ID_Pracownik NUMBER(10) NOT NULL,
    ID_Stanowisko NUMBER(10) NOT NULL, 
    ID_Salon NUMBER(10) NOT NULL,
    Imie VARCHAR2(100) NOT NULL,
    Nazwisko VARCHAR2(100) NOT NULL,
    PRIMARY KEY (ID_Pracownik)
);

CREATE TABLE Wymiar_Naprawa (
    ID_Naprawa NUMBER(10) NOT NULL,
    ID_Samochod NUMBER(10) NOT NULL, 
    Typ_naprawy VARCHAR2(15) NOT NULL,
    Data_przyjecia DATE NOT NULL,
    Cena NUMBER(7,2),
    PRIMARY KEY (ID_Naprawa)
);

CREATE TABLE Fakt_Sprzedaz (
    ID_Sprzedaz NUMBER(10) NOT NULL,
    ID_Samochod NUMBER(10),
    ID_Model NUMBER(10),
    ID_Klient NUMBER(10) NOT NULL,
    ID_Pracownik NUMBER(10) NOT NULL,
    ID_Stanowisko NUMBER(10) NOT NULL,
    ID_Salonu NUMBER(10) NOT NULL,
    ID_Akcesorium NUMBER(10),
    ID_Naprawa NUMBER(10),
    ID_Adres NUMBER(10) NOT NULL,
    Data DATE NOT NULL,
    Kwota NUMBER(10,2) NOT NULL,
    PRIMARY KEY (ID_Sprzedaz)
);


ALTER TABLE Wymiar_Salon ADD FOREIGN KEY (ID_Adres) REFERENCES Wymiar_Adres(ID_Adres);

ALTER TABLE Wymiar_Samochod ADD FOREIGN KEY (ID_Model) REFERENCES Wymiar_Model(ID_Model);
ALTER TABLE Wymiar_Samochod ADD FOREIGN KEY (ID_Salonu) REFERENCES Wymiar_Salon(ID_Salonu);
ALTER TABLE Wymiar_Samochod ADD FOREIGN KEY (ID_Akcesorium) REFERENCES Wymiar_Akcesoria(ID_Akcesorium);

ALTER TABLE Wymiar_Klient ADD FOREIGN KEY (ID_Adres) REFERENCES Wymiar_Adres(ID_Adres);

ALTER TABLE Wymiar_Pracownik ADD FOREIGN KEY (ID_Stanowisko) REFERENCES Wymiar_Stanowisko(ID_Stanowiska);
ALTER TABLE Wymiar_Pracownik ADD FOREIGN KEY (ID_Salon) REFERENCES Wymiar_Salon(ID_Salonu);

ALTER TABLE Wymiar_Naprawa ADD FOREIGN KEY (ID_Samochod) REFERENCES Wymiar_Samochod(ID_Samochod);

ALTER TABLE Fakt_Sprzedaz ADD FOREIGN KEY (ID_Samochod) REFERENCES Wymiar_Samochod(ID_Samochod);
ALTER TABLE Fakt_Sprzedaz ADD FOREIGN KEY (ID_Model) REFERENCES Wymiar_Model(ID_Model);
ALTER TABLE Fakt_Sprzedaz ADD FOREIGN KEY (ID_Klient) REFERENCES Wymiar_Klient(ID_Klient);
ALTER TABLE Fakt_Sprzedaz ADD FOREIGN KEY (ID_Pracownik) REFERENCES Wymiar_Pracownik(ID_Pracownik);
ALTER TABLE Fakt_Sprzedaz ADD FOREIGN KEY (ID_Stanowisko) REFERENCES Wymiar_Stanowisko(ID_Stanowiska);
ALTER TABLE Fakt_Sprzedaz ADD FOREIGN KEY (ID_Salonu) REFERENCES Wymiar_Salon(ID_Salonu);
ALTER TABLE Fakt_Sprzedaz ADD FOREIGN KEY (ID_Akcesorium) REFERENCES Wymiar_Akcesoria(ID_Akcesorium);
ALTER TABLE Fakt_Sprzedaz ADD FOREIGN KEY (ID_Naprawa) REFERENCES Wymiar_Naprawa(ID_Naprawa);
ALTER TABLE Fakt_Sprzedaz ADD FOREIGN KEY (ID_Adres) REFERENCES Wymiar_Adres(ID_Adres);