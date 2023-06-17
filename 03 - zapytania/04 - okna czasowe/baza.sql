--Zapytanie 1: Suma cen akcesoriów sprzedanych przez każdego pracownika w oknie czasowym dla danego salonu samochodowego.

    SELECT p.ID_Pracownik, s.ID_Salonu, s.Nazwa, SUM(sp.Kwota) AS SumaCenAkcesoriow
    FROM Sprzedaz sp
    JOIN Pracownicy p ON sp.ID_Pracownik = p.ID_Pracownik
    JOIN Salon_Samochodowy s ON p.ID_Salon = s.ID_Salonu
    WHERE sp.Data BETWEEN TO_DATE('2023-01-01', 'YYYY-MM-DD') AND TO_DATE('2023-12-31', 'YYYY-MM-DD')
    GROUP BY p.ID_Pracownik, s.ID_Salonu, s.Nazwa;

    --Task competed in 0,044; 0,04; 0,043 seconds
    --200 rows

--Zapytanie 2: Średnia liczba wynajmów samochodów w oknie czasowym dla każdego klienta w danym mieście.

    SELECT k.ID_Klient, a.ID_Adres, m.Nazwa_miasta, AVG(w.ID_Wynajem) AS SredniaLiczbaWynajmow
    FROM Wynajem w
    JOIN Klient k ON w.ID_Klient = k.ID_Klient
    JOIN Adres a ON k.ID_Adres = a.ID_Adres
    JOIN Miasto_slownik m ON a.ID_Adres = m.ID_Miasto
    WHERE w.Data_wynajmu BETWEEN TO_DATE('2023-01-01', 'YYYY-MM-DD') AND TO_DATE('2023-12-31', 'YYYY-MM-DD')
    GROUP BY k.ID_Klient, a.ID_Adres, m.Nazwa_miasta;

    --Task competed in 0,045; 0,042; 0,04 seconds
    --79 rows

--Zapytanie 3: Suma cen sprzedaży części w oknie czasowym dla każdego klienta z uwzględnieniem pracownika.

    SELECT s.Data, k.ID_Klient, p.Imie, p.Nazwisko, SUM(s.Kwota) OVER (PARTITION BY k.ID_Klient, p.ID_Pracownik ORDER BY s.Data) AS SumaCenSprzedazy
    FROM Sprzedaz s
    JOIN Klient k ON s.ID_Klient = k.ID_Klient
    JOIN Pracownicy p ON s.ID_Pracownik = p.ID_Pracownik
    WHERE s.Data BETWEEN TO_DATE('2023-01-01', 'YYYY-MM-DD') AND TO_DATE('2023-12-31', 'YYYY-MM-DD');
    
    --Task competed in 0,24; 0,252; 0,236 seconds
    --1648 rows