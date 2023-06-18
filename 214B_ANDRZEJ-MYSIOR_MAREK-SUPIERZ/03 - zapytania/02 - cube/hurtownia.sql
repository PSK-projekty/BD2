--Zapytanie 1: Zestawienia dla różnych kombinacji atrybutów: ID_Sprzedaz, ID_Klient i ID_Samochodu.

    SELECT
        NVL(TO_CHAR(s.ID_Sprzedaz), 'Wszystkie transakcje') AS ID_Sprzedaz,
        NVL(TO_CHAR(k.ID_Klient), 'Wszyscy klienci') AS ID_Klient,
        NVL(TO_CHAR(sa.ID_Samochod), 'Wszystkie samochody') AS ID_Samochodu,
        COUNT(*) AS Liczba_Transakcji,
        SUM(s.Kwota) AS Suma_Kwot
    FROM
        Fakt_Sprzedazy s
        JOIN Wymiar_Klient k ON s.ID_Klient = k.ID_Klient
        JOIN Wymiar_Samochod sa ON s.ID_Samochod = sa.ID_Samochod
    GROUP BY
        CUBE (s.ID_Sprzedaz, k.ID_Klient, sa.ID_Samochod);

    --Task competed in 7,671; 7,24; 7,602 seconds
    --19547 rows

--Zapytanie 2: Zestawienia dla różnych kombinacji atrybutów: ID_Sprzedaz, ID_Klient i ID_Model. 

    SELECT
        NVL(TO_CHAR(s.ID_Sprzedaz), 'Wszystkie transakcje') AS ID_Sprzedaz,
        NVL(TO_CHAR(k.ID_Klient), 'Wszyscy klienci') AS ID_Klient,
        NVL(TO_CHAR(m.ID_Model), 'Wszystkie modele') AS ID_Model,
        COUNT(*) AS Liczba_Transakcji,
        SUM(s.Kwota) AS Suma_Kwot
    FROM
        Fakt_Sprzedazy s
        JOIN Wymiar_Klient k ON s.ID_Klient = k.ID_Klient
        JOIN Wymiar_Samochod sa ON s.ID_Samochod = sa.ID_Samochod
        JOIN Wymiar_Model m ON sa.ID_Model = m.ID_Model
    GROUP BY
        CUBE (s.ID_Sprzedaz, k.ID_Klient, m.ID_Model);


    --Task competed in 8,597; 8,355; 8,123 seconds
    --18619 rows

--Zapytanie 3: Zestawienia dla różnych kombinacji atrybutów: ID_Sprzedaz, ID_Salonu i ID_Pracownik.

    SELECT
        NVL(TO_CHAR(s.ID_Sprzedaz), 'Wszystkie transakcje') AS ID_Sprzedaz,
        NVL(TO_CHAR(ss.ID_Salon), 'Wszystkie salony') AS ID_Salonu,
        NVL(TO_CHAR(p.ID_Pracownik), 'Wszyscy pracownicy') AS ID_Pracownik,
        COUNT(*) AS Liczba_Transakcji,
        SUM(s.Kwota) AS Suma_Kwot
    FROM
        Fakt_Sprzedazy s
        JOIN Wymiar_Salon_Samochodowy ss ON s.ID_Salon = ss.ID_Salon
        JOIN Wymiar_Pracownicy p ON s.ID_Pracownik = p.ID_Pracownik
    GROUP BY
        CUBE (s.ID_Sprzedaz, ss.ID_Salon, p.ID_Pracownik);

    --Task competed in 8,124; 7,813; 9,066 seconds
    --17638 rows