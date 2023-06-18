--Zapytanie 1: Zestawienie liczby samochodów sprzedanych w zależności od ID samochodu, generacji modelu i segmentu samochodu
    
    SELECT
        NVL(TO_CHAR(wy.ID_Samochod), 'Wszystkie samochody') AS ID_Samochodu,
        NVL(TO_CHAR(wm.Generacja), 'Wszystkie generacje') AS Generacja,
        NVL(TO_CHAR(wm.Segment), 'Wszystkie segmenty') AS Segment,
        COUNT(*) AS Liczba_Samochodow,
        SUM(ws.Cena) AS Suma_Cen
    FROM
        Wymiar_Samochod wy,
        Wymiar_Model wm,
        Fakt_Sprzedazy fs,
        Wymiar_Samochod ws
    WHERE
        wy.ID_Model = wm.ID_Model
        AND wy.ID_Samochod = fs.ID_Samochod
        AND ws.ID_Samochod(+) = fs.ID_Samochod
    GROUP BY
        ROLLUP (wy.ID_Samochod, wm.Generacja, wm.Segment);

    --Task competed in 0,376; 0,369; 0,358 seconds
    --2995 rows

--Zapytanie 2: Zestawienie liczby samochodów sprzedanych w zależności od ID samochodu i średniego spalania.
    
    SELECT
        NVL(TO_CHAR(wy.ID_Samochod), 'Wszystkie samochody') AS ID_Samochodu,
        NVL(TO_CHAR(wm.Srednie_spalanie), 'Wszystkie średnie spalanie') AS Srednie_spalanie,
        COUNT(*) AS Liczba_Samochodow,
        SUM(wy.Cena) AS Suma_Cen
    FROM
        Wymiar_Samochod wy,
        Wymiar_Model wm,
        Fakt_Sprzedazy fs
    WHERE
        wy.ID_Model = wm.ID_Model
        AND wy.ID_Samochod = fs.ID_Samochod
    GROUP BY
        ROLLUP (wy.ID_Samochod, wm.Srednie_spalanie);

    --Task competed in 0,202; 0,216; 0,209 seconds
    --1997 rows

--Zapytanie 3: Zestawienie liczby transakcji oraz sumy kwot dla sprzedaży samochodów w zależności od identyfikatora transakcji, identyfikatora modelu samochodu i identyfikatora samochodu.
    
    SELECT
        NVL(TO_CHAR(s.ID_Sprzedaz), 'Wszystkie transakcje') AS ID_Sprzedaz,
        NVL(TO_CHAR(ss.ID_Salon), 'Wszystkie salony') AS ID_Salon,
        NVL(TO_CHAR(st.ID_Stanowisko), 'Wszystkie stanowiska') AS ID_Stanowisko,
        COUNT(*) AS Liczba_Transakcji,
        SUM(s.Kwota) AS Suma_Kwot
    FROM
        Fakt_Sprzedazy s
        JOIN Wymiar_Salon_Samochodowy ss ON s.ID_Salon = ss.ID_Salon
        JOIN Wymiar_Stanowiska st ON s.ID_Stanowisko = st.ID_Stanowisko
    GROUP BY
        ROLLUP (s.ID_Sprzedaz, ss.ID_Salon, st.ID_Stanowisko);


    --Task competed in 5,304; 5,694; 5,142 seconds
    --20935 rows