DROP TABLE SalonSamochodowy CASCADE CONSTRAINTS;
DROP TABLE Samochod CASCADE CONSTRAINTS;
DROP TABLE Model CASCADE CONSTRAINTS;
DROP TABLE Silniki CASCADE CONSTRAINTS;
DROP TABLE Pracownicy CASCADE CONSTRAINTS;
DROP TABLE Klient CASCADE CONSTRAINTS;
DROP TABLE Adres CASCADE CONSTRAINTS;
DROP TABLE Naprawa CASCADE CONSTRAINTS;
DROP TABLE JazdaProbna CASCADE CONSTRAINTS;
DROP TABLE Platnosc CASCADE CONSTRAINTS;
DROP TABLE Sprzedaz CASCADE CONSTRAINTS;
DROP TABLE Akcesoria CASCADE CONSTRAINTS;
DROP TABLE Stanowiska CASCADE CONSTRAINTS;
DROP TABLE WersjaWyposazenia CASCADE CONSTRAINTS;
DROP TABLE Wynajem CASCADE CONSTRAINTS;
DROP TABLE Czesci CASCADE CONSTRAINTS;
DROP TABLE DodatkoweWyposazenie CASCADE CONSTRAINTS;
DROP TABLE Magazyn CASCADE CONSTRAINTS;
DROP TABLE Wynajem_Pracownicy CASCADE CONSTRAINTS;
DROP TABLE Wynajem_Klient CASCADE CONSTRAINTS;
DROP TABLE Czesci_Samochod CASCADE CONSTRAINTS;
DROP TABLE Wynajem_Samochod CASCADE CONSTRAINTS;
DROP TABLE Akcesoria_Samochod CASCADE CONSTRAINTS;
DROP TABLE Dodatkowe_Samochod CASCADE CONSTRAINTS;
DROP TABLE WyposazenieSprzedaz CASCADE CONSTRAINTS;


CREATE TABLE SalonSamochodowy (
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
    SrednieSpalanie NUMBER(4,2) NOT NULL,
    Waga NUMBER(10) NOT NULL,
    PRIMARY KEY (ID_Model)
);

CREATE TABLE Silniki (
    ID_Silnik NUMBER(10) NOT NULL,
    Pojemnosc NUMBER(5),
    Moc_kW NUMBER(5) NOT NULL,
    Moc_KM NUMBER(5) NOT NULL,
    MomentObrotowy NUMBER(5) NOT NULL,
    TypSilnika VARCHAR2(10) NOT NULL,
    Paliwo VARCHAR2(10),
    Numer VARCHAR2(15) NOT NULL,
    PRIMARY KEY (ID_Silnik),
    UNIQUE (Numer)
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
    NumerDomu VARCHAR2(3),
    NumerMieszkania VARCHAR2(3),
    KodPocztowy VARCHAR2(10) NOT NULL,
    Ulica VARCHAR2(100),
    PRIMARY KEY (ID_Adres)
);

CREATE TABLE Naprawa (
    ID_Naprawa NUMBER(10) NOT NULL,
    ID_Samochod NUMBER(10) NOT NULL,
    ID_Pracownika NUMBER(10) NOT NULL,
    ID_Czesc NUMBER(10) NOT NULL,
    TypNaprawy VARCHAR2(15) NOT NULL,
    DataPrzyjecia DATE NOT NULL,
    DataWydania DATE,
    Cena NUMBER(5,2),
    PRIMARY KEY (ID_Naprawa)
);

CREATE TABLE JazdaProbna (
    ID_JazdaProbna NUMBER(10) NOT NULL,
    ID_Samochod NUMBER(10) NOT NULL,
    ID_Pracownik NUMBER(10) NOT NULL,
    ID_Klient NUMBER(10) NOT NULL,
    Data DATE NOT NULL,
    PRIMARY KEY (ID_JazdaProbna)
);

CREATE TABLE Platnosc (
    ID_Platnosc NUMBER(10) NOT NULL,
    ID_Sprzedaz NUMBER(10) NOT NULL,
    RodzajDokumentu VARCHAR2(10) NOT NULL,
    FormaPlatnosci VARCHAR2(10) NOT NULL,
    Data NUMBER NOT NULL,
    PRIMARY KEY (ID_Platnosc)
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
    PremiaZaStanowisko NUMBER(3) NOT NULL,
    PRIMARY KEY (ID_Stanowiska)
);

CREATE TABLE WersjaWyposazenia (
    ID_Wersja NUMBER(10) NOT NULL,
    Nazwa VARCHAR2(100) NOT NULL,
    PoziomWyposazenia NUMBER(2) NOT NULL,
    Cena NUMBER(5,2) NOT NULL,
    PRIMARY KEY (ID_Wersja)
);

CREATE TABLE Wynajem (
    ID_Wynajem NUMBER(10) NOT NULL,
    ID_Wynajem_Klient NUMBER(10) NOT NULL,
    ID_Wynajem_Pracownicy NUMBER(10) NOT NULL,
    ID_Wynajem_Samochod NUMBER(10) NOT NULL,
    DataWynajmu DATE NOT NULL,
    DataZwrotu DATE,
    Cena NUMBER(5,2) NOT NULL,
    PRIMARY KEY (ID_Wynajem)
);

CREATE TABLE Czesci (
    ID_Czesc NUMBER(10) NOT NULL,
    ID_Czesci_Samochod NUMBER(10) NOT NULL,
    Nazwa VARCHAR2(100) NOT NULL,
    Numer VARCHAR2(15) NOT NULL,
    Cena NUMBER(5,2) NOT NULL,
    PRIMARY KEY (ID_Czesc),
    UNIQUE (Numer)
);

CREATE TABLE DodatkoweWyposazenie (
    ID_Wyposazenie NUMBER(10) NOT NULL,
    ID_Dodatkowe_Samochod NUMBER(10) NOT NULL,
    Nazwa VARCHAR2(100) NOT NULL,
    Cena NUMBER(5,2) NOT NULL,
    PRIMARY KEY (ID_Wyposazenie)
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

CREATE TABLE Wynajem_Pracownicy (
    ID_wynajem_pracownicy NUMBER(10) NOT NULL,
    ID_Wynajem NUMBER(10) NOT NULL,
    ID_Pracownik NUMBER(10) NOT NULL,
    PRIMARY KEY (ID_wynajem_pracownicy)
);

CREATE TABLE Wynajem_Klient (
    ID_Wynajem_Klient NUMBER(10) NOT NULL,
    ID_Wynajem NUMBER(10) NOT NULL,
    ID_Klient NUMBER(10) NOT NULL,
    PRIMARY KEY (ID_Wynajem_Klient)
);

CREATE TABLE Czesci_Samochod (
    ID_Czesci_Samochod NUMBER(10) NOT NULL,
    ID_Czesci NUMBER(10) NOT NULL,
    ID_Samochod NUMBER(10) NOT NULL,
    PRIMARY KEY (ID_Czesci_Samochod)
);

CREATE TABLE Wynajem_Samochod (
    ID_Wynajem_Samochod NUMBER(10) NOT NULL,
    ID_Wynajem NUMBER(10) NOT NULL,
    ID_Samochod NUMBER(10) NOT NULL,
    PRIMARY KEY (ID_Wynajem_Samochod)
);

CREATE TABLE Akcesoria_Samochod (
    ID_Akcesoria_Samochod NUMBER(10) NOT NULL,
    ID_Akcesoria NUMBER(10) NOT NULL,
    ID_Samochod NUMBER(10) NOT NULL,
    PRIMARY KEY (ID_Akcesoria_Samochod)
);

CREATE TABLE Dodatkowe_Samochod (
    ID_Dodatkowe_Samochod NUMBER(10) NOT NULL,
    ID_Dodatkowe NUMBER(10) NOT NULL,
    ID_Samochod NUMBER(10) NOT NULL,
    PRIMARY KEY (ID_Dodatkowe_Samochod)
);

CREATE TABLE WyposazenieSprzedaz (
    ID_WyposazenieSprzedaz NUMBER(10) NOT NULL,
    ID_Wyposazenie NUMBER(10) NOT NULL,
    ID_Sprzedaz NUMBER(10) NOT NULL,
    PRIMARY KEY (ID_WyposazenieSprzedaz)
);

ALTER TABLE SalonSamochodowy ADD FOREIGN KEY (ID_Adres) REFERENCES Adres(ID_Adres);

ALTER TABLE Samochod ADD FOREIGN KEY (ID_Salonu) REFERENCES SalonSamochodowy(ID_Salonu);
ALTER TABLE Samochod ADD FOREIGN KEY (ID_Model) REFERENCES Model(ID_Model);
ALTER TABLE Samochod ADD FOREIGN KEY (ID_Silnik) REFERENCES Silniki(ID_Silnik);
ALTER TABLE Samochod ADD FOREIGN KEY (ID_Wersja) REFERENCES WersjaWyposazenia(ID_Wersja);
ALTER TABLE Samochod ADD FOREIGN KEY (ID_Czesci_Samochod) REFERENCES Czesci_Samochod(ID_Czesci_Samochod);
ALTER TABLE Samochod ADD FOREIGN KEY (ID_Wynajem_Samochod) REFERENCES Wynajem_Samochod(ID_Wynajem_Samochod);
ALTER TABLE Samochod ADD FOREIGN KEY (ID_Dodatkowe_Samochod) REFERENCES Dodatkowe_Samochod(ID_Dodatkowe_Samochod);
ALTER TABLE Samochod ADD FOREIGN KEY (ID_Wyposazenie) REFERENCES DodatkoweWyposazenie(ID_Wyposazenie);
ALTER TABLE Samochod ADD FOREIGN KEY (ID_Akcesoria_Samochod) REFERENCES Akcesoria_Samochod(ID_Akcesoria_Samochod);

ALTER TABLE Pracownicy ADD FOREIGN KEY (ID_Salon) REFERENCES SalonSamochodowy(ID_Salonu);
ALTER TABLE Pracownicy ADD FOREIGN KEY (ID_Adres) REFERENCES Adres(ID_Adres);
ALTER TABLE Pracownicy ADD FOREIGN KEY (ID_Stanowisko) REFERENCES Stanowiska(ID_Stanowiska);
ALTER TABLE Pracownicy ADD FOREIGN KEY (ID_Wynajem_Pracownicy) REFERENCES Wynajem_Pracownicy(ID_wynajem_pracownicy);

ALTER TABLE Klient ADD FOREIGN KEY (ID_Adres) REFERENCES Adres(ID_Adres);
ALTER TABLE Klient ADD FOREIGN KEY (ID_Wynajem_Klient) REFERENCES Wynajem_Klient(ID_Wynajem_Klient);

ALTER TABLE Naprawa ADD FOREIGN KEY (ID_Samochod) REFERENCES Samochod(ID_Samochodu);
ALTER TABLE Naprawa ADD FOREIGN KEY (ID_Pracownika) REFERENCES Pracownicy(ID_Pracownik);
ALTER TABLE Naprawa ADD FOREIGN KEY (ID_Czesc) REFERENCES Czesci(ID_Czesc);

ALTER TABLE JazdaProbna ADD FOREIGN KEY (ID_Samochod) REFERENCES Samochod(ID_Samochodu);
ALTER TABLE JazdaProbna ADD FOREIGN KEY (ID_Pracownik) REFERENCES Pracownicy(ID_Pracownik);
ALTER TABLE JazdaProbna ADD FOREIGN KEY (ID_Klient) REFERENCES Klient(ID_Klient);

ALTER TABLE Platnosc ADD FOREIGN KEY (ID_Sprzedaz) REFERENCES Sprzedaz(ID_Sprzedaz);

ALTER TABLE Sprzedaz ADD FOREIGN KEY (ID_Pracownik) REFERENCES Pracownicy(ID_Pracownik);
ALTER TABLE Sprzedaz ADD FOREIGN KEY (ID_Klient) REFERENCES Klient(ID_Klient);
ALTER TABLE Sprzedaz ADD FOREIGN KEY (ID_Samochod) REFERENCES Samochod(ID_Samochodu);
ALTER TABLE Sprzedaz ADD FOREIGN KEY (ID_Akcesorium) REFERENCES Akcesoria(ID_Akcesorium);
ALTER TABLE Sprzedaz ADD FOREIGN KEY (ID_Czesc) REFERENCES Czesci(ID_Czesc);
ALTER TABLE Sprzedaz ADD FOREIGN KEY (ID_Naprawa) REFERENCES Naprawa(ID_Naprawa);
ALTER TABLE Sprzedaz ADD FOREIGN KEY (ID_Wyposazenie) REFERENCES DodatkoweWyposazenie(ID_Wyposazenie);
ALTER TABLE Sprzedaz ADD FOREIGN KEY (ID_Wynajem) REFERENCES Wynajem(ID_Wynajem);

ALTER TABLE Akcesoria ADD FOREIGN KEY (ID_Akcesoria_Samochod) REFERENCES Akcesoria_Samochod(ID_Akcesoria_Samochod);

ALTER TABLE Wynajem ADD FOREIGN KEY (ID_Wynajem_Samochod) REFERENCES Wynajem_Samochod(ID_Wynajem_Samochod);
ALTER TABLE Wynajem ADD FOREIGN KEY (ID_Wynajem_Klient) REFERENCES Wynajem_Klient(ID_Wynajem_Klient);
ALTER TABLE Wynajem ADD FOREIGN KEY (ID_Wynajem_Pracownicy) REFERENCES Wynajem_Pracownicy(ID_wynajem_pracownicy);

ALTER TABLE Czesci ADD FOREIGN KEY (ID_Czesci_Samochod) REFERENCES Czesci_Samochod(ID_Czesci_Samochod);

ALTER TABLE DodatkoweWyposazenie ADD FOREIGN KEY (ID_Dodatkowe_Samochod) REFERENCES Dodatkowe_Samochod(ID_Dodatkowe_Samochod);

ALTER TABLE Magazyn ADD FOREIGN KEY (ID_Silnik) REFERENCES Silniki(ID_Silnik);
ALTER TABLE Magazyn ADD FOREIGN KEY (ID_Akcesorium) REFERENCES Akcesoria(ID_Akcesorium);
ALTER TABLE Magazyn ADD FOREIGN KEY (ID_Samochod) REFERENCES Samochod(ID_Samochodu);
ALTER TABLE Magazyn ADD FOREIGN KEY (ID_Czesc) REFERENCES Czesci(ID_Czesc);

ALTER TABLE Wynajem_Pracownicy ADD FOREIGN KEY (ID_Pracownik) REFERENCES Pracownicy(ID_Pracownik);
ALTER TABLE Wynajem_Pracownicy ADD FOREIGN KEY (ID_Wynajem) REFERENCES Wynajem(ID_Wynajem);

ALTER TABLE Wynajem_Klient ADD FOREIGN KEY (ID_Klient) REFERENCES Klient(ID_Klient);
ALTER TABLE Wynajem_Klient ADD FOREIGN KEY (ID_Wynajem) REFERENCES Wynajem(ID_Wynajem);

ALTER TABLE Czesci_Samochod ADD FOREIGN KEY (ID_Czesci) REFERENCES Czesci(ID_Czesc);
ALTER TABLE Czesci_Samochod ADD FOREIGN KEY (ID_Samochod) REFERENCES Samochod(ID_Samochodu);

ALTER TABLE Wynajem_Samochod ADD FOREIGN KEY (ID_Samochod) REFERENCES Samochod(ID_Samochodu);
ALTER TABLE Wynajem_Samochod ADD FOREIGN KEY (ID_Wynajem) REFERENCES Wynajem(ID_Wynajem);

ALTER TABLE Akcesoria_Samochod ADD FOREIGN KEY (ID_Samochod) REFERENCES Samochod(ID_Samochodu);
ALTER TABLE Akcesoria_Samochod ADD FOREIGN KEY (ID_Akcesoria) REFERENCES Akcesoria(ID_Akcesorium);
ALTER TABLE Dodatkowe_Samochod ADD FOREIGN KEY (ID_Samochod) REFERENCES Samochod(ID_Samochodu);
ALTER TABLE Dodatkowe_Samochod ADD FOREIGN KEY (ID_Dodatkowe) REFERENCES DodatkoweWyposazenie(ID_Wyposazenie);

ALTER TABLE WyposazenieSprzedaz ADD FOREIGN KEY (ID_Wyposazenie) REFERENCES DodatkoweWyposazenie(ID_Wyposazenie);
ALTER TABLE WyposazenieSprzedaz ADD FOREIGN KEY (ID_Sprzedaz) REFERENCES Sprzedaz(ID_Sprzedaz);