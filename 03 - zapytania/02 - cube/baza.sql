--Zapytanie 1: Suma wynagrodzeń pracowników na poszczególnych stanowiskach w różnych miastach.

    SELECT Miasto_slownik.Nazwa_miasta, Stanowiska.Nazwa, SUM(Pracownicy.Pensja) AS SumaWynagrodzen
    FROM Miasto_slownik
    JOIN Ulica_slownik ON Miasto_slownik.ID_Miasto = Ulica_slownik.ID_Miasto
    JOIN Adres ON Ulica_slownik.ID_Ulica = Adres.ID_Ulica
    JOIN Pracownicy ON Adres.ID_Adres = Pracownicy.ID_Adres
    JOIN Stanowiska ON Pracownicy.ID_Stanowisko = Stanowiska.ID_Stanowiska
    GROUP BY CUBE (Miasto_slownik.Nazwa_miasta, Stanowiska.Nazwa);

    --Task competed in 0,157; 0,151; 0,155 seconds
    --671 rows

--Zapytanie 2: Średnia liczba sprzedanych akcesoriów na poszczególnych stanowiskach, w różnych miastach i salonach samochodowych.

    SELECT Miasto_slownik.Nazwa_miasta, Salon_Samochodowy.Nazwa, TRUNC(Wynajem.Data_wynajmu), SUM(Wynajem.Cena) AS SumaCenWynajmu
    FROM Wynajem
    JOIN Klient ON Wynajem.ID_Klient = Klient.ID_Klient
    JOIN Adres ON Klient.ID_Adres = Adres.ID_Adres
    JOIN Ulica_slownik ON Adres.ID_Ulica = Ulica_slownik.ID_Ulica
    JOIN Miasto_slownik ON Ulica_slownik.ID_Miasto = Miasto_slownik.ID_Miasto
    JOIN Pracownicy ON Wynajem.ID_Pracownik = Pracownicy.ID_Pracownik
    JOIN Salon_Samochodowy ON Pracownicy.ID_Salon = Salon_Samochodowy.ID_Salonu
    GROUP BY CUBE (Miasto_slownik.Nazwa_miasta, Salon_Samochodowy.Nazwa, TRUNC(Wynajem.Data_wynajmu));

    --Task competed in 2,362; 2,211; 1,828 seconds
    --4812 rows

--Zapytanie 3: Suma kosztów zakupu części samochodowych dla poszczególnych klientów, salonów samochodowych i kategorii części.

    SELECT Klient.ID_Klient, Salon_Samochodowy.Nazwa, Czesci.Nazwa, SUM(Czesci.Cena) AS SumaKosztowZakupu
    FROM Sprzedaz
    JOIN Klient ON Sprzedaz.ID_Klient = Klient.ID_Klient
    JOIN Czesci ON Sprzedaz.ID_Czesc = Czesci.ID_Czesc
    JOIN Pracownicy ON Sprzedaz.ID_Pracownik = Pracownicy.ID_Pracownik
    JOIN Salon_Samochodowy ON Pracownicy.ID_Salon = Salon_Samochodowy.ID_Salonu
    GROUP BY CUBE (Klient.ID_Klient, Salon_Samochodowy.Nazwa, Czesci.Nazwa);

    --Task competed in 8,347; 8,732; 8,420 seconds
    --21365 rows