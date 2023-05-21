#define _CRT_SECURE_NO_WARNINGS

#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>

int i;
const char* naped[] = { "Przedni", "Tylni", "4x4/AWD" };
const char* segment[] = { "A", "B", "C", "D", "E", "F", "S", "H", "J", "M" }; //https://mubi.pl/poradniki/klasy-samochodow/

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


void wymiar_adres () {
	FILE* plik = fopen ("../Dane/Wymiar_Adres.csv", "w");

	if( plik == NULL ) {
		printf ("Failed to open file Wymiar_Adres.csv\n");
		return;
	}

	for( int i = 1; i <= 1000; i++ ) {
		int ID_Adres = i;
		char Miasto[100];
		sprintf (Miasto, "Miasto %d", i);

		fprintf (plik, "%d,%s\n", ID_Adres, Miasto);
	}

	fclose (plik);
}

void wymiar_akcesoria () {
	FILE* plik = fopen ("../Dane/Wymiar_Akcesoria.csv", "w");

	if( plik == NULL ) {
		printf ("Failed to open file Wymiar_Akcesoria.csv\n");
		return;
	}

	for(i = 1; i <= 300; i++ ) {
		int ID_Akcesorium = i;
		char Nazwa[100];
		sprintf (Nazwa, "Akcesorium %d", i);

		fprintf (plik, "%d,%s\n", ID_Akcesorium, Nazwa);
	}

	fclose (plik);
}

void wymiar_model () {
	FILE* plik = fopen ("../Dane/Wymiar_Model.csv", "w");

	if( plik == NULL ) {
		printf ("Failed to open file Wymiar_Model.csv\n");
		return;
	}

	for( i = 1; i <= 100; i++ ) {
		int ID_Model = i;
		char Nazwa[100];
		sprintf (Nazwa, "Model %d", i);
		const char* Segment = segment[random (0, sizeof (segment) / sizeof (segment[0]) - 1)];

		fprintf (plik, "%d,%s,%s\n", ID_Model, Nazwa, Segment);

	}

	fclose (plik);
}

void wymiar_stanowiska () {
	FILE* plik = fopen ("../Dane/Wymiar_Stanowiska.csv", "w");

	if( plik == NULL ) {
		printf ("Failed to open file Wymiar_Stanowiska.csv\n");
		return;
	}

	for( i = 1; i <= 100; i++ ) {
		int ID_Stanowiska = i;
		char Nazwa[100];
		sprintf (Nazwa, "Stanowisko %d", i);

		fprintf (plik, "%d,%s\n", ID_Stanowiska, Nazwa);
	}

	fclose (plik);
}

void wymiar_salon () {
	FILE* plik = fopen ("../Dane/Wymiar_Salon.csv", "w");

	if( plik == NULL ) {
		printf ("Failed to open file Wymiar_Salon.csv\n");
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

void wymiar_klient () {
	FILE* plik = fopen ("../Dane/Wymiar_Klient.csv", "w");

	if( plik == NULL ) {
		printf ("Failed to open file Wymiar_Klient.csv\n");
		return;
	}

	for( i = 1; i <= 1000; i++ ) {
		int ID_Klient = i;
		int ID_Adres = random (1, 200);
		char Imie[100];
		sprintf (Imie, "Imie %d", i);
		char Nazwisko[100];
		sprintf (Nazwisko, "Nazwisko %d", i);

		fprintf (plik, "%d,%d,%s,%s\n", ID_Klient, ID_Adres, Imie, Nazwisko);
	}

	fclose (plik);
}

void wymiar_pracownicy () {
	FILE* plik = fopen ("../Dane/Wymiar_Pracownicy.csv", "w");

	if( plik == NULL ) {
		printf ("Failed to open file Wymiar_Pracownicy.csv\n");
		return;
	}

	for( i = 1; i <= 500; i++ ) {
		int ID_Pracownik = i;
		int ID_Stanowisko = random (1, 100);
		int ID_Salon = random (1, 100);
		char Imie[100];
		sprintf (Imie, "Imie %d", i);
		char Nazwisko[100];
		sprintf (Nazwisko, "Nazwisko %d", i);

		fprintf (plik, "%d,%d,%d,%s,%s\n", ID_Pracownik, ID_Stanowisko, ID_Salon, Imie, Nazwisko);
	}

	fclose (plik);
}

void wymiar_samochod () {
	FILE* plik = fopen ("../Dane/Wymiar_Samochod.csv", "w");

	if( plik == NULL ) {
		printf ("Failed to open file Wymiar_Samochod.csv\n");
		return;
	}

	for( i = 1; i <= 1000; i++ ) {
		int ID_Samochodu = i;
		int ID_Model = random (1, 100);
		int ID_Salonu = random (1, 100);
		int ID_Akcesorium = random (1, 100);
		const char* Naped = naped[random (0, sizeof (naped) / sizeof (naped[0]) - 1)];
		char VIN[18];
		generateVIN (VIN);
		char RokProdukcji[5];
		sprintf (RokProdukcji, "%d", random (2018, 2024));
		char Kolor[10];
		sprintf (Kolor, "Kolor %d", random (1, 32));
		
		fprintf (plik, "%d,%d,%d,%d,%s,%s,%s,%s\n", ID_Samochodu, ID_Model, ID_Salonu, ID_Akcesorium, Naped,VIN, RokProdukcji, Kolor);
	}

	fclose (plik);
}

void wymiar_naprawa () {
	FILE* plik = fopen ("../Dane/Wymiar_Naprawa.csv", "w");

	if( plik == NULL ) {
		printf ("Failed to open file Wymiar_Naprawa.csv\n");
		return;
	}

	for( i = 1; i <= 1000; i++ ) {
		int ID_Naprawa = i;
		int ID_Samochod = random (1, 1000);
		char TypNaprawy[16];
		sprintf (TypNaprawy, "Typ Naprawy %d", random (1, 20));
		struct tm DataPrzyjecia = randomDate (2018, 1, 1, 2023, 4, 25);
		float Cena = randomFloat (100.0, 15000.0);

		fprintf (plik, "%d,%d,%s,%04d-%02d-%02d,%.2f\n", ID_Naprawa, ID_Samochod, TypNaprawy, DataPrzyjecia.tm_year + 1900, DataPrzyjecia.tm_mon + 1, DataPrzyjecia.tm_mday, Cena);
		}

	fclose (plik);

}

void fakt_sprzedaz () {
	FILE* plik = fopen ("../Dane/Fakt_Sprzedaz.csv", "w");

	if( plik == NULL ) {
		printf ("Failed to open file Fakt_Sprzedaz.csv\n");
		return;
	}

	for( i = 1; i <= 10000; i++ ) {
		int ID_Sprzedaz = i;
		int ID_Samochod = ( random (1, 10) <= 7 ) ? random (1, 1000) : -1; // 70% szansa na NULL
		int ID_Model = ( random (1, 10) <= 7 ) ? random (1, 1000) : -1; // 70% szansa na NULL
		int ID_Klient = random (1, 1000);
		int ID_Pracownik = random (1, 200);
		int ID_Stanowiska = random (1, 100);
		int ID_Salonu = random (1, 100);
		int ID_Akcesorium = ( random (1, 10) <= 7 ) ? random (1, 300) : -1; // 70% szansa na NULL
		int ID_Naprawa = ( random (1, 10) <= 5 ) ? random (1, 1000) : -1; // 50% szansa na NULL
		int ID_Adres = random (1, 200);
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
		char ID_Model_str[11];
		char ID_Naprawa_str[11];

		if( ID_Samochod != -1 )
			snprintf (ID_Samochod_str, sizeof (ID_Samochod_str), "%d", ID_Samochod);
		else
			strcpy (ID_Samochod_str, "");

		if( ID_Akcesorium != -1 )
			snprintf (ID_Akcesorium_str, sizeof (ID_Akcesorium_str), "%d", ID_Akcesorium);
		else
			strcpy (ID_Akcesorium_str, "");

		if( ID_Naprawa != -1 )
			snprintf (ID_Naprawa_str, sizeof (ID_Naprawa_str), "%d", ID_Naprawa);
		else
			strcpy (ID_Naprawa_str, "");

		if( ID_Model != -1 )
			snprintf (ID_Model_str, sizeof (ID_Model_str), "%d", ID_Model);
		else
			strcpy (ID_Model_str, "");


		fprintf (plik, "%d,%s,%s,%d,%d,%d,%d,%s,%s,%d,%04d-%02d-%02d,%.2f\n", ID_Sprzedaz, ID_Samochod_str, ID_Model_str, ID_Klient, ID_Pracownik, ID_Stanowiska, ID_Salonu, ID_Akcesorium_str, ID_Naprawa_str, ID_Adres, Data.tm_year + 1900, Data.tm_mon + 1, Data.tm_mday, Kwota);
	}

	fclose (plik);
}

int main () {
	srand (time (NULL));

	wymiar_adres ();
	wymiar_akcesoria ();
	wymiar_model ();
	wymiar_stanowiska ();
	wymiar_salon ();
	wymiar_klient ();
	wymiar_pracownicy ();
	wymiar_samochod ();
	wymiar_naprawa ();
	fakt_sprzedaz ();

	return 0;
}