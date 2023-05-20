DROP TABLE Salon_Samochodowy CASCADE CONSTRAINTS;
DROP TABLE Samochod CASCADE CONSTRAINTS;
DROP TABLE Model CASCADE CONSTRAINTS;
DROP TABLE Pracownicy CASCADE CONSTRAINTS;
DROP TABLE Klient CASCADE CONSTRAINTS;
DROP TABLE Adres CASCADE CONSTRAINTS;
DROP TABLE Naprawa CASCADE CONSTRAINTS;
DROP TABLE Sprzedaz CASCADE CONSTRAINTS;
DROP TABLE Akcesoria CASCADE CONSTRAINTS;
DROP TABLE Stanowiska CASCADE CONSTRAINTS;
DROP TABLE Akcesoria_Samochod CASCADE CONSTRAINTS;


CREATE TABLE Salon_Samochodowy (
    ID_Salonu NUMBER(10) NOT NULL,
    ID_Adres NUMBER(10) NOT NULL,
    Nazwa VARCHAR2(100) NOT NULL,
    PRIMARY KEY (ID_Salonu)
);

CREATE TABLE Samochod (
    ID_Samochodu NUMBER(10) NOT NULL,
    ID_Model NUMBER(10) NOT NULL,
    ID_Salonu NUMBER(10) NOT NULL,
    ID_Wersja NUMBER(10) NOT NULL,
    ID_Wynajem_Samochod NUMBER(10) NOT NULL,
    ID_Dodatkowe_Samochod NUMBER(10) NOT NULL,
    ID_Czesci_Samochod NUMBER(10) NOT NULL,
    ID_Wyposazenie NUMBER(10),
    ID_Akcesoria_Samochod NUMBER(10),
    ID_Silnik NUMBER(10),
    Naped VARCHAR2(10) NOT NULL,
    Kolor VARCHAR2(10) NOT NULL,
    VIN VARCHAR2(15) NOT NULL,
    RokProdukcji NUMBER(5) NOT NULL,
    Przebieg NUMBER(10) NOT NULL,
    Cena NUMBER(5,2) NOT NULL,
    PRIMARY KEY (ID_Samochodu),
    UNIQUE (VIN)
);

CREATE TABLE Model (
    ID_Model NUMBER(10) NOT NULL,
    Nazwa VARCHAR2(100) NOT NULL,
    Generacja NUMBER(4) NOT NULL,
    Typ_nadwozia VARCHAR2(10) NOT NULL,
    Segment VARCHAR2(1) NOT NULL,
    Liczba_drzwi NUMBER(3) NOT NULL,
    Srednie_spalanie NUMBER(4,2) NOT NULL,
    Waga NUMBER(10) NOT NULL,
    PRIMARY KEY (ID_Model)
);

CREATE TABLE Pracownicy (
    ID_Pracownik NUMBER(10) NOT NULL,
    ID_Salon NUMBER(10) NOT NULL,
    ID_Adres NUMBER(10) NOT NULL,
    ID_Stanowisko NUMBER(10) NOT NULL,
    ID_Wynajem_Pracownicy NUMBER(10) NOT NULL,
    Imie VARCHAR2(100) NOT NULL,
    Nazwisko VARCHAR2(100) NOT NULL,
    Email VARCHAR2(100) NOT NULL,
    Telefon NUMBER(10) NOT NULL,
    Pensja NUMBER(5,2) NOT NULL,
    PRIMARY KEY (ID_Pracownik),
    UNIQUE (Email, Telefon)
);

CREATE TABLE Klient (
    ID_Klient NUMBER(10) NOT NULL,
    ID_Adres NUMBER(10) NOT NULL,
    ID_Wynajem_Klient NUMBER(10) NOT NULL,
    Imie VARCHAR2(100) NOT NULL,
    Nazwisko VARCHAR2(100) NOT NULL,
    Email VARCHAR2(100) NOT NULL,
    Telefon NUMBER(10) NOT NULL,
    PRIMARY KEY (ID_Klient),
    UNIQUE (Email, Telefon)
);

CREATE TABLE Adres (
    ID_Adres NUMBER(10) NOT NULL,
    Miasto VARCHAR2(100),
    Miejscowosc VARCHAR2(100),
    Numer_domu VARCHAR2(3),
    Numer_mieszkania VARCHAR2(3),
    Kod_pocztowy VARCHAR2(10) NOT NULL,
    Ulica VARCHAR2(100),
    PRIMARY KEY (ID_Adres)
);

CREATE TABLE Naprawa (
    ID_Naprawa NUMBER(10) NOT NULL,
    ID_Samochod NUMBER(10) NOT NULL,
    ID_Pracownika NUMBER(10) NOT NULL,
    ID_Czesc NUMBER(10) NOT NULL,
    Typ_naprawy VARCHAR2(15) NOT NULL,
    Data_przyjecia DATE NOT NULL,
    Data_wydania DATE,
    Cena NUMBER(5,2),
    PRIMARY KEY (ID_Naprawa)
);

CREATE TABLE Sprzedaz (
    ID_Sprzedaz NUMBER(10) NOT NULL,
    ID_Samochod NUMBER(10),
    ID_Akcesorium NUMBER(10),
    ID_Pracownik NUMBER(10),
    ID_Klient NUMBER(10) NOT NULL,
    ID_Wyposazenie NUMBER(10),
    ID_Czesc NUMBER(10),
    ID_Wynajem NUMBER(10),
    ID_Wersja NUMBER(10),
    ID_Naprawa NUMBER(10),
    Data DATE NOT NULL,
    Kwota NUMBER(5,2) NOT NULL,
    PRIMARY KEY (ID_Sprzedaz)
);

CREATE TABLE Akcesoria (
    ID_Akcesorium NUMBER(10) NOT NULL,
    ID_Akcesoria_Samochod NUMBER(10) NOT NULL,
    Nazwa VARCHAR2(100) NOT NULL,
    Cena NUMBER(5,2) NOT NULL,
    PRIMARY KEY (ID_Akcesorium)
);

CREATE TABLE Stanowiska (
    ID_Stanowiska NUMBER(10) NOT NULL,
    Nazwa VARCHAR2(100) NOT NULL,
    Premia_za_stanowisko NUMBER(3) NOT NULL,
    PRIMARY KEY (ID_Stanowiska)
);

CREATE TABLE Akcesoria_Samochod (
    ID_Akcesoria_Samochod NUMBER(10) NOT NULL,
    ID_Akcesoria NUMBER(10) NOT NULL,
    ID_Samochod NUMBER(10) NOT NULL,
    PRIMARY KEY (ID_Akcesoria_Samochod)
);


ALTER TABLE Salon_Samochodowy ADD FOREIGN KEY (ID_Adres) REFERENCES Adres(ID_Adres);

ALTER TABLE Samochod ADD FOREIGN KEY (ID_Salonu) REFERENCES Salon_Samochodowy(ID_Salonu);
ALTER TABLE Samochod ADD FOREIGN KEY (ID_Model) REFERENCES Model(ID_Model);
ALTER TABLE Samochod ADD FOREIGN KEY (ID_Silnik) REFERENCES Silniki(ID_Silnik);
ALTER TABLE Samochod ADD FOREIGN KEY (ID_Wersja) REFERENCES Wersja_Wyposazenia(ID_Wersja);
ALTER TABLE Samochod ADD FOREIGN KEY (ID_Czesci_Samochod) REFERENCES Czesci_Samochod(ID_Czesci_Samochod);
ALTER TABLE Samochod ADD FOREIGN KEY (ID_Wynajem_Samochod) REFERENCES Wynajem_Samochod(ID_Wynajem_Samochod);
ALTER TABLE Samochod ADD FOREIGN KEY (ID_Dodatkowe_Samochod) REFERENCES Dodatkowe_Samochod(ID_Dodatkowe_Samochod);
ALTER TABLE Samochod ADD FOREIGN KEY (ID_Wyposazenie) REFERENCES Dodatkowe_Wyposazenie(ID_Wyposazenie);
ALTER TABLE Samochod ADD FOREIGN KEY (ID_Akcesoria_Samochod) REFERENCES Akcesoria_Samochod(ID_Akcesoria_Samochod);

ALTER TABLE Pracownicy ADD FOREIGN KEY (ID_Salon) REFERENCES Salon_Samochodowy(ID_Salonu);
ALTER TABLE Pracownicy ADD FOREIGN KEY (ID_Adres) REFERENCES Adres(ID_Adres);
ALTER TABLE Pracownicy ADD FOREIGN KEY (ID_Stanowisko) REFERENCES Stanowiska(ID_Stanowiska);
ALTER TABLE Pracownicy ADD FOREIGN KEY (ID_Wynajem_Pracownicy) REFERENCES Wynajem_Pracownicy(ID_wynajem_pracownicy);

ALTER TABLE Klient ADD FOREIGN KEY (ID_Adres) REFERENCES Adres(ID_Adres);
ALTER TABLE Klient ADD FOREIGN KEY (ID_Wynajem_Klient) REFERENCES Wynajem_Klient(ID_Wynajem_Klient);

ALTER TABLE Naprawa ADD FOREIGN KEY (ID_Samochod) REFERENCES Samochod(ID_Samochodu);
ALTER TABLE Naprawa ADD FOREIGN KEY (ID_Pracownika) REFERENCES Pracownicy(ID_Pracownik);
ALTER TABLE Naprawa ADD FOREIGN KEY (ID_Czesc) REFERENCES Czesci(ID_Czesc);


ALTER TABLE Sprzedaz ADD FOREIGN KEY (ID_Pracownik) REFERENCES Pracownicy(ID_Pracownik);
ALTER TABLE Sprzedaz ADD FOREIGN KEY (ID_Klient) REFERENCES Klient(ID_Klient);
ALTER TABLE Sprzedaz ADD FOREIGN KEY (ID_Samochod) REFERENCES Samochod(ID_Samochodu);
ALTER TABLE Sprzedaz ADD FOREIGN KEY (ID_Akcesorium) REFERENCES Akcesoria(ID_Akcesorium);
ALTER TABLE Sprzedaz ADD FOREIGN KEY (ID_Czesc) REFERENCES Czesci(ID_Czesc);
ALTER TABLE Sprzedaz ADD FOREIGN KEY (ID_Naprawa) REFERENCES Naprawa(ID_Naprawa);
ALTER TABLE Sprzedaz ADD FOREIGN KEY (ID_Wyposazenie) REFERENCES Dodatkowe_Wyposazenie(ID_Wyposazenie);
ALTER TABLE Sprzedaz ADD FOREIGN KEY (ID_Wynajem) REFERENCES Wynajem(ID_Wynajem);

ALTER TABLE Akcesoria ADD FOREIGN KEY (ID_Akcesoria_Samochod) REFERENCES Akcesoria_Samochod(ID_Akcesoria_Samochod);

ALTER TABLE Akcesoria_Samochod ADD FOREIGN KEY (ID_Samochod) REFERENCES Samochod(ID_Samochodu);
ALTER TABLE Akcesoria_Samochod ADD FOREIGN KEY (ID_Akcesoria) REFERENCES Akcesoria(ID_Akcesorium);
ALTER TABLE Dodatkowe_Samochod ADD FOREIGN KEY (ID_Samochod) REFERENCES Samochod(ID_Samochodu);
ALTER TABLE Dodatkowe_Samochod ADD FOREIGN KEY (ID_Dodatkowe) REFERENCES Dodatkowe_Wyposazenie(ID_Wyposazenie);



CREATE TABLE Salon_Samochodowy (
    ID_Salonu INT PRIMARY KEY,
    Nazwa VARCHAR(100) NOT NULL
);

CREATE TABLE Model (
    ID_Model INT PRIMARY KEY,
    Nazwa VARCHAR(100) NOT NULL,
    Generacja INT NOT NULL,
    Typ_nadwozia VARCHAR(10) NOT NULL,
    Segment CHAR(1) NOT NULL,
    Liczba_drzwi INT NOT NULL,
    Srednie_spalanie DECIMAL(4,2) NOT NULL,
    Waga INT NOT NULL
);

CREATE TABLE Klient (
    ID_Klient INT PRIMARY KEY,
    Imie VARCHAR(100) NOT NULL,
    Nazwisko VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Telefon INT NOT NULL
);

CREATE TABLE Akcesoria (
    ID_Akcesorium INT PRIMARY KEY,
    Nazwa VARCHAR(100) NOT NULL,
    Cena DECIMAL(5,2) NOT NULL
);

CREATE TABLE Stanowiska (
    ID_Stanowiska INT PRIMARY KEY,
    Nazwa VARCHAR(100) NOT NULL,
    Premia_za_stanowisko INT NOT NULL
);

CREATE TABLE Pracownicy (
    ID_Pracownik INT PRIMARY KEY,
    ID_Salon INT NOT NULL,
    ID_Stanowisko INT NOT NULL,
    Imie VARCHAR(100) NOT NULL,
    Nazwisko VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Telefon INT NOT NULL,
    Pensja DECIMAL(5,2) NOT NULL,
    FOREIGN KEY (ID_Salon) REFERENCES Salon_Samochodowy(ID_Salonu),
    FOREIGN KEY (ID_Stanowisko) REFERENCES Stanowiska(ID_Stanowiska)
);

CREATE TABLE Samochod (
    ID_Samochodu INT PRIMARY KEY,
    ID_Model INT NOT NULL,
    ID_Salonu INT NOT NULL,
    Naped VARCHAR(10) NOT NULL,
    Kolor VARCHAR(10) NOT NULL,
    VIN VARCHAR(15) NOT NULL,
    RokProdukcji INT NOT NULL,
    Przebieg INT NOT NULL,
    Cena DECIMAL(5,2) NOT NULL,
    FOREIGN KEY (ID_Salonu) REFERENCES Salon_Samochodowy(ID_Salonu),
    FOREIGN KEY (ID_Model) REFERENCES Model(ID_Model)
);

CREATE TABLE Akcesoria_Samochod (
    ID_Akcesoria INT NOT NULL,
    ID_Samochod INT NOT NULL,
    FOREIGN KEY (ID_Akcesoria) REFERENCES Akcesoria(ID_Akcesorium),
    FOREIGN KEY (ID_Samochod) REFERENCES Samochod(ID_Samochodu)
);

CREATE TABLE Naprawa (
    ID_Naprawa INT PRIMARY KEY,
    ID_Samochod INT NOT NULL,
    ID_Pracownika INT NOT NULL,
    Typ_naprawy VARCHAR(15) NOT NULL,
    Data_przyjecia DATE NOT NULL,
    Data_wydania DATE,
    Cena DECIMAL(5,2),
    FOREIGN KEY (ID_Samochod) REFERENCES Samochod(ID_Samochodu),
    FOREIGN KEY (ID_Pracownika) REFERENCES Pracownicy(ID_Pracownik)
);

CREATE TABLE Sprzedaz (
    ID_Sprzedaz INT PRIMARY KEY,
    ID_Samochod INT,
    ID_Akcesorium INT,
    ID_Pracownik INT,
    ID_Klient INT NOT NULL,
    Data DATE NOT NULL,
    Kwota DECIMAL(5,2) NOT NULL,
    FOREIGN KEY (ID_Samochod) REFERENCES Samochod(ID_Samochodu),
    FOREIGN KEY (ID_Pracownik) REFERENCES Pracownicy(ID_Pracownik),
    FOREIGN KEY (ID_Klient) REFERENCES Klient(ID_Klient)
);






