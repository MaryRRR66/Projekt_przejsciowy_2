dane <- read.csv("C:/Users/Mary/Downloads/All species data.csv", header = TRUE, stringsAsFactors = FALSE)



head(dane)
summary(dane)
str(dane)
lapply(dane, unique)

library(ggplot2)
library(dplyr)
#czyszczenie
dane <- na.omit(dane)
for(i in 1:ncol(dane)){
  if(is.numeric(dane[,i])){
    dane[is.na(dane[,i]), i] <- median(dane[,i], na.rm = TRUE)
  }
}
dane <- unique(dane)

#eksploracja

ggplot(dane, aes(x=Latitude)) + geom_histogram(bins=30, fill="blue", color="black") + ggtitle("Rozkład Szerokości Geograficznej")
ggplot(dane, aes(x=Longitude)) + geom_histogram(bins=30, fill="green", color="black") + ggtitle("Rozkład Długości Geograficznej")
ggplot(dane, aes(x=Species)) + geom_bar(fill="coral") + theme(axis.text.x = element_text(angle = 45, hjust = 1)) + ggtitle("Rozkład Gatunków")
ggplot(dane, aes(x=Platform)) + geom_bar(fill="lightblue") + theme(axis.text.x = element_text(angle = 45, hjust = 1)) + ggtitle("Rozkład Platform")

#analiza czasowa
dane$Year <- as.integer(as.character(dane$Year))
yearly_counts <- dane %>%
  filter(!is.na(Year)) %>%
  group_by(Year, Species) %>%
  summarise(count = n(), .groups = 'drop') 
ggplot(yearly_counts, aes(x = Year, y = count, color = Species)) +
  geom_line() +
  labs(title = "Liczba obserwacji różnych gatunków wielorybów w ciągu lat",
       x = "Rok",
       y = "Liczba obserwacji") +
  theme_minimal()

#gegraficzna

ggplot(dane, aes(x = Longitude, y = Latitude, color = Species)) +
  geom_point(alpha = 0.6) +
  labs(title = "Rozkład przestrzenny obserwacji wielorybów",
       x = "Długość geograficzna",
       y = "Szerokość geograficzna") +
  theme_minimal() +
  theme(legend.position = "bottom") +
  coord_quickmap()

#gatunek a platforma obserwacyjna
tabela_gatunek_platforma <- table(dane$Species, dane$Platform)
print(tabela_gatunek_platforma)
df_gatunek_platforma <- as.data.frame(tabela_gatunek_platforma)
ggplot(df_gatunek_platforma, aes(Var1, Freq, fill = Var2)) +
  geom_bar(stat = "identity", position = position_dodge()) +
  labs(title = "Obserwacje gatunków na różnych platformach",
       x = "Gatunek",
       y = "Liczba obserwacji",
       fill = "Platforma") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) 

#analiza z dplyr w sezonach róznych
dane %>%
  group_by(Season) %>%
  summarise(Liczba_Obserwacji = n()) %>%
  ggplot(aes(x = Season, y = Liczba_Obserwacji, fill = Season)) +
  geom_bar(stat = "identity") +
  theme_minimal() +
  labs(title = "Liczba obserwacji w różnych sezonach", x = "Sezon", y = "Liczba obserwacji")

# sezon a gatunek

dane %>%
  group_by(Species, Season) %>%
  summarise(Count = n(), .groups = 'drop') %>%
  ggplot(aes(x = Season, y = Count, fill = Species)) +
  geom_bar(stat = "identity", position = position_dodge()) +
  labs(title = "Sezonowość obserwacji różnych gatunków", x = "Sezon", y = "Liczba obserwacji") +
  theme_minimal()

#regresja

dane_regresja <- dane %>%
  mutate(Year = as.numeric(as.character(Year))) %>% 
  group_by(Year) %>%
  summarise(Count = n(), .groups = 'drop')
regresja <- lm(Count ~ Year, data = dane_regresja)
summary(regresja)
ggplot(dane_regresja, aes(x = Year, y = Count)) +
  geom_point() +
  geom_smooth(method = "lm", color = "blue") +
  labs(title = "Trend liczby obserwacji w ciągu lat", x = "Rok", y = "Liczba obserwacji") +
  theme_minimal()

#prawdopodobienstwo zobaczenia na dane platformie

platform_prob <- dane %>% 
  group_by(Platform) %>% 
  summarise(Probability = n() / nrow(dane)) %>%
  arrange(desc(Probability))

print(platform_prob)

