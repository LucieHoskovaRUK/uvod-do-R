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
"Hello"
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

acko <- "a"; a
acko <- "b"; a #objekty lze prepsat tim ze se znovu priradi

auto + 10
auto # bez prepsani nedojde ke zmene
auto <- auto + 10; auto

mean <- 5 #nepojmenovavat objekty stejne jako fuikce
mean*(6:77) #objekt mean krat cisla od 6 do 77
mean(6:77) #prumer cisel od 6 do 77

#VYMAZANI
ls() #zobrazi nahrane objekty
rm(list = ls()) #vymaze cele globalni prostredi
rm("mean") #vymaze specificky objekt

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

is.numeric(kolo) #je objekt x tento typ?
is.character(kolo)
as.character(kolo) #zmen typ objektu x na tento typ
#aby doslo k prepisu a ne jen zobrozeni potrba pripojit!
kolo <- as.character(kolo); kolo
is.character(kolo)

#JAK MUZE OBJEKT VYPADAT
#Skalar
  #objekt o jedne hodnote
sk1 <- 5; sk1
sk2 <- "giraffe"; sk2
sk1_2 <- 5 / 6; sk1_2
sk2_2 <- "2"; sk2_2 #i cisla mohou byt ulozena jako charakter
#Vektor
  #objekt s x skalary jdoucimi za sebou
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
m_2 <- seq(from = 2, to = 50, length.out = 6)
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
#list slozeny z objektu stejne delky
df_1 <- rep(c("kolo", "auto"), length.out = 6)
df <- data.frame(m_1, m_2, df_1); df
class(df)
#Faktor
#datove objekty ktere zaznamenavaji kategorialni data
  #dny v tydnu, mesice v roce, barva oci, etc
#hodi se pri zpracovavani tabulek, kde data ve sloupcich mohou mit pouze specificke hodnoty
faktor <- factor(c("East","West","South","North","West","East","North")); faktor
levels(faktor) #jake kategorie faktor ma

#SESTAVENI DATAFRAME A JEJICH UPRAVA
a <- c(0, 1, 2)
b <- c(2, 0, 1)
c <- c(1, 2, 0)

abc <- data.frame(a, b, c); abc
#data.frame vytvori tabulku z x polozek
  #bere po sloupcich

abc_c <- cbind(a, b, c); abc_c
#cbind spoji vektory jako sloupce - nejedna se o data frame!
class(abc_c) # je to matice
abc_cd <- cbind.data.frame(a, b, c); abc_cd
#ulozi jako data.frame, defakto zde totozne jako fce data.frame
class(abc_cd)

abc_rd <- rbind.data.frame(a, b, c); abc_rd
#rbind ulozi po radcich
colnames(abc_rd) <- c("1", "2", "3")
#colnames vytvori jmena sloupcu pro x
row.names(abc_rd) <- c("auto", "kolo", "bicykl")
#row.names vytvori jmena radku pro x

#JAK VYBRAT DATA AKA INDEXACE
#index vzdy numeric
i1 <- c(40:50); i1 #1D objekt - vektor
i1[3] #treti v poradi. co cislo to pocet dimenzi
i1[-1] #vsechny krome prvniho
i1[1:3] #od prvniho po treti
i1[c(2,5)] #druhy a paty - [2, 5] uz je na 2D objekty
i1[seq(to = 6, by = 2)] #vyber funkci
prvni3liche <- c(1, 3, 5)
i1[prvni3liche] #vyber obektem

#df = 2D objekt - dataframe
#proto ve vyberu musi byt definovane obe dimenze
df[,2] #vsechny radky, druhy sloupec
df[5,2] #paty radek, druhy sloupec

data[5,"Side"] #lze vybirat i pomoci jmen elementu
data["Side"] #vyber element s timto jmenem
data$Side # $ operator vybira hodnoty z x elementu
data_jmeno <- data["Side"]
data_element <- data$Side
identical(data_jmeno, data_element) #jak zjistit jestli jsou stejne? proc ne
class(data_jmeno) #"x"vybere specifikovanou cast dataframe, zustava jako dataframe
class(data_element) #$ vybere hodnoty z objektu
data[,2] #vyber hodnoty v druhem elementu
data[2] #vyber druhy element - list
data[[2]] #vyber druhy element a z nej vezmi jeho hodnoty

muzi <- data[data$Sex == "male",]; muzi
#vyber vsechny radky kde hodnota elementu Sex je presne male
# == je presne
zeny <- data[data$Sex != "male",]; zeny
#vyber vsechny radky kde hodnota elementu Sex neni male
# operator ! provadi negaci

#BALICKY
install.packages("readxl") #fce nainstaluje balicek x
install.packages("readr")
library(readxl) #fce library nacte balicek x
  #bez volani knihovny lze pouzit nazevbalicku::fce(podminky fce)
library(readr)

#JAK NAHRAT DATA DO GLOBALNIHO PROSTREDI
#balicky: readxl pro excel
  #kliknuti na soubor ve Files -> Import dataset
  #potreba kontroly, nemusi vzit vsechno!
#manualne: txt
data_txt <- read.table("uvod_data.txt", #nazev souboru
                       sep = "", #oddelovac sloupcu
                       header = TRUE, #prvni radek obsahuje nazvy sloupcu
                       dec = ".") #desetinne hodnoty oddelovany pomoci
data_csv <- read.csv("uvod_data.csv", sep = ";", header = TRUE)
  #nahrano manualne ale balicek readr umi i pres Import
data_xsls <- read_xlsx("uvod_data.xlsx", col_names = TRUE, sheet = 1, na = "NA")
#vzdy se primarne ulozi jako dataframe

#KONTROLA A UPRAVA DATA FRAME
head(data_txt, 10) #vypise v konzoly ukazku dat, bez cisla prvnich pet
dim(data_txt) #dimenze data frame
dimnames(data_txt) #nazvy sloupcu a radku
names(data_txt) #nazvy elementu
str(data_txt) #struktura data frame
#nejdriv je data potreba prekontrolovat nez se s nimi bude pracovat

data_txt$Sex <- as.factor(data_txt$Sex)
  #fce prevede variable data_txt$Sex na typ dat faktor
  #dochazi k premene/prevyjadreni pouze casti objektu, zbytek zustava stejny
data_txt[c("Side","Sex")] <- lapply(data_txt[c("Side","Sex")], as.factor)
  #prevede vice variables na faktory
  #fce lapply - na vsechny elementy v x aplikuj funkci y

levels(data_txt$Sex) #jake jsou levely (typy) faktoru
levels(data_txt$Side)

levels(data_txt$Sex)[levels(data_txt$Sex) == "zena"] <- "female"
  #prepise vsechny hodnoty presne "zena" na "female" v elementu Sex
levels(data_txt$Sex)[levels(data_txt$Sex) == "muz"] <- "male"
levels(data_txt$Side)[levels(data_txt$Side) == "dy"] <- "dx"
levels(data_txt$Side)[levels(data_txt$Side) %in% c("si", "sni")] <- "sin"
  #prepise vsechny hodnoty v data_txt$Side ktere jsou obsazeny ve vektoru c("si", "sni") na "sin"
  #%in% obsahuje, je v,
  #lze pouzit k vybrani dat nebo k overeni TRUE/FALSE
    #x co je v y
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

#JAK ULOZIT TO S CIM PRACUJEME
#skript
#jednoduche ctrl+s

#nahrane objekty
save(kolo, auto, file = "dopravni_prostredky.RData")
  #ulozi objekty kolo a auto do souboru dopravni_prostredky.RData ze ktereho je mozne je pozdeji nacist
rm(kolo) #odstraneni si objektu abychom si je mohli vyzkouset nahrat
rm(auto)
load(file = "dopravni_prostredky.RData")
  #nahrani objektu ulozenych v souboru dopravni_prostredky.RData do globalniho prostredi