--Zapytanie 1: Suma kwot transakcji (Kwota) dla poszczególnych klientów (ID_Klient) w zależności od modelu samochodu (Nazwa). Wyniki grupowane są po ID_Klient i Nazwa Modelu.

    SELECT
        k.ID_Klient,
        m.Nazwa_Modelu AS Model,
        SUM(s.Kwota) AS Suma_Kwot
    FROM
        Sprzedaz s
        JOIN Wymiar_Samochod sa ON s.ID_Samochod = sa.ID_Samochod
        JOIN Wymiar_Klient k ON s.ID_Klient = k.ID_Klient
        JOIN Wymiar_Model m ON sa.ID_Model = m.ID_Model
    GROUP BY
        k.ID_Klient, m.Nazwa_Modelu;

    --Task competed in 1,819; 1,891; 1,926 seconds
    --6729 rows

--Zapytanie 2: Liczba transakcji (ID_Sprzedaz) dla poszczególnych salonów samochodowych (ID_Salonu) w zależności od pracownika (ID_Pracownik).

    SELECT
        ss.ID_Salon,
        p.ID_Pracownik,
        COUNT(s.ID_Sprzedaz) AS Liczba_Transakcji
    FROM
        Sprzedaz s
        JOIN Wymiar_Salon_Samochodowy ss ON s.ID_Salon = ss.ID_Salon
        JOIN Wymiar_Pracownicy p ON s.ID_Pracownik = p.ID_Pracownik
    GROUP BY
        ss.ID_Salon, p.ID_Pracownik;

    --Task competed in 3,181; 1,966; 2,179 seconds
    --7879 rows

--Zapytanie 3: Zapytanie oblicza średni przebieg, sumę cen oraz najstarszy rok produkcji dla każdego modelu samochodu.

    SELECT
        s.ID_Samochod,
        m.Nazwa_Modelu AS Model,
        s.Przebieg,
        AVG(s.Przebieg) OVER (PARTITION BY m.ID_Model) AS Sredni_Przebieg_Modelu,
        SUM(s.Cena) OVER (PARTITION BY m.ID_Model) AS Suma_Cen_Modelu,
        MIN(s.RokProdukcji) OVER (PARTITION BY m.ID_Model) AS Najstarszy_Rok_Produkcji_Modelu
    FROM
        Wymiar_Samochod s
        JOIN Wymiar_Model m ON s.ID_Model = m.ID_Model;

    --Task competed in 0,345; 0,352; 0,365 seconds
    --1000 rows