#ZKRATKY
# pravy Alt + x
# $ pravy Alt + ů
# * pravy Alt + -
# & pravy Alt + c
# [] pravy Alt + f (pro levou) g (pro pravou)

#JAK SI NASTAVIT BARVY A VELIKOST PISMA
#Tools -> Global Options... -> Appearance
###############################################
#NACTENI UKAZKOVYCH DAT
data <- read.csv("data_txt_clean.csv")
###############################################

getwd() #v jake slozce (directory) jsme
list.files() #vypsat soubory co jsou ve slozce
setwd() #nastaveni directory

#NAPOVEDA
#lze i rucne v Help
help(mean)
?mean # to same co help(mean)
example(mean) #da ukazku hledane fce
help.search("data input") #pokud nevite nazev fce ktera dela "x"
help(package=readr) #otevre napovedu pro balicek

#HODNOTY CO LZE POUZIT V R
#numeric
1 #cela (integer)
9.5 #realna (double)
4+2i #komplexní (complex)
5 + 6
5/2
3*12
6^2
Inf
#character (string)
"kočička"
"Hello world"
"hello" * 5 #nelze provadet matematicke operace na nenumerickem objektu
#logical
5 < 4
FALSE
5 > 4
TRUE
#chybejici hodnoty
NA
NaN #nemozna cisla napriklad deleni nulou

#ULOZENI HODNOT DO OBJEKTU
#ulozeni aka prirazeni se vzdy provadi pomoci <-
wer <- 9
rew <- 6

rew * wer #s objekty lze nadale pracovat, jmena jsou defakto jen zkratky/zaspoupeni

vysledek <- 5 + 6
vysledek #objekt zavolame jeho vypsanim

vysledek_2 <- 5 + 9; vysledek_2 #objekt lze zavolat jiz behem jeho prirazeni pomoci ;x

VYSLEDEK <- 567 / 234; VYSLEDEK #R je case sensitive

5aut <- 5 #nesmi se zacinat cislici
pet aut <- 5 #nesmi byt mezery
!petaut <- 5 #nesmi se zacinat znakem

kolo<-4
auto <- 5 #pouzivat mezery pro prehledny kod
bus < - 7 #nebhodnou mezerou muzeme zmenit prikaz (zde < a -)

a <- "a"; a
a <- "b"; a #objekty lze prepsat tim ze se znovu priradi

auto + 10
auto # bez prepsani nedojde ke zmene
auto <- auto + 10; auto

mean <- 5 #nepojmenovavat objekty stejne jako fuikce
mean*(6:77) #objekt mean krat cisla od 6 do 77
mean(6:77) #prumer cisel od 6 do 77

#FUNKCE
#funkce(jeji argumenty)
rep(x = kolo, 6) #funkce(x = na cem, za jakych podminek)
rep(kolo, 6) # x = neni potreba psat, pozice staci
            # pozor ale pri prohazovani poradi argumentu
seq(from = 1, to = 100, by = 0.8)
seq(by = 0.8, to = 100, from = 1) #funguje i pri prohozeni protoze pojmenovane casti
  #trva ale dele
seq(from = kolo, to = auto, by = 0.2) #lze pouzit i objekty pokud splnuji podminky
                                      #zde se musi jednat o numericke objekty
c(5, 8, 11) #fce combine vytvori vektor z vlozenych hodnot
c(kolo, auto)
c("kolo", "auto")
vektor <- c("kolo", "auto"); vektor #vysledky fci lze ulozit jako objekt

#novy operator = rovna se
n = 10; n
#nelze vzdy pouzit do ulozeni do globalniho prostredi
median(x = 1:10)
x #Error: object 'x' not found
#prirazeni jen v ramci fce, neulozi se proto do globalu
median(x <- 1:10)
x #[1]  1  2  3  4  5  6  7  8  9 10
#pro x se ulozi v global hodnoty 1:10 i kdyz je v fci

#VLASTNOSTI ULOZENEHO OBJEKTU
auto
mode(auto) #klasifikace zakladni struktury objektu
  #numeric, complex, character ,logical, lists
class(auto) #urci typ objektu a jak se s nim bude zachazet
  #jednoduche objekty mohou mit class a mode stejne

v <- cbind(c(1,2,3),c(4,5,6)); v
mode(v)
class(v)
#v je matice slozena z numerickych objektu

#JAK MUZE OBJEKT VYPADAT
#Skalar
  #objekt o jedne hodnote
sk1 <- 5; sk1
sk2 <- "giraffe"; sk2
sk1_2 <- 5 / 6; sk1_2
sk2_2 <- "2"; sk2_2 #i cisla mohou byt ulozena jako charakter
#Vektor
  #objekt s x hodnotami jdoucimi za sebou
  #jednorozmerny objekt
  #hodnoty bud numericke nebo characters
    #mix = nucena konverze na char
vektor <- c("kolo", "auto"); vektor
rotkev <- c("auto", "kolo")  #poradi hodnot ve vektoru je dulezite
identical(vektor, rotkev) #fce identical: jsou hodnoty X a Y identicke?
posobe <- (6:77); posobe
jednasto <- seq(from = 1, to = 100, by = 0.5); jednasto
mix <- c("a", 1, "b", 2, "c", 3); mix
class(mix) #num nebo char jinak prevod
cisla <- c(5:10); cisla
5 * cisla #akce je provadena na vsechny hodnoty ve vektoru
#Matice
  #dvourozmerny objekt slozeny z vice vektoru stejneho datatypu a delky
m_1 <- rep(2:4, length.out = 6)
m_2 <- seq(from = 2, to = 5000, length.out = 6)
m_3 <- seq(1:6)
matice <- cbind(m_1, m_2, m_3); matice #fce cbind svaze vektor po sloupcich
class(matice)
#Array
  #vicerozmerny objekt slozeny z vice vektoru stejneho datatypu a delky
  #matice do nich defakto patri
pole_cisla <- c(1:24)
pole <- array(pole_cisla, dim = c(4, 3, 2)); pole

#List
#objekt ktery je slozeny z jinych objektu
  #objekty mohou byt ruznych typu (a delky)
l_1 <- list(c("Jan", "Feb", "Mar", "Apr"), c(31, 28, 31, 30, 31), 2.5, FALSE); l_1


#data frame
#dvourozmerny objekt slozeny z vektoru co mohou byt i ruzneho typu
df_1 <- rep(c("kolo", "auto"), length.out = 6)
df <- data.frame(m_1, m_2, df_1); df
class(df)

#JAK VYBRAT DATA AKA INDEXACE
#index vzdy numeric
i1 <- c(40:50); i1 #1D objekt - vektor
i1[3]
i1[-1]
i1[1:3]
i1[c(2,5)]
i1[seq(to = 6, by = 2)]
licha <- c(1, 3, 5)
i1[licha]

df[5,] #5. radek, vsechny sloupce
#df = 2D objekt - dataframe
  #proto ve vyberu musi byt definovane obe dimenze
df[,2] #vsechny radky, 2. sloupec
df[5,2] #5. radek, 2. sloupec

data[5,"Side"] #lze vybirat i pomoci jmen elementu
data["Side"] #vyber element s timto jmenem
data$Side # $ operator vybira elementy z x
l <- data["Side"]
k <- data$Side
identical(l, k) #jak zjistit jestli jsou stejne? proc ne
class(l) #"x"vybere specifikovanou cast dataframe, zustava jako dataframe
class(k) #$ vybere hodnoty z objektu
mode(l)
mode(k)

muzi <- data[data$Sex == "male", 1:6]; muzi
#vyber vsechny radky kde hodnota elementu Sex je presne male
  # == je presne
zeny <- data[data$Sex != "male", 1:6]; zeny
#vyber vsechny radky kde hodnota elementu Sex neni male
  # operator ! provadi negaci

#SESTAVENI DATAFRAME
a_1 <- c(0, 1, 2)
b_1 <- c(2, 0, 1)
c_1 <- c(1, 2, 0)

aabc <- data.frame(a, b, c); abc
#data.frame vytvori tabulku z x polozek

abc_c <- cbind(a, b, c); abc_c
#cbind spoji vektory jako sloupce - nejedna se o data frame!
class(abc_c) # je to matice
abc_cd <- cbind.data.frame(a, b, c); abc_cd
#ulozi jako data.frame
class(abc_cd)

abc_rd <- rbind.data.frame(a, b, c); abc_rd
#rbind ulozi po radcich
colnames(abc_rd) <- c("1", "2", "3")
#colnames vytvori jmena sloupcu pro x
row.names(abc_rd) <- c("auto", "kolo", "bicykl")
#row.names vytvori jmena radku pro x

#BALICKY
install.packages("readxl") #fce nainstaluje balicek x
install.packages("readr")
library(readxl) #fce library nacte balicek x
library(readr)

#JAK NAHRAT DATA DO GLOBALNIHO PROSTREDI
#balicky: readxl pro excel
  #kliknuti na soubor ve Files -> Import dataset
  #potreba kontroly, nemusi vzit vsechno!
#manualne: txt
data_txt <- read.table("uvod_data.txt", sep = "",
                       header = TRUE, dec = "."); data_txt
data_csv <- read.csv("uvod_data.csv", sep = ";", header = TRUE)
  #nahrano manualne ale balicek readr umi i pres Import
data_xsls <- read_xlsx("uvod_data.xlsx", col_names = TRUE, sheet = 1, na = "NA")
#vzdy se primarne ulozi jako dataframe

#KONTROLA A UPRAVA DATA FRAME
head(data_txt, 10) #vypise v konzoly ukazku dat, bez cisla prvnich pet
dim(data_txt) #dimenze data frame
dimnames(data_txt) #nazvy sloupcu a radku
names(data_txt) #nazvy sloupcu/entit
str(data_txt) #struktura data frame
#nejdriv je data potreba prekontrolovat nez se s nimi bude pracovat

data_txt$Sex <- as.factor(data_txt$Sex)
  #prevede variable data_txt$Sex na typ dat faktor
  #dochazi k premene/prevyjadreni pouze casti objektu, zbytek zustava stejny
data_txt[c("Side","Sex")] <- lapply(data_txt[c("Side","Sex")], as.factor)
  #prevede vice variables na faktory
  #fce lapply - na vsechny elementy v x aplikuj funkci y

levels(data_txt$Sex) #jake jsou levely (typy) faktoru
levels(data_txt$Side)

levels(data_txt$Sex)[levels(data_txt$Sex) == "zena"] <- "female"
  #prepise vsechny hodnoty presne "zena" na "female" ve sloupci Sex
levels(data_txt$Sex)[levels(data_txt$Sex) == "muz"] <- "male"
levels(data_txt$Side)[levels(data_txt$Side) == "dy"] <- "dx"
levels(data_txt$Side)[levels(data_txt$Side) %in% c("si", "sni")] <- "sin"
  #prepise vsechny hodnoty v data_txt$Side ktere jsou obsazeny ve vektoru c("si", "sni") na "sin"
  #%in% obsahuje, je v,
  #lze pouzit k vybrani dat nebo k overeni TRUE/FALSE
  67 %in% c(2,5,8,23,67,34) #je 67 ve vektoru
  45 %in% c(2,5,8,23,67,34)
  vec1 <- c(2,5,8,23,67,34)
  vec2 <- c(1,2,8,34) 
  vec2 %in% vec1 #je obsah vec2 v obsahu vec1
  !(vec2 %in% vec1) #neni obsah vec2 v obsahu vec1

#VYMAZANI NA HODNOT
NA #chybejici hodnota
na.omit() #fce vymaze NA hodnoty z X
data_txt <- data_txt[complete.cases(data_txt),]
  #v tabulce tab necha pouze radky co jsou kompletni (nemaji NA)

#EXPORT DATA FRAME
write.csv(data_txt, file = "data_final")

#VYMAZANI
ls() #zobrazi nahrane objekty
rm(list = ls()) #vymaze cele globalni prostredi
rm("data_csv") #vymaze specificky data frame