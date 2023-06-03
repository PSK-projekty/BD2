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
    --Task competed in 0,149; 0,16; 0,152 seconds
    --859 rows

--Zapytanie 2: Zapytanie do wyznaczenia najlepszych pracowników na podstawie sprzedaży samochodów.

    WITH sales_summary AS (
      SELECT
        p.ID_Pracownik, p.Imie, p.Nazwisko, s.Nazwa,
        SUM(sp.Kwota) AS suma_sprzedazy
      FROM Sprzedaz sp
      JOIN Pracownicy p ON sp.ID_Pracownik = p.ID_Pracownik
      JOIN Salon_Samochodowy s ON p.ID_Salon = s.ID_Salonu
      GROUP BY p.ID_Pracownik, p.Imie, p.Nazwisko, s.Nazwa
    ),
    ranked_employees AS (
      SELECT 
        ID_Pracownik, Imie, Nazwisko, Nazwa, suma_sprzedazy,
        RANK() OVER (PARTITION BY Nazwa ORDER BY suma_sprzedazy DESC) as rank
      FROM sales_summary
    )
    SELECT * FROM ranked_employees
    WHERE rank = 1;

    --To zapytanie identyfikuje pracowników, którzy osiągnęli najwyższą sumę sprzedaży w poszczególnych salonach samochodowych. Wykorzystuje operację okna RANK w celu przypisania rankingu pracownikom w ramach każdego salonu na podstawie sumy sprzedaży. Następnie zwraca rekordy pracowników, którzy zajmują pierwsze miejsce w rankingu dla każdego salonu samochodowego.
    --Task competed in 0,043; 0,039; 0,036 seconds
    --83 rows

--Zapytanie 3: Zapytanie do obliczenia sumy sprzedaży akcesoriów dla danego samochodu.

    WITH ranked_accessories AS (
      SELECT
        car.ID_Samochodu, car.VIN,
        SUM(sp.Kwota) AS suma_sprzedazy_akcesoriow,
        DENSE_RANK() OVER (ORDER BY SUM(sp.Kwota) DESC) as rank
      FROM Sprzedaz sp
      JOIN Akcesoria_Samochod as_ ON sp.ID_Akcesorium = as_.ID_Akcesoria
      JOIN Samochod car ON as_.ID_Samochod = car.ID_Samochodu
      GROUP BY car.ID_Samochodu, car.VIN
    )
    SELECT * FROM ranked_accessories
    WHERE rank <= 20;

    --To zapytanie analizuje sprzedaż akcesoriów samochodowych i identyfikuje 20 najlepiej sprzedających się akcesoriów. Wykorzystuje funkcję okna DENSE_RANK, aby przyporządkować ranking każdemu akcesorium na podstawie sumy sprzedaży. Dodatkowo, zapytanie wykorzystuje klauzulę WITH do utworzenia tymczasowej tabeli ranked_accessories, która zawiera informacje o identyfikatorze samochodu, numerze VIN, sumie sprzedaży akcesoriów oraz przypisanym rankingu.
    --Task competed in 0,061; 0,06; 0,053  seconds
    --20 rows