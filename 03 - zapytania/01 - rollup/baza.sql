--Zapytanie 1: Suma cen akcesoriów sprzedanych przez pracowników w poszczególnych salonach samochodowych.

    SELECT Salon_Samochodowy.Nazwa, Pracownicy.Imie, Pracownicy.Nazwisko, SUM(Akcesoria.Cena) AS SumaCenAkcesoriow
    FROM Salon_Samochodowy
    JOIN Pracownicy ON Salon_Samochodowy.ID_Salonu = Pracownicy.ID_Salon
    JOIN Sprzedaz ON Pracownicy.ID_Pracownik = Sprzedaz.ID_Pracownik
    JOIN Akcesoria ON Sprzedaz.ID_Akcesorium = Akcesoria.ID_Akcesorium
    GROUP BY ROLLUP (Salon_Samochodowy.Nazwa, Pracownicy.Imie, Pracownicy.Nazwisko);

    --Task competed in 0,064; 0,071; 0,068 seconds
    --487 rows

--Zapytanie 2: Średnia ceny części zamówionych przez klientów w różnych miastach.

    SELECT Miasto_slownik.Nazwa_miasta, Klient.Imie, Klient.Nazwisko, AVG(Czesci.Cena) AS SredniaCenaCzesci
    FROM Miasto_slownik
    JOIN Ulica_slownik ON Miasto_slownik.ID_Miasto = Ulica_slownik.ID_Miasto
    JOIN Adres ON Ulica_slownik.ID_Ulica = Adres.ID_Ulica
    JOIN Klient ON Adres.ID_Adres = Klient.ID_Adres
    JOIN Sprzedaz ON Klient.ID_Klient = Sprzedaz.ID_Klient
    JOIN Czesci ON Sprzedaz.ID_Czesc = Czesci.ID_Czesc
    GROUP BY ROLLUP (Miasto_slownik.Nazwa_miasta, Klient.Imie, Klient.Nazwisko);

    --Task competed in 0,272; 0,251; 0,254 seconds
    --2087 rows

--Zapytanie 3: Suma cen zamówionych części przez klientów w poszczególnych miastach i salonach samochodowych.

    SELECT Miasto_slownik.Nazwa_miasta, Salon_Samochodowy.Nazwa, Klient.Imie, Klient.Nazwisko, SUM(Czesci.Cena) AS SumaCenCzesci
    FROM Miasto_slownik
    JOIN Ulica_slownik ON Miasto_slownik.ID_Miasto = Ulica_slownik.ID_Miasto
    JOIN Adres ON Ulica_slownik.ID_Ulica = Adres.ID_Ulica
    JOIN Klient ON Adres.ID_Adres = Klient.ID_Adres
    JOIN Sprzedaz ON Klient.ID_Klient = Sprzedaz.ID_Klient
    JOIN Czesci ON Sprzedaz.ID_Czesc = Czesci.ID_Czesc
    JOIN Salon_Samochodowy ON Sprzedaz.ID_Salon = Salon_Samochodowy.ID_Salonu
    GROUP BY ROLLUP (Miasto_slownik.Nazwa_miasta, Salon_Samochodowy.Nazwa, Klient.Imie, Klient.Nazwisko);


    --Task competed in 3,133; 2,99; 3,048 seconds
    --13665 rows