--Zapytanie 1: Zapytanie obliczające średnią cenę akcesoriów dla każdego modelu samochodu w okresie ostatnich 60 dni.

    SELECT M.Nazwa AS Model, AVG(A.Cena) AS Srednia_cena_akcesoriow
    FROM Sprzedaz S
    JOIN Samochod SA ON S.ID_Samochod = SA.ID_Samochodu
    JOIN Model M ON SA.ID_Model = M.ID_Model
    JOIN Akcesoria_Samochod ASAM ON SA.ID_Samochodu = ASAM.ID_Samochod
    JOIN Akcesoria A ON ASAM.ID_Akcesoria = A.ID_Akcesorium
    WHERE S.Data >= TRUNC(SYSDATE) - 60
    GROUP BY M.Nazwa;

    --To zapytanie oblicza średnią cenę akcesoriów dla różnych modeli samochodów. Działa na podstawie danych sprzedażowych z ostatnich 60 dni. Zapytanie łączy kilka tabel, aby uzyskać wymagane informacje. Wyniki są grupowane według nazwy modelu samochodu.
    --Task competed in 0,061 seconds
    --100 rows

--Zapytanie 2: Zapytanie sumujące wartość sprzedaży samochodów dla każdego klienta z ostatniego roku.

    SELECT K.ID_Klient, K.Imie, K.Nazwisko, SUM(S.Kwota) AS Suma_sprzedazy_samochodow
    FROM Sprzedaz S
    JOIN Klient K ON S.ID_Klient = K.ID_Klient
    JOIN Samochod SA ON S.ID_Samochod = SA.ID_Samochodu
    WHERE S.Data >= TRUNC(SYSDATE) - 360 AND s.id_samochod IS NOT NULL
    GROUP BY K.ID_Klient, K.Imie, K.Nazwisko;

    --To zapytanie wylicza sumę sprzedaży samochodów dla każdego klienta, uwzględniając warunek, że sprzedaż odbyła się w ciągu ostatnich 360 dni i samochód został sprzedany (ID samochodu nie jest puste). Wyniki grupowane są według ID klienta, Imienia i Nazwiska, a suma sprzedaży samochodów przypisana jest do kolumny "Suma_sprzedazy_samochodow".
    --Task competed in 0,108 seconds
    --882 rows

--Zapytanie 3: Zapytanie obliczające średnią cenę naprawy dla każdego typu naprawy w okresie ostatniego roku.

    SELECT N.Typ_naprawy, AVG(N.Cena) AS Srednia_cena_naprawy
    FROM Naprawa N
    JOIN Samochod S ON N.ID_Samochod = S.ID_Samochodu
    JOIN Pracownicy P ON N.ID_Pracownika = P.ID_Pracownik
    WHERE N.Data_przyjecia >= TRUNC(SYSDATE, 'YEAR') - INTERVAL '1' YEAR
    GROUP BY N.Typ_naprawy;

    --To zapytanie oblicza średnią cenę napraw dla różnych typów napraw w ostatnim roku dla każdego typu naprawy. Wykorzystuje operację GROUP BY, aby grupować wyniki według kolumny Typ_naprawy i następnie obliczyć średnią cenę dla każdej grupy. W rezultacie otrzymujemy wyniki, które zawierają kolumny Typ_naprawy i Srednia_cena_naprawy, które przedstawiają typ naprawy oraz odpowiadającą mu średnią cenę naprawy dla tego typu naprawy w ciągu ostatniego roku.
    --Task competed in 0,036 seconds
    --20 rows