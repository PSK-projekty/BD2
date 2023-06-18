CREATE OR REPLACE PROCEDURE load_data AS
BEGIN
    -- Przeniesienie danych dla wymiaru salonów samochodowych
    INSERT INTO Wymiar_Salon_Samochodowy (ID_Salon, Nazwa_Salonu)
    SELECT ID_Salonu, Nazwa
    FROM Salon_Samochodowy;

    -- Przeniesienie danych dla wymiaru pracowników
    INSERT INTO Wymiar_Pracownicy (ID_Pracownik, Imie, Nazwisko)
    SELECT ID_Pracownik, Imie, Nazwisko
    FROM Pracownicy;

    -- Przeniesienie danych dla wymiaru modeli
    INSERT INTO Wymiar_Model (ID_Model, Nazwa_Modelu, Segment, Generacja, Srednie_spalanie)
    SELECT ID_Model, Nazwa, Segment, Generacja, Srednie_spalanie
    FROM Model;

    -- Przeniesienie danych dla wymiaru klientów
    INSERT INTO Wymiar_Klient (ID_Klient, Imie, Nazwisko)
    SELECT ID_Klient, Imie, Nazwisko
    FROM Klient;

    -- Przeniesienie danych dla wymiaru stanowisk
    INSERT INTO Wymiar_Stanowiska (ID_Stanowisko, Nazwa_Stanowiska)
    SELECT ID_Stanowiska, Nazwa
    FROM Stanowiska;

    -- Przeniesienie danych dla wymiaru samochodów
    INSERT INTO Wymiar_Samochod (ID_Samochod, ID_Model, RokProdukcji, Przebieg, Cena)
    SELECT ID_Samochodu, ID_Model, RokProdukcji, Przebieg, Cena
    FROM Samochod;

    -- Przeniesienie danych dla faktów sprzedaży
    INSERT INTO Fakt_Sprzedazy (
        ID_Sprzedaz, ID_Salon, ID_Pracownik, ID_Klient, ID_Stanowisko, ID_Samochod, id_naprawa, Data, Kwota
    )
    SELECT
        s.ID_Sprzedaz, s.ID_Salon, s.ID_Pracownik,
        s.ID_Klient, p.ID_Stanowisko, sa.ID_Samochodu, s.Data, s.Kwota
    FROM
        Sprzedaz s
    JOIN Pracownicy p ON s.ID_Pracownik = p.ID_Pracownik
    JOIN Samochod sa ON s.ID_Samochod = sa.ID_Samochodu

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK; -- Wycofujemy transakcję w przypadku błędu.
        RAISE; -- Przekazujemy wyjątek wyżej.
END;
/
EXECUTE load_data();
