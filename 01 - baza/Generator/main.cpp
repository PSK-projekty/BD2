#define _CRT_SECURE_NO_WARNINGS

#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>

int i;
const char* naped[] = { "Przedni", "Tylni", "4x4/AWD" };
const char* nadwozie[] = { "SUV", "coupe", "dual cowl", "fastback", "hatchback", "cabriolet", "estate", "liftback", "limousine", "microvan", "minivan", "pickup", "roadster", "sedan", "shooting brake", "targa", "van" };
const char* segment[] = { "A", "B", "C", "D", "E", "F", "S", "H", "J", "M" }; //https://mubi.pl/poradniki/klasy-samochodow/
const char* lDrzwi[] = { "2/3", "4/5" };
const char* typ_silnika[] = { "spalinowy", "elektryczny", "hybrydowy" };
const char* paliwo[] = { "diesel", "benzyna", "LPG", "benzyna+lpg" };
const char* rodzajDokumentu[] = { "Faktura", "Paragon", "Rachunek" };
const char* formaPlatnosci[] = { "Gotówka", "Karta", "Przelew" };


int random (int min_num, int max_num) {
	int result = 0, low_num = 0, hi_num = 0;
	if( min_num < max_num ) {
		low_num = min_num;
		hi_num = max_num + 1;
	}
	else {
		low_num = max_num + 1;
		hi_num = min_num;
	}
	result = ( rand () % ( hi_num - low_num ) ) + low_num;
	return result;
}

float randomFloat (float min_num, float max_num) {
	float result = 0.0;
	float low_num = min_num;
	float hi_num = max_num;
	result = ( (float) rand () / RAND_MAX ) * ( hi_num - low_num ) + low_num;
	return result;
}

void generateVIN (char* vin) {
	const char* characters = "0123456789ABCDEFGHJKLMNPRSTUVWXYZ";
	int num_characters = strlen (characters);
	for( int i = 0; i < 17; i++ ) {
		vin[i] = characters[random (0, num_characters - 1)];
	}
	vin[17] = '\0';
}

int kWtoKM (int kW) {
	return (int) ( kW * 1.341 );
}

void generateNumer (char* numer) {
	const char* characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
	int length = strlen (characters);
	for( int i = 0; i < 15; i++ ) {
		numer[i] = characters[random (0, length - 1)];
	}
	numer[15] = '\0';
}

struct tm randomDate (int minYear, int minMonth, int minDay, int maxYear, int maxMonth, int maxDay) {
	struct tm date;
	date.tm_year = random (minYear, maxYear) - 1900;
	date.tm_mon = random (minMonth, maxMonth) - 1;
	date.tm_mday = random (minDay, maxDay);
	date.tm_hour = 0;
	date.tm_min = 0;
	date.tm_sec = 0;
	mktime (&date);
	return date;
}


void adres () {
	FILE* plik = fopen ("../Dane/adres.csv", "w");

	if( plik == NULL ) {
		printf ("Failed to open file adres.csv\n");
		return;
	}

	for( int i = 1; i <= 1000; i++ ) {
		int ID_Adres = i;
		int ID_Ulica = i;
		char NumerDomu[4];
		sprintf (NumerDomu, "%d", random (1, 100));
		char NumerMieszkania[4] = "";
		if( random (1, 10) > 7 )
			sprintf (NumerMieszkania, "%d", random (1, 30));
		
		fprintf (plik, "%d,%d,%s,%s\n", ID_Adres, ID_Ulica, NumerDomu, NumerMieszkania);
	}

	fclose (plik);
}

void ulica_slownik () {
	FILE* plik = fopen ("../Dane/ulica_slownik.csv", "w");

	if( plik == NULL ) {
		printf ("Failed to open file ulica_slownik.csv\n");
		return;
	}

	for( int i = 1; i <= 300; i++ ) {
		int ID_Ulica = i;
		int ID_Miasto = random (1, 100);
		char Nazwa_ulicy[100];
		sprintf (Nazwa_ulicy, "Ulica %d", i);

		fprintf (plik, "%d,%d,%s\n", ID_Ulica, ID_Miasto, Nazwa_ulicy);
	}

	fclose (plik);
}

void miasto_slownik () {
	FILE* plik = fopen ("../Dane/miasto_slownik.csv", "w");

	if( plik == NULL ) {
		printf ("Failed to open file ulica_slownik.csv\n");
		return;
	}

	for( int i = 1; i <= 100; i++ ) {
		int ID_Ulica = i;
		char Nazwa_miasta[100];
		sprintf (Nazwa_miasta, "Miasto %d", i);

		fprintf (plik, "%d,%s\n", ID_Ulica, Nazwa_miasta);
	}

	fclose (plik);
}

void akcesoria () {
	FILE* plik = fopen ("../Dane/akcesoria.csv", "w");

	if( plik == NULL ) {
		printf ("Failed to open file akcesoria.csv\n");
		return;
	}

	for(i = 1; i <= 300; i++ ) {
		int ID_Akcesorium = i;
		char Nazwa[100];
		sprintf (Nazwa, "Akcesorium %d", i);
		float Cena = randomFloat (50.00, 1500.00);

		fprintf (plik, "%d,%s,%.2f\n", ID_Akcesorium, Nazwa, Cena);
	}

	fclose (plik);
}

void model () {
	FILE* plik = fopen ("../Dane/model.csv", "w");

	if( plik == NULL ) {
		printf ("Failed to open file model.csv\n");
		return;
	}

	for( i = 1; i <= 100; i++ ) {
		int ID_Model = i;
		char Nazwa[100];
		sprintf (Nazwa, "Model %d", i);
		int Generacja = random (1, 13);
		const char* Typ_nadwozia = nadwozie[random (0, sizeof (nadwozie) / sizeof (nadwozie[0]) - 1)];
		const char* Segment = segment[random (0, sizeof (segment) / sizeof (segment[0]) - 1)];
		const char* Liczba_drzwi = lDrzwi[random (0, sizeof (lDrzwi) / sizeof (lDrzwi[0]) - 1)];
		float SrednieSpalanie = randomFloat (5.0, 15.5);
		int Waga = random (1000, 3300);

		fprintf (plik, "%d,%s,%d,%s,%s,%s,%.2f,%d\n", ID_Model, Nazwa, Generacja, Typ_nadwozia, Segment, Liczba_drzwi, SrednieSpalanie, Waga);

	}

	fclose (plik);
}

void silniki () {
	FILE* plik = fopen ("../Dane/silniki.csv", "w");

	for( i = 1; i <= 100; i++ ) {
		int ID_Silnik = i;
		int Pojemnosc;
		if( i <= 10 || i % 20 == 0 )
			Pojemnosc = 0;
		else
			Pojemnosc = random (900, 4530);

		int Moc_kW = random (50, 300);
		int Moc_KM = kWtoKM (Moc_kW);
		int MomentObrotowy = random (150, 800);
		const char* TypSilnika = typ_silnika[random (0, sizeof (typ_silnika) / sizeof (typ_silnika[0]) - 1)];
		const char* Paliwo;

		if( strcmp (TypSilnika, "elektryczny") == 0 ) {
			Paliwo = "";
			Pojemnosc = 0;
		}
		else
			Paliwo = paliwo[random (0, sizeof (paliwo) / sizeof (paliwo[0]) - 1)];

		char Numer[16];
		generateNumer (Numer);

		fprintf (plik, "%d,%d,%d,%d,%d,%s,%s,%s\n", ID_Silnik, Pojemnosc, Moc_kW, Moc_KM, MomentObrotowy, TypSilnika, Paliwo, Numer);
	}

	fclose (plik);
}

void stanowiska () {
	FILE* plik = fopen ("../Dane/stanowiska.csv", "w");

	if( plik == NULL ) {
		printf ("Failed to open file stanowiska.csv\n");
		return;
	}

	for( i = 1; i <= 100; i++ ) {
		int ID_Stanowiska = i;
		char Nazwa[100];
		sprintf (Nazwa, "Stanowisko %d", i);
		int PremiaZaStanowisko = random (5, 50);

		fprintf (plik, "%d,%s,%d\n", ID_Stanowiska, Nazwa, PremiaZaStanowisko);
	}

	fclose (plik);
}

void czesci () {
	FILE* plik = fopen ("../Dane/czesci.csv", "w");

	if( plik == NULL ) {
		printf ("Failed to open file czesci.csv\n");
		return;
	}

	for( i = 1; i <= 500; i++ ) {
		int ID_Czesc = i;
		char Nazwa[101];
		snprintf (Nazwa, sizeof (Nazwa), "Czesc %d", i);
		char Numer[16];
		generateNumer (Numer);
		float Cena = randomFloat (100.0, 3000.0);

		fprintf (plik, "%d,%s,%s,%.2f\n", ID_Czesc, Nazwa, Numer, Cena);
	}

	fclose (plik);
}

void dodatkowe_wyposazenie () {
	FILE* plik = fopen ("../Dane/dodatkowe_wyposazenie.csv", "w");

	if( plik == NULL ) {
		printf ("Failed to open file dodatkowe_wyposazenie.csv\n");
		return;
	}

	for( i = 1; i <= 500; i++ ) {
		int ID_Wyposazenie = i;
		char Nazwa[101];
		snprintf (Nazwa, sizeof (Nazwa), "Wyposazenie %d", i);
		float Cena = randomFloat (50.0, 1500.0);

		fprintf (plik, "%d,%s,%.2f\n", ID_Wyposazenie, Nazwa, Cena);
	}

	fclose (plik);
}

void wersja_wyposazenia () {
	FILE* plik = fopen ("../Dane/wersja_wyposazenia.csv", "w");

	if( plik == NULL ) {
		printf ("Failed to open file wersja_wyposazenia.csv\n");
		return;
	}

	for( i = 1; i <= 100; i++ ) {
		int ID_Wersja = i;
		char Nazwa[100];
		sprintf (Nazwa, "Wersja wyposazenia %d", i);
		int PoziomWyposazenia = random (1, 6);
		float Cena = randomFloat (5000.0, 40000.0);

		fprintf (plik, "%d,%s,%d,%.2f\n", ID_Wersja, Nazwa, PoziomWyposazenia, Cena);
	}

	fclose (plik);
}

void salon_samochodowy () {
	FILE* plik = fopen ("../Dane/salon_samochodowy.csv", "w");

	if( plik == NULL ) {
		printf ("Failed to open file salon_samochodowy.csv\n");
		return;
	}

	for( i = 1; i <= 100; i++ ) {
		int ID_Salonu = i;
		int ID_Adres = random (1, 100);
		char Nazwa[20];
		sprintf (Nazwa, "Salon %d", i);

		fprintf (plik, "%d,%d,%s\n", ID_Salonu, ID_Adres, Nazwa);
	}

	fclose (plik);

}

void klient () {
	FILE* plik = fopen ("../Dane/klient.csv", "w");

	if( plik == NULL ) {
		printf ("Failed to open file klient.csv\n");
		return;
	}

	for( i = 1; i <= 1000; i++ ) {
		int ID_Klient = i;
		int ID_Adres = random (1, 200);
		char Imie[100];
		sprintf (Imie, "Imie %d", i);
		char Nazwisko[100];
		sprintf (Nazwisko, "Nazwisko %d", i);
		char Email[100];
		sprintf (Email, "email%d@example.com", i);
		int Telefon = random (100000000, 999999999);

		fprintf (plik, "%d,%d,%s,%s,%s,%d\n", ID_Klient, ID_Adres, Imie, Nazwisko, Email, Telefon);
	}

	fclose (plik);
}

void pracownicy () {
	FILE* plik = fopen ("../Dane/pracownicy.csv", "w");

	if( plik == NULL ) {
		printf ("Failed to open file pracownicy.csv\n");
		return;
	}

	for( i = 1; i <= 500; i++ ) {
		int ID_Pracownik = i;
		int ID_Salon = random (1, 100);
		int ID_Adres = random (1, 200);
		int ID_Stanowisko = random (1, 100);
		char Imie[100];
		sprintf (Imie, "Imie %d", i);
		char Nazwisko[100];
		sprintf (Nazwisko, "Nazwisko %d", i);
		char Email[100];
		sprintf (Email, "email%d@example.com", i);
		int Telefon = random (100000000, 999999999);
		float Pensja = randomFloat (3000.0, 25000.0);

		fprintf (plik, "%d,%d,%d,%d,%s,%s,%s,%d,%.2lf\n", ID_Pracownik, ID_Salon, ID_Adres, ID_Stanowisko, Imie, Nazwisko, Email, Telefon, Pensja);
	}

	fclose (plik);
}

void samochod () {
	FILE* plik = fopen ("../Dane/samochod.csv", "w");

	if( plik == NULL ) {
		printf ("Failed to open file samochod.csv\n");
		return;
	}

	for( i = 1; i <= 1000; i++ ) {
		int ID_Samochodu = i;
		int ID_Model = random (1, 100);
		int ID_Silnik = random (1, 100);
		int ID_Salonu = random (1, 100);
		int ID_Wersja = random (1, 100);
		int ID_Wyposazenie = random (1, 500);
		const char* Naped = naped[random (0, sizeof (naped) / sizeof (naped[0]) - 1)];
		char Kolor[10];
		sprintf (Kolor, "Kolor %d", random (1, 32));
		char VIN[18];
		generateVIN (VIN);
		char RokProdukcji[5];
		sprintf (RokProdukcji, "%d", random (2018, 2024));
		int Przebieg = random (0, 5000);
		float Cena = random (50000, 200000);

		fprintf (plik, "%d,%d,%d,%d,%d,%d,%s,%s,%s,%s,%d,%.2lf\n", ID_Samochodu, ID_Model, ID_Silnik, ID_Salonu, ID_Wersja,ID_Wyposazenie, Naped, Kolor, VIN, RokProdukcji, Przebieg, Cena);
	}

	fclose (plik);
}

void jazda_probna () {
	FILE* plik = fopen ("../Dane/jazda_probna.csv", "w");

	if( plik == NULL ) {
		printf ("Failed to open file jazda_probna.csv\n");
		return;
	}

	for( int i = 1; i <= 1000; i++ ) {
		int ID_JazdaProbna = i;
		int ID_Samochod = random (1, 1000);
		int ID_Pracownik = random (1, 500);
		int ID_Klient = random (1, 1000);
		struct tm Data = randomDate (2018, 1, 1, 2023, 4, 25);

		fprintf (plik, "%d,%d,%d,%d,%04d-%02d-%02d\n", ID_JazdaProbna, ID_Samochod, ID_Pracownik, ID_Klient,Data.tm_year + 1900, Data.tm_mon + 1, Data.tm_mday);
	}

	fclose (plik);
}

void magazyn () {
	FILE* plik = fopen ("../Dane/magazyn.csv", "w");

	if( plik == NULL ) {
		printf ("Failed to open file magazyn.csv\n");
		return;
	}

	for( i = 1; i <= 1000; i++ ) {
		int ID_Magazyn = i;
		int ID_Samochod = random (1, 1000);
		int ID_Silnik = random (1, 100);
		int ID_Czesc = random (1, 500);
		int ID_Akcesorium = random (1, 300);
		int Ilosc = random (0, 100);

		fprintf (plik, "%d,%d,%d,%d,%d,%d\n", ID_Magazyn, ID_Samochod, ID_Silnik, ID_Czesc, ID_Akcesorium, Ilosc);
	}

	fclose (plik);
}

void naprawa () {
	FILE* plik = fopen ("../Dane/naprawa.csv", "w");

	if( plik == NULL ) {
		printf ("Failed to open file naprawa.csv\n");
		return;
	}

	for( i = 1; i <= 1000; i++ ) {
		int ID_Naprawa = i;
		int ID_Samochod = random (1, 1000);
		int ID_Pracownika = random (1, 500);
		int ID_Czesc = random (1, 500);
		char TypNaprawy[16];
		sprintf (TypNaprawy, "Typ Naprawy %d", random (1, 20));
		struct tm DataPrzyjecia = randomDate (2018, 1, 1, 2023, 4, 25);
		struct tm DataWydania;
		float Cena = randomFloat (100.0, 15000.0);

		if( i <= 70 || mktime (&DataPrzyjecia) > time (NULL) ) {
		   // Ustaw NULL dla DataWydania
			fprintf (plik, "%d,%d,%d,%d,%s,%04d-%02d-%02d,NULL,%.2f\n", ID_Naprawa, ID_Samochod, ID_Pracownika, ID_Czesc, TypNaprawy,
					 DataPrzyjecia.tm_year + 1900, DataPrzyjecia.tm_mon + 1, DataPrzyjecia.tm_mday, Cena);
		}
		else {
			DataWydania = randomDate (DataPrzyjecia.tm_year + 1900, DataPrzyjecia.tm_mon + 1, DataPrzyjecia.tm_mday, 2023, 4, 25);
			fprintf (plik, "%d,%d,%d,%d,%s,%04d-%02d-%02d,%04d-%02d-%02d,%.2f\n", ID_Naprawa, ID_Samochod, ID_Pracownika, ID_Czesc, TypNaprawy,
					 DataPrzyjecia.tm_year + 1900, DataPrzyjecia.tm_mon + 1, DataPrzyjecia.tm_mday,
					 DataWydania.tm_year + 1900, DataWydania.tm_mon + 1, DataWydania.tm_mday, Cena);
		}
	}

	fclose (plik);
}

void czesci_samochod () {
	FILE* plik = fopen ("../Dane/czesci_samochod.csv", "w");

	if( plik == NULL ) {
		printf ("Failed to open file czesci_samochod.csv\n");
		return;
	}

	for( i = 1; i <= 10000; i++ ) {
		int ID_Czesci_Samochod = i;
		int ID_Czesci = random (1, 500);
		int ID_Samochod = random (1, 1000);

		fprintf (plik, "%d,%d,%d\n", ID_Czesci_Samochod, ID_Czesci, ID_Samochod);
	}

	fclose (plik);
}

void dodatkowe_samochod () {
	FILE* plik = fopen ("../Dane/dodatkowe_samochod.csv", "w");

	if( plik == NULL ) {
		printf ("Failed to open file dodatkowe_samochod.csv\n");
		return;
	}

	for( i = 1; i <= 10000; i++ ) {
		int ID_Dodatkowe_Samochod = i;
		int ID_Dodatkowe = random (1, 500);
		int ID_Samochod = random (1, 1000);

		fprintf (plik, "%d,%d,%d\n", ID_Dodatkowe_Samochod, ID_Dodatkowe, ID_Samochod);
	}

	fclose (plik);
}

void akcesoria_samochod () {
	FILE* plik = fopen ("../Dane/akcesoria_samochod.csv", "w");

	if( plik == NULL ) {
		printf ("Failed to open file akcesoria_samochod.csv\n");
		return;
	}

	for( i = 1; i <= 10000; i++ ) {
		int ID_Akcesoria_Samochod = i;
		int ID_Akcesoria = random (1, 300);
		int ID_Samochod = random (1, 1000);

		fprintf (plik, "%d,%d,%d\n", ID_Akcesoria_Samochod, ID_Akcesoria, ID_Samochod);
	}

	fclose (plik);
}

void wynajem () {
	FILE* plik = fopen ("../Dane/wynajem.csv", "w");

	if( plik == NULL ) {
		printf ("Failed to open file wynajem.csv\n");
		return;
	}

	for( i = 1; i <= 1000; i++ ) {
		int ID_Wynajem = i;
		int ID_Klient = random (1, 1000);
		int ID_Samochod = random (1, 1000);
		int ID_Pracownik = random (1, 100);
		struct tm DataWynajmu = randomDate (2018, 1, 1, 2023, 12, 31);
		struct tm DataZwrotu = randomDate (DataWynajmu.tm_year + 1900, DataWynajmu.tm_mon + 1, DataWynajmu.tm_mday, 2023, 12, 31);
		float Cena;

		int range = random (1, 100);

		// 70% szans
		if( range <= 70 )
			Cena = randomFloat (100.00, 800.00);

		// 30% szans
		else
			Cena = randomFloat (800.00, 2000.00);

		 // Ustaw NULL dla przypadkowych rekordów
		if( i <= 70 || i % 5 == 0 ) {
			DataZwrotu.tm_year = -1;
			DataZwrotu.tm_mon = -1;
			DataZwrotu.tm_mday = -1;
		}

		char DataZwrotuStr[11];
		if( DataZwrotu.tm_year == -1 ) {
			snprintf (DataZwrotuStr, sizeof (DataZwrotuStr), "");
		}
		else {
			snprintf (DataZwrotuStr, sizeof (DataZwrotuStr), "%04d-%02d-%02d", DataZwrotu.tm_year + 1900, DataZwrotu.tm_mon + 1, DataZwrotu.tm_mday);
		}

		fprintf (plik, "%d,%d,%d,%d,%04d-%02d-%02d,%s,%.2f\n", ID_Wynajem, ID_Klient, ID_Samochod, ID_Pracownik, DataWynajmu.tm_year + 1900, DataWynajmu.tm_mon + 1, DataWynajmu.tm_mday, DataZwrotuStr, Cena);
	}

	fclose (plik);
}

void sprzedaz () {
	FILE* plik = fopen ("../Dane/sprzedaz.csv", "w");

	if( plik == NULL ) {
		printf ("Failed to open file sprzedaz.csv\n");
		return;
	}

	for( i = 1; i <= 10000; i++ ) {
		int ID_Sprzedaz = i;
		int ID_Samochod = ( random (1, 10) <= 7 ) ? random (1, 1000) : -1; // 70% szansa na NULL
		int ID_Akcesorium = ( random (1, 10) <= 7 ) ? random (1, 300) : -1; // 70% szansa na NULL
		int ID_Pracownik = random (1, 200);
		int ID_Klient = random (1, 1000);
		int ID_Czesc = ( random (1, 10) <= 5 ) ? random (1, 500) : -1; // 50% szansa na NULL
		int ID_Wynajem = ( random (1, 10) <= 7 ) ? random (1, 1000) : -1; // 70% szansa na NULL
		int ID_Wersja = ( random (1, 10) <= 3 ) ? random (1, 100) : -1; // 30% szansa na NULL
		int ID_Naprawa = ( random (1, 10) <= 5 ) ? random (1, 1000) : -1; // 50% szansa na NULL
		int ID_Salon = random (1, 100);
		struct tm Data = randomDate (2018, 1, 1, 2023, 12, 31);
		float Kwota;

		int range = random (1, 100);

		// 70% szans na wygenerowanie liczby z przedzia³u 100.00-10000.00
		if( range <= 70 )
			Kwota = randomFloat (100.00, 10000.00);

		// 30% szans na wygenerowanie liczby z przedzia³u 10000.00-250000.00
		else
			Kwota = randomFloat (10000.00, 250000.00);

		char ID_Samochod_str[11];
		char ID_Akcesorium_str[11];
		char ID_Czesc_str[11];
		char ID_Wynajem_str[11];
		char ID_Wersja_str[11];
		char ID_Naprawa_str[11];

		if( ID_Samochod != -1 )
			snprintf (ID_Samochod_str, sizeof (ID_Samochod_str), "%d", ID_Samochod);
		else
			strcpy (ID_Samochod_str, "");

		if( ID_Akcesorium != -1 )
			snprintf (ID_Akcesorium_str, sizeof (ID_Akcesorium_str), "%d", ID_Akcesorium);
		else
			strcpy (ID_Akcesorium_str, "");

		if( ID_Czesc != -1 )
			snprintf (ID_Czesc_str, sizeof (ID_Czesc_str), "%d", ID_Czesc);
		else
			strcpy (ID_Czesc_str, "");

		if( ID_Wynajem != -1 )
			snprintf (ID_Wynajem_str, sizeof (ID_Wynajem_str), "%d", ID_Wynajem);
		else
			strcpy (ID_Wynajem_str, "");

		if( ID_Wersja != -1 )
			snprintf (ID_Wersja_str, sizeof (ID_Wersja_str), "%d", ID_Wersja);
		else
			strcpy (ID_Wersja_str, "");

		if( ID_Naprawa != -1 )
			snprintf (ID_Naprawa_str, sizeof (ID_Naprawa_str), "%d", ID_Naprawa);
		else
			strcpy (ID_Naprawa_str, "");


		fprintf (plik, "%d,%s,%s,%d,%d,%s,%s,%s,%s,%d,%04d-%02d-%02d,%.2f\n", ID_Sprzedaz, ID_Samochod_str, ID_Akcesorium_str, ID_Pracownik, ID_Klient, ID_Czesc_str, ID_Wynajem_str, ID_Wersja_str, ID_Naprawa_str, ID_Salon, Data.tm_year + 1900, Data.tm_mon + 1, Data.tm_mday, Kwota);
	}

	fclose (plik);
}

void platnosc () {
	FILE* plik = fopen ("../Dane/platnosc.csv", "w");

	if( plik == NULL ) {
		printf ("Failed to open file platnosc.csv\n");
		return;
	}

	for( int i = 1; i <= 1000; i++ ) {
		int ID_Platnosc = i;
		int ID_Sprzedaz = random (1, 1000);
		const char* RodzajDokumentu = rodzajDokumentu[random (0, 2)];
		const char* FormaPlatnosci = formaPlatnosci[random (0, 2)];
		struct tm Data = randomDate (2018, 1, 1, 2023, 12, 31);

		fprintf (plik, "%d,%d,%s,%s,%04d-%02d-%02d\n", ID_Platnosc, ID_Sprzedaz, RodzajDokumentu, FormaPlatnosci,
				 Data.tm_year + 1900, Data.tm_mon + 1, Data.tm_mday);
	}

	fclose (plik);
}

int main () {
	srand (time (NULL));

	adres ();
	ulica_slownik ();
	miasto_slownik ();
	akcesoria ();
	model ();
	silniki ();
	stanowiska ();
	czesci ();
	dodatkowe_wyposazenie ();
	wersja_wyposazenia ();
	salon_samochodowy ();
	klient ();
	pracownicy ();
	samochod ();
	jazda_probna ();
	magazyn ();
	naprawa ();
	czesci_samochod ();
	dodatkowe_samochod ();
	akcesoria_samochod ();
	wynajem ();
	sprzedaz ();
	platnosc ();

	return 0;
}