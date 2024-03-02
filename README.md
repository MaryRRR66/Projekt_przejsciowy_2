# Projekt_przejsciowy_2 :Analiza Obserwacji wielorybów


## Wprowadzenie
Celem projektu jest zrozumienie rozkładu geograficznego, sezonowości oraz różnorodności gatunków wielorybów obserwowanych na różnych platformach.

## Użyte Biblioteki R
- `ggplot2` - do wizualizacji danych.
- `dplyr` - do manipulacji danymi i analiz.

## Struktura Danych
Dane zawierają informacje takie jak:
- `Species`: Gatunek wieloryba.
- `Platform`: Platforma obserwacyjna.
- `Year`: Rok obserwacji.
- `Month`: Miesiąc obserwacji.
- `Latitude` i `Longitude`: Współrzędne geograficzne obserwacji.
- `Season`: Sezon, w którym dokonano obserwacji.

## Opis
Zestaw danych dostępny na figshare zawiera informacje o obserwacjach czterech gatunków wielorybów: Bryde's whale (wieloryb Bryde'a), Humpback whale (wieloryb garbaty), Sperm whale (kaszalot) oraz Southern right whale (wieloryb południowy) w regionie Afryki Południowej. Dane obejmują koordynaty geograficzne, daty obserwacji oraz platformę, z której pochodzą dane, dla sezonów letnich i zimowych.

## Źródło Danych
Dane zostały zgromadzone i opublikowane przez Jean Purdon w dniu 6 kwietnia 2021 roku. Pełna referencja do powiązanej publikacji znajduje się w artykule "Species distribution modelling of Bryde’s whales, humpback whales, southern right whales, and sperm whales in the southern African region to inform their conservation in expanding economies" dostępnym na PeerJ.

## Analizy
1. **Czyszczenie Danych**: Usuwam brakujące wartości i duplikaty, zapewniając czystość danych.
2. **Eksploracja Danych**: Przeprowadzam analizę eksploracyjną, tworząc histogramy rozkładu geograficznego i wykresy słupkowe gatunków oraz platform.
3. **Analiza Czasowa**: Badam trendy w liczbie obserwacji różnych gatunków w ciągu lat.
4. **Analiza Geograficzna**: Wizualizuję przestrzenny rozkład obserwacji wielorybów.
5. **Gatunek a Platforma**: Analizuję zależność między gatunkami a platformami obserwacyjnymi.
6. **Analiza Sezonowa**: Badam liczbę obserwacji w różnych sezonach.
7. **Analiza Regresji**: Przeprowadzam prostą analizę regresji liniowej, by zrozumieć trend w liczbie obserwacji.
8. **Prawdopodobieństwo Obserwacji na Platformie**: Obliczam prawdopodobieństwo obserwacji na różnych platformach.

## Jak Uruchomić
1. Zainstaluj R i wymagane pakiety.
2. Sklonuj repozytorium.
3. Uruchom skrypty R w swoim środowisku.

## Dodatkowe Informacje
- Liczba obserwacji: 6018
- Okres danych: 1913-2016
- Obsługiwane gatunki: Bryde's whale, Humpback whale, Southern right whale, Sperm whale
- Platformy obserwacyjne: MRI, Incidental sighting, MMO, OBIS
Jak Uruchomić
Zainstaluj R i wymagane pakiety.
Sklonuj repozytorium.
Uruchom skrypty R w swoim środowisku.

## Wnioski
Projekt umożliwia zrozumienie zachowań i rozmieszczenia wielorybów w różnych środowiskach geograficznych i czasowych. 
Analiza danych o obserwacjach wielorybów wykazała istnienie geograficznych wzorców występowania, sezonowych zmian oraz zróżnicowania gatunków, co może być istotne dla zrozumienia ich zachowań i planowania działań ochronnych. Oraz to że populacja ogólnie prawdopodobnie spada.

