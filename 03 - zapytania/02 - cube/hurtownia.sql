--Zapytanie 1: Liczba sprzedanych samochodów grupowane według segmentu, roku produkcji i typu napędu.

    SELECT wm.Segment, ws.RokProdukcji, ws.Naped, COUNT(*) AS Liczba_Sprzedanych
    FROM Fakt_Sprzedaz fs
    JOIN Wymiar_Samochod ws ON fs.ID_Samochod = ws.ID_Samochod
    JOIN Wymiar_Model wm ON ws.ID_Model = wm.ID_Model
    GROUP BY CUBE(wm.Segment, ws.RokProdukcji, ws.Naped);

    --To zapytanie generuje zestawienie, w którym dla każdej kombinacji segmentu, roku produkcji i typu napędu podaje liczbę sprzedanych samochodów. Dzięki użyciu operatora CUBE, wynik zawiera również sumy częściowe dla poszczególnych poziomów grupowania, np. sumę sprzedaży dla konkretnego segmentu niezależnie od roku produkcji i napędu.
    --Task competed in 0,052; 0,06; 0,058 seconds
    --346 rows

--Zapytanie 2: Naprawy samochodów, grupowane według typu naprawy, statusu naprawy i roku przyjęcia.

    SELECT wn.Typ_naprawy,
    CASE
        WHEN wn.Data_wydania IS NULL THEN 'W naprawie'
        ELSE 'Zakończona'
    END AS Status_Naprawy,
    EXTRACT(YEAR FROM wn.Data_przyjecia) AS Rok_Przyjecia,
    COUNT(*) AS Liczba_Napraw
    FROM Wymiar_Naprawa wn
    JOIN Wymiar_Samochod ws ON wn.ID_Samochod = ws.ID_Samochod
    JOIN Wymiar_Model wm ON ws.ID_Model = wm.ID_Model
    GROUP BY CUBE(wn.Typ_naprawy, CASE WHEN wn.Data_wydania IS NULL THEN 'W naprawie' ELSE 'Zakończona' END, EXTRACT(YEAR FROM wn.Data_przyjecia));

    --To zapytanie analizuje dane dotyczące napraw samochodowych i oblicza liczbę napraw dla różnych kategorii, takich jak typ naprawy, status naprawy (w naprawie lub zakończona) oraz rok przyjęcia naprawy. Wykorzystuje operację GROUP BY CUBE, która generuje wyniki dla wszystkich kombinacji wartości wskazanych kolumn.
    --Task competed in 0,05; 0,055; 0,057 seconds
    --373 rows

--Zapytanie 3: Liczba klientów i sprzedanych samochodów według miasta i segmentu.

    SELECT wa.Miasto, wm.Segment, COUNT(DISTINCT wk.ID_Klient) AS Liczba_Klientow, COUNT(DISTINCT ws.ID_Samochod) AS Liczba_Sprzedanych_Samochodow
    FROM Fakt_Sprzedaz fs
    JOIN Wymiar_Klient wk ON fs.ID_Klient = wk.ID_Klient
    JOIN Wymiar_Adres wa ON wk.ID_Adres = wa.ID_Adres
    JOIN Wymiar_Samochod ws ON fs.ID_Samochod = ws.ID_Samochod
    JOIN Wymiar_Model wm ON ws.ID_Model = wm.ID_Model
    GROUP BY CUBE(wa.Miasto, wm.Segment)
    ORDER BY wa.Miasto, wm.Segment;

    --To zapytanie grupuje dane ze sprzedaży samochodów na podstawie miasta (a.Miasto) i segmentu (m.Segment) oraz oblicza liczbę unikalnych klientów (LiczbaKlientow) i liczbę sprzedanych samochodów (LiczbaSprzedanychSamochodow) dla każdej kombinacji miasto-segment. Dodatkowo, wykorzystuje funkcję CUBE w klauzuli GROUP BY, co pozwala na generowanie agregacji dla wszystkich możliwych kombinacji grupowania.
    --Task competed in 0,213; 0,207; 0,198 seconds
    --1026 rows