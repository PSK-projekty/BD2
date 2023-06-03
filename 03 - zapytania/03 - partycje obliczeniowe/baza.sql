--Zapytanie 1: Całkowita sprzedaż dla każdego pracownika z podziałem na modele samochodów

    SELECT P.Imie, P.Nazwisko, M.Nazwa as Model, SUM(S.Kwota) OVER (PARTITION BY S.ID_Pracownik, S.ID_Samochod) as Suma_Sprzedazy
    FROM Sprzedaz S
    JOIN Pracownicy P ON S.ID_Pracownik = P.ID_Pracownik
    JOIN Samochod A ON S.ID_Samochod = A.ID_Samochodu
    JOIN Model M ON A.ID_Model = M.ID_Model;

    --To zapytanie wylicza sumę sprzedaży dla każdego pracownika oraz modelu samochodu, przy użyciu funkcji okna SUM i klauzuli OVER. Dodatkowo, zwraca informacje dotyczące pracownika, w tym imię i nazwisko, oraz nazwę modelu samochodu.
    --Task competed in 1,385; 1,128; 1,157 seconds
    --7014 rows

--Zapytanie 2: Zapytanie pokazujące sprzedaż (sumę) dla każdego klienta z podziałem na typy akcesoriów.

    SELECT K.Imie, K.Nazwisko, A.Nazwa as Akcesorium, SUM(S.Kwota) OVER (PARTITION BY S.ID_Klient, S.ID_Akcesorium) as Suma_Sprzedazy
    FROM Sprzedaz S
    JOIN Klient K ON S.ID_Klient = K.ID_Klient
    JOIN Akcesoria A ON S.ID_Akcesorium = A.ID_Akcesorium;
    
    --To zapytanie pobiera dane dotyczące sprzedaży akcesoriów dla klientów. Wykorzystuje operację okna (window function), aby obliczyć sumę sprzedaży dla każdego klienta i akcesorium. Dodatkowo, łączy informacje o kliencie, akcesoriach i sprzedaży, korzystając z tabel Klient, Akcesoria i Sprzedaz.
    --Task competed in 1,305; 1,346; 1,27 seconds
    --7028 rows

--Zapytanie 3: Suma sprzedaży samochodów przez pracowników z podziałem na stanowiska.

    SELECT P.ID_Stanowisko, S.ID_Pracownik, SUM(S.Kwota) OVER(PARTITION BY P.ID_Stanowisko) AS Suma_Sprzedazy
    FROM Sprzedaz S
    JOIN Pracownicy P ON S.ID_Pracownik = P.ID_Pracownik
    JOIN Stanowiska ST ON P.ID_Stanowisko = ST.ID_Stanowiska;

    --To zapytanie oblicza sumę sprzedaży dla każdego stanowiska w firmie, przy użyciu operacji okna. Wykorzystuje partycjonowanie po identyfikatorze stanowiska i następnie oblicza sumę sprzedaży dla każdej partycji. Wynikiem jest tabela zawierająca identyfikator stanowiska, identyfikator pracownika oraz sumę sprzedaży dla każdego stanowiska.
    --Task competed in 1,893; 1,597; 1,629 seconds
    --10000 rows