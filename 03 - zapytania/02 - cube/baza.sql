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

    SELECT Typ_naprawy, CASE WHEN Data_wydania IS NULL THEN 'W naprawie' ELSE 'Zakończona' END AS StatusNaprawy, EXTRACT(YEAR FROM Data_przyjecia) AS RokPrzyjecia, COUNT(*) AS LiczbaNapraw
    FROM Naprawa n
    JOIN Sprzedaz s ON n.ID_Naprawa = s.ID_Naprawa
    GROUP BY CUBE (Typ_naprawy, CASE WHEN Data_wydania IS NULL THEN 'W naprawie' ELSE 'Zakończona' END, EXTRACT(YEAR FROM Data_przyjecia));

    --To zapytanie generuje zestawienie, w którym dla każdej kombinacji typu naprawy, statusu naprawy (czy jest zakończona czy w trakcie) i roku przyjęcia naprawy podaje liczbę przeprowadzonych napraw. Dzięki użyciu operatora CUBE, wynik zawiera również sumy częściowe dla poszczególnych poziomów grupowania, np. sumę napraw dla konkretnego typu niezależnie od statusu i roku przyjęcia.
    --Task competed in 0,056 seconds
    --377 rows

--Zapytanie 3: Liczba klientów i sprzedanych samochodów według miasta i segmentu.

    SELECT s.ID_Salonu, s.rokprodukcji AS Rok, SUM(sp.Kwota) AS SumaSprzedazy
    FROM Sprzedaz sp
    JOIN Samochod s ON sp.ID_Samochod = s.ID_Samochodu
    GROUP BY CUBE (s.ID_Salonu, s.rokprodukcji)
    ORDER BY s.ID_Salonu, s.rokprodukcji;

    --o zapytanie generuje zestawienie, które przedstawia liczbę klientów i sprzedanych samochodów dla różnych kombinacji miasta i segmentu. Dzięki zastosowaniu CUBE, otrzymujemy pełne zestawienie dla wszystkich możliwych kombinacji grup
    --Task competed in 0,148 seconds
    --285 rows