--Zapytanie 1: Ranking klientów na podstawie sumy ich sprzedaży.

  SELECT
      RANK() OVER (ORDER BY SUM(s.Kwota) DESC) AS Ranking,
      k.Imie,
      k.Nazwisko,
      SUM(s.Kwota) AS Suma_Kwot
  FROM
      Sprzedaz s
      JOIN Klient k ON s.ID_Klient = k.ID_Klient
      JOIN Samochod sa ON s.ID_Samochod = sa.ID_Samochodu
  GROUP BY
      k.Imie, k.Nazwisko
  ORDER BY
      Ranking;

    --Task competed in 0,247; 0,268; 0,263 seconds
    --1000 rows

--Zapytanie 2: Wyliczenie rankingów dla danych z trzech tabel: "Sprzedaz", "Klient" i "Samochod" na podstawie sumy kwot transakcji:

  SELECT
      Miesiac,
      ID_Klient,
      ID_Samochodu,
      Suma_Kwot,
      RANK() OVER (PARTITION BY Miesiac ORDER BY Suma_Kwot DESC) AS Ranking
  FROM (
      SELECT
          TO_CHAR(s.Data, 'YYYY-MM') AS Miesiac,
          s.ID_Klient,
          s.ID_Samochod,
          SUM(s.Kwota) AS Suma_Kwot
      FROM
          Sprzedaz s
          JOIN Klient k ON s.ID_Klient = k.ID_Klient
          JOIN Samochod sa ON s.ID_Samochod = sa.ID_Samochodu
      GROUP BY
          TO_CHAR(s.Data, 'YYYY-MM'),
          s.ID_Klient,
          s.ID_Samochod
  );

    --Task competed in 3,03; 2,313; 2,115 seconds
    --3523 rows

--Zapytanie 3: W tym zapytaniu funkcja RANK() przydziela ranking transakcjom na podstawie wartości kwoty (Kwota), sortując je malejąco dla każdego klienta (ID_Klient).

    SELECT *
    FROM (
        SELECT
            s.ID_Sprzedaz,
            s.ID_Samochod,
            s.ID_Klient,
            s.Data,
            s.Kwota,
            RANK() OVER (PARTITION BY s.ID_Klient ORDER BY s.Kwota DESC) AS Ranking
        FROM
            Sprzedaz s
            JOIN Klient k ON s.ID_Klient = k.ID_Klient
            JOIN Samochod sa ON s.ID_Samochod = sa.ID_Samochodu
    ) ranked_sales
    WHERE Ranking <= 3;

    --Task competed in 1,834; 2,138; 2,133 seconds
    --2507 rows