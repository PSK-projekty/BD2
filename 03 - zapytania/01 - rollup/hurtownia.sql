--Zapytanie 1: Suma sprzedaży samochodów według roku produkcji, koloru i klienta.

    SELECT Wymiar_Samochod.RokProdukcji, Wymiar_Samochod.Kolor, 
           Wymiar_Klient.Imie, Wymiar_Klient.Nazwisko, 
           SUM(Fakt_Sprzedaz.Kwota) as Suma_Sprzedazy
    FROM Fakt_Sprzedaz 
    JOIN Wymiar_Samochod ON Fakt_Sprzedaz.ID_Samochod = Wymiar_Samochod.ID_Samochod
    JOIN Wymiar_Klient ON Fakt_Sprzedaz.ID_Klient = Wymiar_Klient.ID_Klient
    GROUP BY ROLLUP (Wymiar_Samochod.RokProdukcji, Wymiar_Samochod.Kolor, Wymiar_Klient.Imie, Wymiar_Klient.Nazwisko);

    --To zapytanie oblicza sumę sprzedaży samochodów z uwzględnieniem rocznika, koloru, klienta i ogólnej sumy sprzedaży dla każdej   kombinacji. Dzięki ROLLUP otrzymujemy również sumy częściowe dla poszczególnych poziomów hierarchii (rocznik, kolor, klient) oraz ogólną sumę sprzedaży dla wszystkich kombinacji. 
    --Task competed in 3,05; 2,966; 2,962 seconds
    --13997 rows

--Zapytanie 2: Suma sprzedaży akcesoriów grupowana według typu akcesorium i klienta.

    SELECT a.Nazwa, k.Imie, k.Nazwisko, SUM(fs.Kwota) AS SumaSprzedazy
    FROM Fakt_Sprzedaz fs
    JOIN Wymiar_Akcesoria a ON fs.ID_Akcesorium = a.ID_Akcesorium
    JOIN Wymiar_Klient k ON fs.ID_Klient = k.ID_Klient
    GROUP BY ROLLUP(a.Nazwa, k.Imie, k.Nazwisko);

    
    --W tym zapytaniu agregujemy sumę sprzedaży akcesoriów według typu akcesorium i klienta. ROLLUP pozwala uzyskać sumy częściowe dla poszczególnych poziomów hierarchii oraz ogólną sumę sprzedaży dla wszystkich kombinacji.
    --Task competed in 2,381; 2,244; 2,26 seconds
    --14187rows

--Zapytanie 3: Liczba sprzedanych samochodów w danym salonie w poszczególnych latach

    SELECT wsl.Nazwa AS Nazwa_Salonu, EXTRACT(YEAR FROM fs.Data) AS Rok, COUNT(*) AS Liczba_Sprzedanych
    FROM Fakt_Sprzedaz fs
    JOIN Wymiar_Samochod s ON fs.ID_Samochod = s.ID_Samochod
    JOIN Wymiar_Salon wsl ON s.ID_Salonu = wsl.ID_Salonu
    GROUP BY ROLLUP(wsl.Nazwa, EXTRACT(YEAR FROM fs.Data));

    --To zapytanie wykorzystuje tabelę Sprzedaz, Samochod i Salon_Samochodowy. ROLLUP jest używany do zsumowania liczby sprzedanych samochodów w danym salonie w poszczególnych latach. Wynik będzie zawierał sumy sprzedaży dla każdego salonu samochodowego w poszczególnych latach, a także ogólną sumę dla wszystkich salonów i lat.
    --Task competed in 0,081; 0,083; 0,079 seconds
    --701 rows