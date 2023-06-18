--Zapytanie 1: Zestawienia dla różnych kombinacji atrybutów: ID_Sprzedaz, ID_Klient i ID_Samochodu.

    SELECT
        NVL(TO_CHAR(s.ID_Sprzedaz), 'Wszystkie transakcje') AS ID_Sprzedaz,
        NVL(TO_CHAR(k.ID_Klient), 'Wszyscy klienci') AS ID_Klient,
        NVL(TO_CHAR(sa.ID_Samochodu), 'Wszystkie samochody') AS ID_Samochodu,
        COUNT(*) AS Liczba_Transakcji,
        SUM(s.Kwota) AS Suma_Kwot
    FROM
        Sprzedaz s
        JOIN Klient k ON s.ID_Klient = k.ID_Klient
        JOIN Samochod sa ON s.ID_Samochod = sa.ID_Samochodu
    GROUP BY
        CUBE (s.ID_Sprzedaz, k.ID_Klient, sa.ID_Samochodu);


    --Task competed in 7,851; 7,32; 7,643 seconds
    --19547 rows

--Zapytanie 2: Zestawienia dla różnych kombinacji atrybutów: ID_Sprzedaz, ID_Klient i ID_Model. 

    SELECT
        NVL(TO_CHAR(ss.Nazwa), 'Wszystkie salony') AS Nazwa_Salonu,
        NVL(TO_CHAR(m.Nazwa), 'Wszystkie modele') AS Nazwa_Modelu,
        NVL(TO_CHAR(sil.Typ_silnika), 'Wszystkie typy silników') AS Typ_Silnika,
        COUNT(*) AS Liczba_Samochodow,
        SUM(s.Cena) AS Suma_Cen
    FROM
        Samochod s,
        Silniki sil,
        Salon_Samochodowy ss,
        Model m
    WHERE
        s.ID_Silnik = sil.ID_Silnik
        AND s.ID_Salonu = ss.ID_Salonu
        AND s.ID_Model = m.ID_Model
    GROUP BY
        CUBE (ss.Nazwa, m.Nazwa, sil.Typ_silnika);

    --Task competed in 8,653; 8,41; 8,329 seconds
    --18619 rows

--Zapytanie 3: Zestawienia dla różnych kombinacji atrybutów: ID_Sprzedaz, ID_Salonu i ID_Pracownik.

    SELECT
        NVL(TO_CHAR(s.ID_Sprzedaz), 'Wszystkie transakcje') AS ID_Sprzedaz,
        NVL(TO_CHAR(ss.ID_Salonu), 'Wszystkie salony') AS ID_Salonu,
        NVL(TO_CHAR(p.ID_Pracownik), 'Wszyscy pracownicy') AS ID_Pracownik,
        COUNT(*) AS Liczba_Transakcji,
        SUM(s.Kwota) AS Suma_Kwot
    FROM
        Sprzedaz s
        JOIN Salon_Samochodowy ss ON s.ID_Salon = ss.ID_Salonu
        JOIN Pracownicy p ON s.ID_Pracownik = p.ID_Pracownik
    GROUP BY
        CUBE (s.ID_Sprzedaz, ss.ID_Salonu, p.ID_Pracownik);


    --Task competed in 8,1; 8,257; 9,343 seconds
    --17638 rows