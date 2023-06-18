--Zapytanie 1:Obliczanie średniej kwoty transakcji (Kwota) dla poszczególnych klientów (ID_Klient) w okresie ostatnich 3 miesięcy

    SELECT
        s.ID_Klient,
        k.Imie,
        k.Nazwisko,
        m.Nazwa AS Model,
        s.Data,
        AVG(s.Kwota) OVER (PARTITION BY s.ID_Klient ORDER BY s.Data ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS Srednia_Kwota_3m
    FROM
        Fakt_Sprzedazy s
        JOIN Wymiar_Klient k ON s.ID_Klient = k.ID_Klient
        JOIN Wymiar_Samochod sm ON s.ID_Samochod = sm.ID_Samochod
        JOIN Wymiar_Model m ON sm.ID_Model = m.ID_Model
    WHERE
        s.Data >= TRUNC(SYSDATE) - INTERVAL '3' MONTH;
    
    --Task competed in 0,361; 0,356; 0,373 seconds
    --885 rows

--Zapytanie 2: Obliczenie sumy kwot transakcji (Kwota) dla poszczególnych klientów (ID_Klient) w okresie ostatnich 7 dni. 

    SELECT
        s.ID_Klient,
        k.Imie,
        k.Nazwisko,
        ss.Nazwa AS Salon,
        s.Data,
        SUM(s.Kwota) OVER (PARTITION BY s.ID_Klient ORDER BY s.Data RANGE BETWEEN INTERVAL '6' DAY PRECEDING AND CURRENT ROW) AS Suma_Kwot_7dni
    FROM
        Fakt_Sprzedazy s
        JOIN Wymiar_Klient k ON s.ID_Klient = k.ID_Klient
        JOIN Wymiar_Salon_Samochodowy ss ON s.ID_Salon = ss.ID_Salon
    WHERE
        s.Data >= TRUNC(SYSDATE) - INTERVAL '7' DAY;


    --Task competed in 0,366; 0,368; 0,367 seconds
    --908 rows

--Zapytanie 3: Suma kwot transakcji (Kwota) dla poszczególnych klientów w określonym okresie czasowym.

    SELECT
        ss.ID_Salon,
        p.ID_Pracownik,
        s.Data,
        s.Kwota,
        SUM(s.Kwota) OVER (
            PARTITION BY ss.ID_Salon
            ORDER BY s.Data
            ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
        ) AS Suma_Kwot_Okno
    FROM
        Fakt_Sprzedazy s
        JOIN Wymiar_Salon_Samochodowy ss ON s.ID_Salon = ss.ID_Salon
        JOIN Wymiar_Pracownicy p ON s.ID_Pracownik = p.ID_Pracownik
    WHERE
        s.Data BETWEEN TO_DATE('2022-01-01', 'YYYY-MM-DD') AND TO_DATE('2022-12-31', 'YYYY-MM-DD');
    
    --Task competed in 0,575; 0,201; 0,195 seconds
    --577 rows