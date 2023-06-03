--Zapytanie 1: Całkowita sprzedaż dla każdego pracownika z podziałem na modele samochodów

    SELECT wp.Imie, wp.Nazwisko, wm.Nazwa AS Model, SUM(fs.Kwota) OVER (PARTITION BY fs.ID_Pracownik, fs.ID_Samochod) AS Suma_Sprzedazy
    FROM Fakt_Sprzedaz fs
    JOIN Wymiar_Pracownik wp ON fs.ID_Pracownik = wp.ID_Pracownik
    JOIN Wymiar_Samochod ws ON fs.ID_Samochod = ws.ID_Samochod
    JOIN Wymiar_Model wm ON ws.ID_Model = wm.ID_Model;

    --To zapytanie wylicza sumę sprzedaży dla każdego pracownika oraz modelu samochodu, przy użyciu funkcji okna SUM i klauzuli OVER. Dodatkowo, zwraca informacje dotyczące pracownika, w tym imię i nazwisko, oraz nazwę modelu samochodu.
    --Task competed in 0,741; 0,999; 1,197 seconds
    --7014 rows

--Zapytanie 2: Zapytanie pokazujące sprzedaż (sumę) dla każdego klienta z podziałem na typy akcesoriów.

    SELECT wk.Imie, wk.Nazwisko, wa.Nazwa AS Akcesorium, SUM(fs.Kwota) OVER (PARTITION BY fs.ID_Klient, fs.ID_Akcesorium) AS Suma_Sprzedazy
    FROM Fakt_Sprzedaz fs
    JOIN Wymiar_Klient wk ON fs.ID_Klient = wk.ID_Klient
    JOIN Wymiar_Akcesoria wa ON fs.ID_Akcesorium = wa.ID_Akcesorium;
    
    --To zapytanie pobiera dane dotyczące sprzedaży akcesoriów dla klientów. Wykorzystuje operację okna (window function), aby obliczyć sumę sprzedaży dla każdego klienta i akcesorium. Dodatkowo, łączy informacje o kliencie, akcesoriach i sprzedaży, korzystając z tabel Klient, Akcesoria i Sprzedaz.
    --Task competed in 1,128; 1,164; 1,119 seconds
    --7028 rows

--Zapytanie 3: Suma sprzedaży samochodów przez pracowników z podziałem na stanowiska.

    SELECT wp.ID_Stanowisko, wp.ID_Pracownik, SUM(fs.Kwota) OVER (PARTITION BY wp.ID_Stanowisko) AS Suma_Sprzedazy
    FROM Fakt_Sprzedaz fs
    JOIN Wymiar_Pracownik wp ON fs.ID_Pracownik = wp.ID_Pracownik
    JOIN Wymiar_Stanowisko ws ON wp.ID_Stanowisko = ws.ID_Stanowiska;

    --To zapytanie oblicza sumę sprzedaży dla każdego stanowiska w firmie, przy użyciu operacji okna. Wykorzystuje partycjonowanie po identyfikatorze stanowiska i następnie oblicza sumę sprzedaży dla każdej partycji. Wynikiem jest tabela zawierająca identyfikator stanowiska, identyfikator pracownika oraz sumę sprzedaży dla każdego stanowiska.
    --Task competed in 1,531; 1,44; 1,491 seconds
    --10000 rows