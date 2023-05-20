--Zapytanie 1: Liczba sprzedanych samochodów grupowane według segmentu, roku produkcji i typu napędu.

    SELECT Segment, RokProdukcji, Naped, COUNT(*) AS LiczbaSprzedanych
    FROM Sprzedaz s
    JOIN Samochod sa ON s.ID_Samochod = sa.ID_Samochodu
    JOIN Model m ON sa.ID_Model = m.ID_Model
    GROUP BY CUBE (Segment, RokProdukcji, Naped);

    --To zapytanie generuje zestawienie, w którym dla każdej kombinacji segmentu, roku produkcji i typu napędu podaje liczbę sprzedanych samochodów. Dzięki użyciu operatora CUBE, wynik zawiera również sumy częściowe dla poszczególnych poziomów grupowania, np. sumę sprzedaży dla konkretnego segmentu niezależnie od roku produkcji i napędu.
    --Task competed in 0,053 seconds
    --348 rows

--Zapytanie 2: Naprawy samochodów, grupowane według typu naprawy, statusu naprawy i roku przyjęcia.

    SELECT n.Typ_naprawy, 
        CASE 
            WHEN n.Data_wydania IS NULL THEN 'W naprawie' 
            ELSE 'Zakończona' 
        END AS StatusNaprawy, 
        EXTRACT(YEAR FROM n.Data_przyjecia) AS RokPrzyjecia, 
        COUNT(*) AS LiczbaNapraw
    FROM Naprawa n
    JOIN Samochod s ON n.ID_Samochod = s.ID_Samochodu
    JOIN Model m ON s.ID_Model = m.ID_Model
    GROUP BY CUBE (n.Typ_naprawy, CASE WHEN n.Data_wydania IS NULL THEN 'W naprawie' ELSE 'Zakończona' END, EXTRACT(YEAR FROM n.Data_przyjecia));

    --To zapytanie analizuje dane dotyczące napraw samochodowych i oblicza liczbę napraw dla różnych kategorii, takich jak typ naprawy, status naprawy (w naprawie lub zakończona) oraz rok przyjęcia naprawy. Wykorzystuje operację GROUP BY CUBE, która generuje wyniki dla wszystkich kombinacji wartości wskazanych kolumn.
    --Task competed in 0,338 seconds
    --377 rows

--Zapytanie 3: Liczba klientów i sprzedanych samochodów według miasta i segmentu.

    SELECT a.Miasto, m.Segment, COUNT(DISTINCT k.ID_Klient) AS LiczbaKlientow, COUNT(DISTINCT sp.ID_Samochod) AS LiczbaSprzedanychSamochodow
    FROM Sprzedaz sp
    JOIN Klient k ON sp.ID_Klient = k.ID_Klient
    JOIN Adres a ON k.ID_Adres = a.ID_Adres
    JOIN Samochod s ON sp.ID_Samochod = s.ID_Samochodu
    JOIN Model m ON s.ID_Model = m.ID_Model
    GROUP BY CUBE (a.Miasto, m.Segment)
    ORDER BY a.Miasto, m.Segment;

    --To zapytanie grupuje dane ze sprzedaży samochodów na podstawie miasta (a.Miasto) i segmentu (m.Segment) oraz oblicza liczbę unikalnych klientów (LiczbaKlientow) i liczbę sprzedanych samochodów (LiczbaSprzedanychSamochodow) dla każdej kombinacji miasto-segment. Dodatkowo, wykorzystuje funkcję CUBE w klauzuli GROUP BY, co pozwala na generowanie agregacji dla wszystkich możliwych kombinacji grupowania.
    --Task competed in 0,349 seconds
    --1002 rows