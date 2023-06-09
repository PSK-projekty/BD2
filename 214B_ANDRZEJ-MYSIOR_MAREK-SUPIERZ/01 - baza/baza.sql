DROP TABLE Salon_Samochodowy CASCADE CONSTRAINTS;
DROP TABLE Samochod CASCADE CONSTRAINTS;
DROP TABLE Model CASCADE CONSTRAINTS;
DROP TABLE Silniki CASCADE CONSTRAINTS;
DROP TABLE Pracownicy CASCADE CONSTRAINTS;
DROP TABLE Klient CASCADE CONSTRAINTS;
DROP TABLE Adres CASCADE CONSTRAINTS;
DROP TABLE Miasto_slownik CASCADE CONSTRAINTS;
DROP TABLE Ulica_slownik CASCADE CONSTRAINTS;
DROP TABLE Naprawa CASCADE CONSTRAINTS;
DROP TABLE Jazda_Probna CASCADE CONSTRAINTS;
DROP TABLE Platnosc CASCADE CONSTRAINTS;
DROP TABLE Sprzedaz CASCADE CONSTRAINTS;
DROP TABLE Akcesoria CASCADE CONSTRAINTS;
DROP TABLE Stanowiska CASCADE CONSTRAINTS;
DROP TABLE Wersja_Wyposazenia CASCADE CONSTRAINTS;
DROP TABLE Wynajem CASCADE CONSTRAINTS;
DROP TABLE Czesci CASCADE CONSTRAINTS;
DROP TABLE Dodatkowe_Wyposazenie CASCADE CONSTRAINTS;
DROP TABLE Magazyn CASCADE CONSTRAINTS;
DROP TABLE Czesci_Samochod CASCADE CONSTRAINTS;
DROP TABLE Akcesoria_Samochod CASCADE CONSTRAINTS;
DROP TABLE Dodatkowe_Samochod CASCADE CONSTRAINTS;

CREATE TABLE Adres (
    ID_Adres NUMBER(10) NOT NULL,
    ID_Ulica NUMBER(10) NOT NULL,
    Numer_domu VARCHAR2(3),
    Numer_mieszkania VARCHAR2(3),
    PRIMARY KEY (ID_Adres) 
);

CREATE TABLE Miasto_slownik (
    ID_Miasto NUMBER(10) NOT NULL,
    Nazwa_miasta VARCHAR(100) NOT NULL,
    PRIMARY KEY (ID_Miasto)
);

CREATE TABLE Ulica_slownik (
    ID_Ulica NUMBER(10) NOT NULL,
    ID_Miasto NUMBER(10) NOT NULL,
    Nazwa_ulicy VARCHAR(100) NOT NULL,
    PRIMARY KEY (ID_Ulica)
);

CREATE TABLE Akcesoria (
    ID_Akcesorium NUMBER(10) NOT NULL,
    Nazwa VARCHAR2(100) NOT NULL,
    Cena NUMBER(6,2) NOT NULL,
    PRIMARY KEY (ID_Akcesorium)
);

CREATE TABLE Model (
    ID_Model NUMBER(10) NOT NULL,
    Nazwa VARCHAR2(100) NOT NULL,
    Generacja NUMBER(4) NOT NULL,
    Typ_nadwozia VARCHAR2(40) NOT NULL,
    Segment VARCHAR2(1) NOT NULL,
    Liczba_drzwi VARCHAR2(20) NOT NULL,
    Srednie_spalanie NUMBER(5,2) NOT NULL,
    Waga NUMBER(10) NOT NULL,
    PRIMARY KEY (ID_Model)
);

CREATE TABLE Silniki (
    ID_Silnik NUMBER(10) NOT NULL,
    Pojemnosc NUMBER(5),
    Moc_kW NUMBER(5) NOT NULL,
    Moc_KM NUMBER(5) NOT NULL,
    Moment_obrotowy NUMBER(5) NOT NULL,
    Typ_silnika VARCHAR2(20) NOT NULL,
    Paliwo VARCHAR2(20),
    Numer VARCHAR2(15) NOT NULL,
    PRIMARY KEY (ID_Silnik),
    UNIQUE (Numer)
);

CREATE TABLE Stanowiska (
    ID_Stanowiska NUMBER(10) NOT NULL,
    Nazwa VARCHAR2(100) NOT NULL,
    Premia_za_stanowisko NUMBER(3) NOT NULL,
    PRIMARY KEY (ID_Stanowiska)
);

CREATE TABLE Czesci (
    ID_Czesc NUMBER(10) NOT NULL,
    Nazwa VARCHAR2(100) NOT NULL,
    Numer VARCHAR2(15) NOT NULL,
    Cena NUMBER(6,2) NOT NULL,
    PRIMARY KEY (ID_Czesc),
    UNIQUE (Numer)
);

CREATE TABLE Dodatkowe_Wyposazenie (
    ID_Wyposazenie NUMBER(10) NOT NULL,
    Nazwa VARCHAR2(100) NOT NULL,
    Cena NUMBER(6,2) NOT NULL,
    PRIMARY KEY (ID_Wyposazenie)
);

CREATE TABLE Wersja_Wyposazenia (
    ID_Wersja NUMBER(10) NOT NULL,
    Nazwa VARCHAR2(100) NOT NULL,
    Poziom_wyposazenia NUMBER(2) NOT NULL,
    Cena NUMBER(7,2) NOT NULL,
    PRIMARY KEY (ID_Wersja)
);

CREATE TABLE Salon_Samochodowy (
    ID_Salonu NUMBER(10) NOT NULL,
    ID_Adres NUMBER(10) NOT NULL,
    Nazwa VARCHAR2(100) NOT NULL,
    PRIMARY KEY (ID_Salonu)
);

CREATE TABLE Klient (
    ID_Klient NUMBER(10) NOT NULL,
    ID_Adres NUMBER(10) NOT NULL,
    Imie VARCHAR2(100) NOT NULL,
    Nazwisko VARCHAR2(100) NOT NULL,
    Email VARCHAR2(100) NOT NULL,
    Telefon NUMBER(10) NOT NULL,
    PRIMARY KEY (ID_Klient),
    UNIQUE (Email, Telefon)
);

CREATE TABLE Pracownicy (
    ID_Pracownik NUMBER(10) NOT NULL,
    ID_Salon NUMBER(10) NOT NULL,
    ID_Adres NUMBER(10) NOT NULL,
    ID_Stanowisko NUMBER(10) NOT NULL,
    Imie VARCHAR2(100) NOT NULL,
    Nazwisko VARCHAR2(100) NOT NULL,
    Email VARCHAR2(100) NOT NULL,
    Telefon NUMBER(10) NOT NULL,
    Pensja NUMBER(7,2) NOT NULL,
    PRIMARY KEY (ID_Pracownik),
    UNIQUE (Email, Telefon)
);

CREATE TABLE Samochod (
    ID_Samochodu NUMBER(10) NOT NULL,
    ID_Model NUMBER(10) NOT NULL,
    ID_Salonu NUMBER(10) NOT NULL,
    ID_Wersja NUMBER(10) NOT NULL,
    ID_Silnik NUMBER(10),
    ID_Wyposazenie NUMBER(10),
    Naped VARCHAR2(10) NOT NULL,
    Kolor VARCHAR2(10) NOT NULL,
    VIN VARCHAR2(20) NOT NULL,
    RokProdukcji NUMBER(5) NOT NULL,
    Przebieg NUMBER(10) NOT NULL,
    Cena NUMBER(8,2) NOT NULL,
    PRIMARY KEY (ID_Samochodu),
    UNIQUE (VIN)
);

CREATE TABLE Jazda_Probna (
    ID_Jazda_Probna NUMBER(10) NOT NULL,
    ID_Samochod NUMBER(10) NOT NULL,
    ID_Pracownik NUMBER(10) NOT NULL,
    ID_Klient NUMBER(10) NOT NULL,
    Data DATE NOT NULL,
    PRIMARY KEY (ID_Jazda_Probna)
);

CREATE TABLE Magazyn (
    ID_Magazyn NUMBER(10) NOT NULL,
    ID_Samochod NUMBER(10) NOT NULL,
    ID_Silnik NUMBER(10) NOT NULL,
    ID_Czesc NUMBER(10) NOT NULL,
    ID_Akcesorium NUMBER(10) NOT NULL,
    Ilosc NUMBER(10),
    PRIMARY KEY (ID_Magazyn)
);

CREATE TABLE Naprawa (
    ID_Naprawa NUMBER(10) NOT NULL,
    ID_Samochod NUMBER(10) NOT NULL,
    ID_Pracownika NUMBER(10) NOT NULL,
    ID_Czesc NUMBER(10) NOT NULL,
    Typ_naprawy VARCHAR2(15) NOT NULL,
    Data_przyjecia DATE NOT NULL,
    Data_wydania DATE,
    Cena NUMBER(7,2),
    PRIMARY KEY (ID_Naprawa)
);

CREATE TABLE Czesci_Samochod (
    ID_Czesci_Samochod NUMBER(10) NOT NULL,
    ID_Czesci NUMBER(10) NOT NULL,
    ID_Samochod NUMBER(10) NOT NULL,
    PRIMARY KEY (ID_Czesci_Samochod)
);

CREATE TABLE Dodatkowe_Samochod (
    ID_Dodatkowe_Samochod NUMBER(10) NOT NULL,
    ID_Dodatkowe NUMBER(10) NOT NULL,
    ID_Samochod NUMBER(10) NOT NULL,
    PRIMARY KEY (ID_Dodatkowe_Samochod)
);

CREATE TABLE Akcesoria_Samochod (
    ID_Akcesoria_Samochod NUMBER(10) NOT NULL,
    ID_Akcesoria NUMBER(10) NOT NULL,
    ID_Samochod NUMBER(10) NOT NULL,
    PRIMARY KEY (ID_Akcesoria_Samochod)
);

CREATE TABLE Wynajem (
    ID_Wynajem NUMBER(10) NOT NULL,
    ID_Klient NUMBER(10) NOT NULL,
    ID_Samochod NUMBER(10) NOT NULL,
    ID_Pracownik NUMBER(10) NOT NULL,
    Data_wynajmu DATE NOT NULL,
    Data_zwrotu DATE,
    Cena NUMBER(7,2) NOT NULL,
    PRIMARY KEY (ID_Wynajem)
);

CREATE TABLE Sprzedaz (
    ID_Sprzedaz NUMBER(10) NOT NULL,
    ID_Samochod NUMBER(10),
    ID_Akcesorium NUMBER(10),
    ID_Pracownik NUMBER(10),
    ID_Klient NUMBER(10) NOT NULL,
    ID_Czesc NUMBER(10),
    ID_Wynajem NUMBER(10),
    ID_Wersja NUMBER(10),
    ID_Naprawa NUMBER(10),
    ID_Salon NUMBER(10),
    Data DATE NOT NULL,
    Kwota NUMBER(10,2) NOT NULL,
    PRIMARY KEY (ID_Sprzedaz)
);

CREATE TABLE Platnosc (
    ID_Platnosc NUMBER(10) NOT NULL,
    ID_Sprzedaz NUMBER(10) NOT NULL,
    Rodzaj_dokumentu VARCHAR2(10) NOT NULL,
    Forma_platnosci VARCHAR2(10) NOT NULL,
    Data DATE NOT NULL,
    PRIMARY KEY (ID_Platnosc)
);


ALTER TABLE Salon_Samochodowy ADD FOREIGN KEY (ID_Adres) REFERENCES Adres(ID_Adres);

ALTER TABLE Samochod ADD FOREIGN KEY (ID_Salonu) REFERENCES Salon_Samochodowy(ID_Salonu);
ALTER TABLE Samochod ADD FOREIGN KEY (ID_Model) REFERENCES Model(ID_Model);
ALTER TABLE Samochod ADD FOREIGN KEY (ID_Silnik) REFERENCES Silniki(ID_Silnik);
ALTER TABLE Samochod ADD FOREIGN KEY (ID_Wersja) REFERENCES Wersja_Wyposazenia(ID_Wersja);
ALTER TABLE Samochod ADD FOREIGN KEY (ID_Wyposazenie) REFERENCES Dodatkowe_Wyposazenie(ID_Wyposazenie);

ALTER TABLE Pracownicy ADD FOREIGN KEY (ID_Salon) REFERENCES Salon_Samochodowy(ID_Salonu);
ALTER TABLE Pracownicy ADD FOREIGN KEY (ID_Adres) REFERENCES Adres(ID_Adres);
ALTER TABLE Pracownicy ADD FOREIGN KEY (ID_Stanowisko) REFERENCES Stanowiska(ID_Stanowiska);

ALTER TABLE Klient ADD FOREIGN KEY (ID_Adres) REFERENCES Adres(ID_Adres);

ALTER TABLE Naprawa ADD FOREIGN KEY (ID_Samochod) REFERENCES Samochod(ID_Samochodu);
ALTER TABLE Naprawa ADD FOREIGN KEY (ID_Pracownika) REFERENCES Pracownicy(ID_Pracownik);
ALTER TABLE Naprawa ADD FOREIGN KEY (ID_Czesc) REFERENCES Czesci(ID_Czesc);

ALTER TABLE Jazda_Probna ADD FOREIGN KEY (ID_Samochod) REFERENCES Samochod(ID_Samochodu);
ALTER TABLE Jazda_Probna ADD FOREIGN KEY (ID_Pracownik) REFERENCES Pracownicy(ID_Pracownik);
ALTER TABLE Jazda_Probna ADD FOREIGN KEY (ID_Klient) REFERENCES Klient(ID_Klient);

ALTER TABLE Platnosc ADD FOREIGN KEY (ID_Sprzedaz) REFERENCES Sprzedaz(ID_Sprzedaz);

ALTER TABLE Sprzedaz ADD FOREIGN KEY (ID_Pracownik) REFERENCES Pracownicy(ID_Pracownik);
ALTER TABLE Sprzedaz ADD FOREIGN KEY (ID_Klient) REFERENCES Klient(ID_Klient);
ALTER TABLE Sprzedaz ADD FOREIGN KEY (ID_Samochod) REFERENCES Samochod(ID_Samochodu);
ALTER TABLE Sprzedaz ADD FOREIGN KEY (ID_Akcesorium) REFERENCES Akcesoria(ID_Akcesorium);
ALTER TABLE Sprzedaz ADD FOREIGN KEY (ID_Czesc) REFERENCES Czesci(ID_Czesc);
ALTER TABLE Sprzedaz ADD FOREIGN KEY (ID_Naprawa) REFERENCES Naprawa(ID_Naprawa);
ALTER TABLE Sprzedaz ADD FOREIGN KEY (ID_Wynajem) REFERENCES Wynajem(ID_Wynajem);
ALTER TABLE Sprzedaz ADD FOREIGN KEY (ID_Salon) REFERENCES Salon_Samochodowy(ID_Salonu);

ALTER TABLE Magazyn ADD FOREIGN KEY (ID_Silnik) REFERENCES Silniki(ID_Silnik);
ALTER TABLE Magazyn ADD FOREIGN KEY (ID_Akcesorium) REFERENCES Akcesoria(ID_Akcesorium);
ALTER TABLE Magazyn ADD FOREIGN KEY (ID_Samochod) REFERENCES Samochod(ID_Samochodu);
ALTER TABLE Magazyn ADD FOREIGN KEY (ID_Czesc) REFERENCES Czesci(ID_Czesc);

ALTER TABLE Czesci_Samochod ADD FOREIGN KEY (ID_Czesci) REFERENCES Czesci(ID_Czesc);
ALTER TABLE Czesci_Samochod ADD FOREIGN KEY (ID_Samochod) REFERENCES Samochod(ID_Samochodu);

ALTER TABLE Dodatkowe_Samochod ADD FOREIGN KEY (ID_Samochod) REFERENCES Samochod(ID_Samochodu);
ALTER TABLE Dodatkowe_Samochod ADD FOREIGN KEY (ID_Dodatkowe) REFERENCES Dodatkowe_Wyposazenie(ID_Wyposazenie);

ALTER TABLE Wynajem ADD FOREIGN KEY (ID_Pracownik) REFERENCES Pracownicy(ID_Pracownik);
ALTER TABLE Wynajem ADD FOREIGN KEY (ID_Klient) REFERENCES Klient(ID_Klient);
ALTER TABLE Wynajem ADD FOREIGN KEY (ID_Samochod) REFERENCES Samochod(ID_Samochodu);

ALTER TABLE Ulica_slownik ADD FOREIGN KEY (ID_Miasto) REFERENCES Miasto_slownik(ID_Miasto);

ALTER TABLE Adres ADD FOREIGN KEY (ID_Ulica) REFERENCES Ulica_slownik(ID_Ulica);