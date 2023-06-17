--Zapytanie 1: Zapytanie wyświetlające ranking klientów według sumy cen zakupów, uwzględniające dane z tabel Sprzedaz, Klient i Pracownicy.

  SELECT RANK() OVER (ORDER BY SUM(s.Kwota) DESC) AS Ranking, k.ID_Klient, k.Imie, k.Nazwisko, SUM(s.Kwota) AS SumaCenZakupow
  FROM Sprzedaz s
  JOIN Klient k ON s.ID_Klient = k.ID_Klient
  JOIN Pracownicy p ON s.ID_Pracownik = p.ID_Pracownik
  GROUP BY k.ID_Klient, k.Imie, k.Nazwisko
  ORDER BY Ranking;

    --Task competed in 0,154; 0,147; 0,143 seconds
    --1000 rows

--Zapytanie 2: Zapytanie wyświetlające ranking pracowników według liczby sprzedaży, uwzględniające dane z tabel Sprzedaz, Pracownicy i Salon_Samochodowy.

  SELECT RANK() OVER (ORDER BY COUNT(s.ID_Sprzedaz) DESC) AS Ranking, p.ID_Pracownik, p.Imie, p.Nazwisko, COUNT(s.ID_Sprzedaz) AS LiczbaSprzedazy
  FROM Sprzedaz s
  JOIN Pracownicy p ON s.ID_Pracownik = p.ID_Pracownik
  JOIN Salon_Samochodowy ss ON p.ID_Salon = ss.ID_Salonu
  GROUP BY p.ID_Pracownik, p.Imie, p.Nazwisko
  ORDER BY Ranking;

    --Task competed in 0,037; 0,048; 0,042 seconds
    --200 rows

--Zapytanie 3: Zapytanie wyświetlające ranking najczęściej kupowanych części, uwzględniające dane z tabel Sprzedaz, Czesci i Salon_Samochodowy.

  SELECT RANK() OVER (ORDER BY COUNT(s.ID_Czesc) DESC) AS Ranking, c.ID_Czesc, c.Nazwa, COUNT(s.ID_Czesc) AS LiczbaZakupow
  FROM Sprzedaz s
  JOIN Czesci c ON s.ID_Czesc = c.ID_Czesc
  JOIN Salon_Samochodowy ss ON s.ID_Salon = ss.ID_Salonu
  GROUP BY c.ID_Czesc, c.Nazwa
  ORDER BY Ranking;

    --Task competed in 0,075; 0,062; 0,067 seconds
    --500 rows