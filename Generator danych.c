#include <stdio.h>
#include <stdlib.h>

int random(int min_num, int max_num){
    int result=0,low_num=0,hi_num=0;
    if(min_num<max_num){
      low_num=min_num;
      hi_num=max_num+1; // this is done to include max_num in output.
    }else{
      low_num=max_num+1;// this is done to include max_num in output.
       hi_num=min_num;
    }
    result = (rand()%(hi_num-low_num))+low_num;
    return result;
}

char* imiona[] = {"Jan", "Marek", "Andrzej", "Tomasz", "Anna", "Katarzyna", "Piotr", "Kamil", "Sebastian", "Karol", "Michal", "Pawel", "Rafal"};
char* nazwiska[] = {"Nowak", "Wojcik", "Kowalczyk", "Wozniak", "Kaczmarek", "Mazur", "Krawczyk", "Adamczyk", "Dudek"};

char* ulice[]={"Browarna","Wodna","Kredowa","Okrzei Stefana","Nowaki","Malikowa","Czysta","Stawowa","Komandorska",
                "Jana Matejki","Hoza","Wolna","Parkowa","Drukarska","Gimnazjalna","Legionow","Chopina","Jackowskiego",
                "Lotnisko","Bankowa","Stawy","Gminna","Graniczna","Ochotnicza","Agatowa","Strumykowa","Towarowa","Pocztowa",
                "Walczaka","Marcinkowskiego","Tuwima","Komuny Paryskiej","Miedziana","Zwirki i Wigury","Pokoju","Kolejowa",
                "Lubelska","Litewska","Rzeczna","Mickiewicza","Klikowska","Graniczna","Szkolna","Zgoda","Przeskok","Grodzka",
                "Jachowicza","Kolejowa","Krupnicza","Rynek","Zamkowa","Filtrowa","Jasna","Dobra","Obszar Kolei","Unii Lubelskiej",
                "Reformacka","Hutnicza","Poniatowskiego","Jana Pawla II","Ryska","Ogrodowa","Dzika","Klonowa","Noniewicza","Paca",
                "Mochnackiego","Westerplatte","Mieszka I","Marynarki Polskiej","Promenada","Orzechowa","Bankowa","Dworcowa",
                "Mariacka","Grabowa","Dziewanny","Bracka","Barbary","Piastowska","Polna","Kajki","Kielecka","Nowowiejska",
                "Ostatnia","Osiecka","Kopanina","Chrobrego","Sikorskiego","Pocztowa","Wysoka","Sierpowa","Koksowa","Morska",
                "Rybacka","Podgrodzie"};

char* kod_p[]={"25-817","25-825","25-640","28-300","49-200","37-610","50-013","50-018","50-021","59-500","59-500",
               "59-501","85-004","85-005","85-007","86-304","86-305","86-307","08-521","08-530","08-505","20-010",
               "20-010","20-012","65-012","65-101","65-114","66-400","66-407","66-413","90-001","90-007","90-038",
               "98-200","98-202","98-210","30-003","30-014","30-021","33-100","33-102","33-104","00-006","00-018",
               "00-032","09-404","09-402","09-401","45-013","45-015","45-016","47-200","47-205","47-206","35-005",
               "35-016","35-026","37-462","37-463","37-467","15-008","15-010","15-019","16-431","16-432","16-433",
               "76-202","76-203","76-205","76-270","76-273","76-274","40-007","40-012","40-014","44-100","44-102",
               "44-103","10-022","10-023","10-059","82-302","82-306","82-308","60-102","60-103","60-105","62-200",
               "62-204","62-210","70-005","70-016","70-031","75-210","75-228","75-240"};

char* miasta[]={"Kielce","Jedrzejow","Wroclaw","Zlotoryja","Bydgoszcz","Grudziac","Deblin","Lublin","Zielona Gora",
                "Gorzow Wielkopolski","Lodz","Sieradz","Krakow","Tarnow","Warszawa","Plock","Opole","Kedzierzyn Kozle",
                "Rzeszow","Stalowa Wola","Bialystok","Suwalki","Slupsk","Ustka","Katowice","Gliwice","Olsztyn","Elblag",
                "Poznan","Gniezno","Szczecin","Koszalin"};




char* wojewodztwa[]={"Swietokrzyskie","Dolnoslaskie","Kujawsko-pomorskie","Lubelskie","Lubuskie","Lodzkie","Malopolskie",
                     "Mazowieckie","Opolskie","Podkarpacie","Podlaskie","Pomorskie","Slaskie","Warminsko-mazurskie",
                     "Wielkopolskie","Zachodniopomorskie"};

char* miesiace[]={"Styczen","Luty","Marzec","Kwiecien","Maj","Czerwiec","Lipiec","Sierpien","Wrzesien","Pazdziernik","Listopad","Grudzien"};

char* platnosci[]={"gotowka","karta","czek","karta zblizeniowa"};

char* stanowiska[]={"listonosz","dyrektor","kierownik","obsluga"};

int pensja[]={2000,12000,2500,1750};

char* uslugi[]={"uslugi listowe","uslugi paczkowe","uslugi finansowe"};

char* typy_uslug[]={"ekonomiczny","polecony","priorytet","przekaz"};



void dane_adr(){
     FILE* plik = fopen("dane_adresowe.csv","w");

    int i;
    for(i = 1; i <= 100; i++){
          char* imie = imiona[random(0, sizeof(imiona)/sizeof(imiona[0])-1)];
          char* nazwisko = nazwiska[random(0, sizeof(nazwiska)/sizeof(nazwiska[0])-1)];
          fprintf(plik, "%d,%s,%s,%d %d %d %d %d %d %d\n", i, imie, nazwisko,random(10,99),random(1000, 9999),random(0, 9999),random(0, 9999),random(0, 9999),random(0, 9999),random(0, 9999));
    }

    fclose(plik);
}

void dane_adr_odb(){
     FILE* plik = fopen("adresy_odbiorcow.csv","w");

    int i;
    int j=-1;
    int u=0;
    int k=0;
    for(i = 1; i <= 96; i++){
            if(((i-1)%3)==0)
            j++;
            char* miasto = miasta[j];
            char* ulica = ulice[i-1];
            char* kod =kod_p[i-1];
            fprintf(plik, "%d,%s,%s,%d,%s\n", i, miasto, ulica,random(0,400),kod);
    }

    fclose(plik);
}

void dane_odb(){
     FILE* plik = fopen("odbiorcy.csv","w");

    int i;
    for(i = 1; i <= 100; i++){
          fprintf(plik, "%d,%d,%d\n", i,random(1,96) , i);
    }
    fclose(plik);
}
void wojewodztwa_dane(){
	FILE* plik = fopen("wojewodztwa.csv","w");
	int i;
    for(i = 1; i <= 16; i++){
          char* wojewodztwo = wojewodztwa[i-1];
          fprintf(plik, "%d,%s\n", i,wojewodztwo);
    }
	fclose(plik);
}
void miasto_odd(){
     FILE* plik = fopen("miasta.csv","w");

    int i;
    int j=0;
    for(i = 1; i <= 32; i++){
          if((i-1)%2==0)
            j++;
          char* miasto = miasta[i-1];
          fprintf(plik, "%d,%s,%d\n", i,miasto ,j);
    }
    fclose(plik);
}

void oddzialy(){
     FILE* plik = fopen("oddzialy.csv","w");

    int i;
    int j=0;
    for(i = 1; i <=96; i++){
          if(((i-1)%3)==0)
                j++;
          char* ulica = ulice[i-1];
          char* kod=kod_p[i-1];
          fprintf(plik, "%d,%s,%d, %s,%d\n", i,ulica,random(1,30),kod,j);
    }
    fclose(plik);
}
void rok_dane(){
	FILE* plik = fopen("rok.csv","w");

    int i;
    for(i = 1; i <= 40; i++){
          fprintf(plik, "%d,%d\n", i,1975+i);
    }
    fclose(plik);
}

void miesiac_dane(){
	FILE* plik = fopen("miesiac.csv","w");

    int i;
    int r=0;
    int j=0;
    int doo=11;
    for(i = 1; i <= 480; i++){
          if(r<40)
            r++;
          else{
            r=1;
            j++;
          }
          char* miesiac = miesiace[j];
          fprintf(plik, "%d,%s,%d\n", i,miesiac,r);
    }
    fclose(plik);
}

void dzien_dane(){
	FILE* plik = fopen("dzien.csv","w");

    int i;
    int m=0;
    int j=1;
    int odd=0;
    int doo=27;
    for(i=1;i<=13440;i++){
          if(m<480)
            m++;
          else{
            m=1;
            j++;
          }
          fprintf(plik, "%d,%d,%d\n", i,j,m);
    }
    fclose(plik);
}

void platnosci_dane(){
	FILE* plik = fopen("platnosci.csv","w");

    int i;
    for(i = 1; i <= 4; i++){
		  char* platnosc = platnosci[i-1];
          fprintf(plik, "%d,%s\n", i,platnosc);
    }
    fclose(plik);
}
void pracownicy_dane(){
	FILE* plik = fopen("pracownicy.csv","w");

    int i,x;
    for(i = 1000; i <= 1800; i++){
          char* imie = imiona[random(0, sizeof(imiona)/sizeof(imiona[0])-1)];
          char* nazwisko = nazwiska[random(0, sizeof(nazwiska)/sizeof(nazwiska[0])-1)];
		  x=random(0,3);
		  char* stanowisko = stanowiska[x];
          fprintf(plik, "%d,%s,%s,%s,%d\n", i, imie, nazwisko,stanowisko,pensja[x]);
    }

    fclose(plik);
}
void t_uslugi_dane(){
	FILE* plik = fopen("typy_uslug.csv","w");
    int i;
    for(i = 1; i <= 4; i++){
		  char* typ_uslugi = typy_uslug[i-1];
          fprintf(plik, "%d,%s\n", i,typ_uslugi);
    }
    fclose(plik);
}
void uslugi_dane(){
	FILE* plik = fopen("uslugi.csv","w");
    int i,x,f;
    char* typ_uslugi;
    for(i = 1; i <= 7; i++){
		if(i<4){
		  x=1;
		  f=i;
		}
		else if(i<7){
			x=2;
			f=i-3;
		}
			else{
				x=3;
				f=4;
			}
          fprintf(plik, "%d,%s,%d\n", i,uslugi[x-1],f);
    }
    fclose(plik);
}
void zlecenia_dane(){
	FILE* plik = fopen("zlecenia.csv","w");
    int i;
    for(i = 1; i <= 50000; i++){
          fprintf(plik, "%d,%d,%d,%d,%d,%d,%d,%d,%d,\n", i,random(1,100),random(1,7),random(1,13440),random(1,96),random(1000,1800),random(1,4),random(5,200),random(1,7));
    }
    fclose(plik);
}
int main(){
    srand(time(NULL));


	dane_adr();
    dane_adr_odb();
	dane_odb();
	wojewodztwa_dane();
	miasto_odd();
	oddzialy();
	rok_dane();
	miesiac_dane();
	dzien_dane();
	platnosci_dane();
	pracownicy_dane();
	t_uslugi_dane();
	uslugi_dane();
	zlecenia_dane();

    return 0;
}
