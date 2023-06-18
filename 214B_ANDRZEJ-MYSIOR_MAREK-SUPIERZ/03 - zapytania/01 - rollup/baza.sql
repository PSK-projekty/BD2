--Zapytanie 1: Zestawienie liczby samochodów sprzedanych w zależności od ID samochodu, generacji modelu i segmentu samochodu
    
    SELECT
        NVL(TO_CHAR(s.ID_Samochodu), 'Wszystkie samochody') AS ID_Samochodu,
        NVL(TO_CHAR(m.Generacja), 'Wszystkie generacje') AS Generacja,
        NVL(TO_CHAR(m.Segment), 'Wszystkie segmenty') AS Segment,
        COUNT(*) AS Liczba_Samochodow,
        SUM(s.Cena) AS Suma_Cen
    FROM
        Samochod s,
        Model m,
        Sprzedaz sp
    WHERE
        s.ID_Model = m.ID_Model
        AND s.ID_Samochodu = sp.ID_Samochod
    GROUP BY
        ROLLUP (s.ID_Samochodu, m.Generacja, m.Segment)

    --Task competed in 0,383; 0,378; 0,37 seconds
    --2995 rows

--Zapytanie 2: Zestawienie liczby samochodów sprzedanych w zależności od ID samochodu i średniego spalania.

    SELECT
        NVL(TO_CHAR(s.ID_Samochodu), 'Wszystkie samochody') AS ID_Samochodu,
        NVL(TO_CHAR(m.Srednie_spalanie), 'Wszystkie średnie spalanie') AS Srednie_spalanie,
        COUNT(*) AS Liczba_Samochodow,
        SUM(s.Cena) AS Suma_Cen
    FROM
        Samochod s,
        Model m,
        Sprzedaz sp
    WHERE
        s.ID_Model = m.ID_Model
        AND s.ID_Samochodu = sp.ID_Samochod
    GROUP BY
        ROLLUP (s.ID_Samochodu, m.Srednie_spalanie);

    --Task competed in 0,252; 0,22; 0,228 seconds
    --1997 rows

--Zapytanie 3: Zestawienie liczby transakcji oraz sumy kwot dla sprzedaży samochodów w zależności od identyfikatora transakcji, identyfikatora modelu samochodu i identyfikatora samochodu.
    
    SELECT
        NVL(TO_CHAR(s.ID_Sprzedaz), 'Wszystkie transakcje') AS ID_Sprzedaz,
        NVL(TO_CHAR(sa.ID_Salonu), 'Wszystkie salony') AS ID_Salonu,
        NVL(TO_CHAR(st.ID_Stanowiska), 'Wszystkie stanowiska') AS ID_Stanowiska,
        COUNT(*) AS Liczba_Transakcji,
        SUM(s.Kwota) AS Suma_Kwot
    FROM
        Sprzedaz s
        JOIN Samochod sa ON s.ID_Samochod = sa.ID_Samochodu
        JOIN Stanowiska st ON s.ID_Pracownik = st.ID_Stanowiska
    GROUP BY
        ROLLUP (s.ID_Sprzedaz, sa.ID_Salonu, st.ID_Stanowiska);

   --Task competed in 5,327; 6,091; 5,342 seconds
   --20935 rows