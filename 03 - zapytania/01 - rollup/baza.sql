--Zapytanie 1: Suma sprzedaży samochodów według roku produkcji, koloru i klienta.

    SELECT s.RokProdukcji, s.Kolor, k.Imie, k.Nazwisko, SUM(spr.Kwota) AS SumaSprzedazy
    FROM Sprzedaz spr
    JOIN Samochod s ON spr.ID_Samochod = s.ID_Samochodu
    JOIN Klient k ON spr.ID_Klient = k.ID_Klient
    GROUP BY ROLLUP (s.RokProdukcji, s.Kolor, k.Imie, k.Nazwisko);

    --To zapytanie oblicza sumę sprzedaży samochodów z uwzględnieniem rocznika, koloru, klienta i ogólnej sumy sprzedaży dla każdej   kombinacji. Dzięki ROLLUP otrzymujemy również sumy częściowe dla poszczególnych poziomów hierarchii (rocznik, kolor, klient) oraz ogólną sumę sprzedaży dla wszystkich kombinacji. 
    --Task competed in 3,312; 3,118; 3,04 seconds
    --13997 rows

--Zapytanie 2: Suma sprzedaży akcesoriów grupowana według typu akcesorium i klienta.

    SELECT a.Nazwa, k.Imie, k.Nazwisko, SUM(spr.Kwota) AS SumaSprzedazy
    FROM Sprzedaz spr
    JOIN Akcesoria a ON spr.ID_Akcesorium = a.ID_Akcesorium
    JOIN Klient k ON spr.ID_Klient = k.ID_Klient
    GROUP BY ROLLUP (a.Nazwa, k.Imie, k.Nazwisko);
    
    --W tym zapytaniu agregujemy sumę sprzedaży akcesoriów według typu akcesorium i klienta. ROLLUP pozwala uzyskać sumy częściowe dla poszczególnych poziomów hierarchii oraz ogólną sumę sprzedaży dla wszystkich kombinacji.
    --Task competed in 2,451; 2,626; 2,503 seconds
    --14187rows

--Zapytanie 3: Liczba sprzedanych samochodów w danym salonie w poszczególnych latach

    SELECT Salon_Samochodowy.Nazwa, EXTRACT(YEAR FROM Sprzedaz.Data) AS Rok, COUNT(*) AS LiczbaSprzedanych
    FROM Sprzedaz
    JOIN Samochod ON Sprzedaz.ID_Samochod = Samochod.ID_Samochodu
    JOIN Salon_Samochodowy ON Samochod.ID_Salonu = Salon_Samochodowy.ID_Salonu
    GROUP BY ROLLUP(Salon_Samochodowy.Nazwa, EXTRACT(YEAR FROM Sprzedaz.Data));

    --To zapytanie wykorzystuje tabelę Sprzedaz, Samochod i Salon_Samochodowy. ROLLUP jest używany do zsumowania liczby sprzedanych samochodów w danym salonie w poszczególnych latach. Wynik będzie zawierał sumy sprzedaży dla każdego salonu samochodowego w poszczególnych latach, a także ogólną sumę dla wszystkich salonów i lat.
    --Task competed in 0,1; 0,83; 0,87 seconds
    --701 rows