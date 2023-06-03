--Zapytanie 1: Zapytanie obliczające średnią cenę akcesoriów dla każdego modelu samochodu w okresie ostatnich 60 dni.

    SELECT Wymiar_Model.ID_Model, Wymiar_Model.Nazwa AS ModelSamochodu, AVG(Wymiar_Akcesoria.Cena) AS SredniaCenaAkcesoriow
    FROM Wymiar_Model
    JOIN Wymiar_Samochod ON Wymiar_Model.ID_Model = Wymiar_Samochod.ID_Model
    JOIN Wymiar_Akcesoria_Samochod ON Wymiar_Samochod.ID_Samochod = Wymiar_Akcesoria_Samochod.ID_Samochod
    JOIN Wymiar_Akcesoria ON Wymiar_Akcesoria_Samochod.ID_Akcesorium = Wymiar_Akcesoria.ID_Akcesorium
    JOIN Fakt_Sprzedaz ON Wymiar_Samochod.ID_Samochod = Fakt_Sprzedaz.ID_Samochod
    WHERE Fakt_Sprzedaz.Data >= SYSDATE - 60
    GROUP BY Wymiar_Model.ID_Model, Wymiar_Model.Nazwa;


    --To zapytanie oblicza średnią cenę akcesoriów dla różnych modeli samochodów. Działa na podstawie danych sprzedażowych z ostatnich 60 dni. Zapytanie łączy kilka tabel, aby uzyskać wymagane informacje. Wyniki są grupowane według nazwy modelu samochodu.
    --Task competed in 0,064; 0,063; 0,066 seconds
    --100 rows

--Zapytanie 2: Zapytanie sumujące wartość sprzedaży samochodów dla każdego klienta z ostatniego roku.

    SELECT Wymiar_Klient.ID_Klient, Wymiar_Klient.Imie, Wymiar_Klient.Nazwisko, SUM(Fakt_Sprzedaz.Kwota) as Suma_sprzedazy_samochodow
    FROM Fakt_Sprzedaz
    JOIN Wymiar_Klient ON Fakt_Sprzedaz.ID_Klient = Wymiar_Klient.ID_Klient
    WHERE Fakt_Sprzedaz.Data >= TRUNC(SYSDATE) - 360
    AND Fakt_Sprzedaz.ID_Samochod IS NOT NULL
    GROUP BY Wymiar_Klient.ID_Klient, Wymiar_Klient.Imie, Wymiar_Klient.Nazwisko;

    --To zapytanie wylicza sumę sprzedaży samochodów dla każdego klienta, uwzględniając warunek, że sprzedaż odbyła się w ciągu ostatnich 360 dni i samochód został sprzedany (ID samochodu nie jest puste). Wyniki grupowane są według ID klienta, Imienia i Nazwiska, a suma sprzedaży samochodów przypisana jest do kolumny "Suma_sprzedazy_samochodow".
    --Task competed in 0,13; 0,129; 0,126 seconds
    --851 rows

--Zapytanie 3: Zapytanie obliczające średnią cenę naprawy dla każdego typu naprawy w okresie ostatniego roku.

    SELECT Typ_naprawy, AVG(Cena) AS SredniaCenaNaprawy
    FROM Wymiar_Naprawa
    WHERE Data_przyjecia >= TRUNC(SYSDATE) - INTERVAL '1' YEAR
    GROUP BY Typ_naprawy;

    --To zapytanie oblicza średnią cenę napraw dla różnych typów napraw w ostatnim roku dla każdego typu naprawy. Wykorzystuje operację GROUP BY, aby grupować wyniki według kolumny Typ_naprawy i następnie obliczyć średnią cenę dla każdej grupy. W rezultacie otrzymujemy wyniki, które zawierają kolumny Typ_naprawy i Srednia_cena_naprawy, które przedstawiają typ naprawy oraz odpowiadającą mu średnią cenę naprawy dla tego typu naprawy w ciągu ostatniego roku.
    --Task competed in 0,058; 0,066; 0,067 seconds
    --20 rows