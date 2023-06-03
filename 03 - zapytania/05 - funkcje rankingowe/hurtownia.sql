--Zapytanie 1: Zapytanie do wyznaczenia 10 najpopularniejszych samochodów sprzedawanych w danym salonie.

    WITH ranked_sales AS (
      SELECT
        s.ID_Salonu, s.Nazwa, car.ID_Model,
        COUNT(*) AS liczba_sprzedanych,
        ROW_NUMBER() OVER (PARTITION BY s.ID_Salonu ORDER BY COUNT(*) DESC) as rank
      FROM Sprzedaz sp
      JOIN Samochod car ON sp.ID_Samochod = car.ID_Samochodu
      JOIN Salon_Samochodowy s ON car.ID_Salonu = s.ID_Salonu
      GROUP BY s.ID_Salonu, s.Nazwa, car.ID_Model
    )
    SELECT * FROM ranked_sales
    WHERE rank <= 10;

    --To zapytanie generuje ranking sprzedaży dla salonów samochodowych, przydzielając numer porządkowy na podstawie liczby sprzedanych samochodów. Następnie wybiera tylko te rekordy, które mają ranking mniejszy lub równy 10.
    --Task competed in 0,118; 0,126; 0,119 seconds
    --859 rows

--Zapytanie 2: Zapytanie do wyznaczenia najlepszych pracowników na podstawie sprzedaży samochodów.

    WITH sales_summary AS (
      SELECT P.ID_Pracownik, P.Imie, P.Nazwisko, S.Nazwa, SUM(F.Kwota) AS suma_sprzedazy
      FROM Fakt_Sprzedaz F
      JOIN Wymiar_Pracownik P ON F.ID_Pracownik = P.ID_Pracownik
      JOIN Wymiar_Salon S ON P.ID_Salon = S.ID_Salonu
      GROUP BY P.ID_Pracownik, P.Imie, P.Nazwisko, S.Nazwa
    ),
    ranked_employees AS (
      SELECT  ID_Pracownik, Imie, Nazwisko, Nazwa, suma_sprzedazy,
      RANK() OVER (PARTITION BY Nazwa ORDER BY suma_sprzedazy DESC) as rank
      FROM sales_summary
    )
    SELECT * FROM ranked_employees
    WHERE rank = 1;

    --To zapytanie identyfikuje pracowników, którzy osiągnęli najwyższą sumę sprzedaży w poszczególnych salonach samochodowych. Wykorzystuje operację okna RANK w celu przypisania rankingu pracownikom w ramach każdego salonu na podstawie sumy sprzedaży. Następnie zwraca rekordy pracowników, którzy zajmują pierwsze miejsce w rankingu dla każdego salonu samochodowego.
    --Task competed in 0,035; 0,041; 0,033 seconds
    --83 rows

--Zapytanie 3: Zapytanie do obliczenia sumy sprzedaży akcesoriów dla danego samochodu.

    WITH ranked_accessories AS (
      SELECT
        car.ID_Samochod, car.VIN,
        SUM(sp.Kwota) AS suma_sprzedazy_akcesoriow,
        DENSE_RANK() OVER (ORDER BY SUM(sp.Kwota) DESC) as rank
      FROM Fakt_sprzedaz sp
      JOIN Wymiar_Akcesoria_Samochod as_ ON sp.ID_Akcesorium = as_.ID_Akcesorium
      JOIN Wymiar_Samochod car ON as_.ID_Samochod = car.ID_Samochod
      GROUP BY car.ID_Samochod, car.VIN
    )
    SELECT * FROM ranked_accessories
    WHERE rank <= 20;


    --To zapytanie analizuje sprzedaż akcesoriów samochodowych i identyfikuje 20 najlepiej sprzedających się akcesoriów. Wykorzystuje funkcję okna DENSE_RANK, aby przyporządkować ranking każdemu akcesorium na podstawie sumy sprzedaży. Dodatkowo, zapytanie wykorzystuje klauzulę WITH do utworzenia tymczasowej tabeli ranked_accessories, która zawiera informacje o identyfikatorze samochodu, numerze VIN, sumie sprzedaży akcesoriów oraz przypisanym rankingu.
    --Task competed in 0,048; 0,05; 0,049 seconds
    --20 rows