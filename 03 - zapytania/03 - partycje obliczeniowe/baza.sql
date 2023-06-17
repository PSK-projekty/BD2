--Zapytanie 1: Suma cen akcesoriów sprzedanych przez każdego pracownika w danym salonie samochodowym.

    SELECT Pracownicy.ID_Pracownik, Salon_Samochodowy.Nazwa, SUM(Akcesoria.Cena) AS SumaCenAkcesoriow
    FROM Sprzedaz
    JOIN Pracownicy ON Sprzedaz.ID_Pracownik = Pracownicy.ID_Pracownik
    JOIN Salon_Samochodowy ON Pracownicy.ID_Salon = Salon_Samochodowy.ID_Salonu
    JOIN Akcesoria ON Sprzedaz.ID_Akcesorium = Akcesoria.ID_Akcesorium
    GROUP BY Pracownicy.ID_Pracownik, Salon_Samochodowy.Nazwa;

    --Task competed in 0,061; 0,041; 0,04 seconds
    --200 rows

--Zapytanie 2: Zapytanie pokazujące sprzedaż (sumę) dla każdego klienta z podziałem na typy akcesoriów.

    SELECT K.Imie, K.Nazwisko, A.Nazwa as Akcesorium, SUM(S.Kwota) OVER (PARTITION BY S.ID_Klient, S.ID_Akcesorium) as Suma_Sprzedazy
    FROM Sprzedaz S
    JOIN Klient K ON S.ID_Klient = K.ID_Klient
    JOIN Akcesoria A ON S.ID_Akcesorium = A.ID_Akcesorium;
    
    --Task competed in 2,971; 3,643; 3,215 seconds
    --6974 rows

--Zapytanie 3: Suma sprzedaży samochodów przez pracowników z podziałem na stanowiska.

    SELECT P.ID_Stanowisko, S.ID_Pracownik, SUM(S.Kwota) OVER(PARTITION BY P.ID_Stanowisko) AS Suma_Sprzedazy
    FROM Sprzedaz S
    JOIN Pracownicy P ON S.ID_Pracownik = P.ID_Pracownik
    JOIN Stanowiska ST ON P.ID_Stanowisko = ST.ID_Stanowiska;

    --Task competed in 3,221; 2,997; 2,999 seconds
    --10000 rows