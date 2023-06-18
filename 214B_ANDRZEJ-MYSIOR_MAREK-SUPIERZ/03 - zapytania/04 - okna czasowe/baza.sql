--Zapytanie 1:Obliczanie średniej kwoty transakcji (Kwota) dla poszczególnych klientów (ID_Klient) w okresie ostatnich 3 miesięcy

    SELECT
        s.ID_Klient,
        k.Imie,
        k.Nazwisko,
        m.Nazwa AS Model,
        s.Data,
        AVG(s.Kwota) OVER (PARTITION BY s.ID_Klient ORDER BY s.Data ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS Srednia_Kwota_3m
    FROM
        Sprzedaz s
        JOIN Klient k ON s.ID_Klient = k.ID_Klient
        JOIN Samochod sm ON s.ID_Samochod = sm.ID_Samochodu
        JOIN Model m ON sm.ID_Model = m.ID_Model
    WHERE
        s.Data >= TRUNC(SYSDATE) - INTERVAL '3' MONTH;


    --Task competed in 0,383; 0,367; 0,375 seconds
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
        Sprzedaz s
        JOIN Klient k ON s.ID_Klient = k.ID_Klient
        JOIN Salon_Samochodowy ss ON s.ID_Salon = ss.ID_Salonu
    WHERE
        s.Data >= TRUNC(SYSDATE) - INTERVAL '7' DAY;


    --Task competed in 0,38; 0,374; 0,368 seconds
    --908 rows

--Zapytanie 3:Suma kwot transakcji (Kwota) dla poszczególnych klientów w określonym okresie czasowym.

    SELECT
        s.Data,
        k.Imie,
        k.Nazwisko,
        SUM(s.Kwota) AS Suma_Kwot
    FROM
        Sprzedaz s
        JOIN Klient k ON s.ID_Klient = k.ID_Klient
        JOIN Samochod sa ON s.ID_Samochod = sa.ID_Samochodu
    WHERE
        s.Data BETWEEN TO_DATE('2022-01-01', 'YYYY-MM-DD') AND TO_DATE('2022-12-31', 'YYYY-MM-DD')
    GROUP BY
        s.Data, k.Imie, k.Nazwisko;

    --Task competed in 0,716; 0,702; 0,378 seconds
    --577 rows