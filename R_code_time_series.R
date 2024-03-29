# Time series analysis
# Greenland increase of temperature
# Data and code from Emanuela Cosma

install.packages("raster")
install.packages("rasterVis")
library(raster)
library(rasterVis)
#library(rgdal)
setwd("C:/Telerilevamento_lab/greenland")

lst_2000 <- raster("lst_2000.tif")
plot (lst_2000)
lst_2005 <- raster("lst_2005.tif")
plot (lst_2005)

lst_2010 <- raster("lst_2010.tif")
plot (lst_2010)
lst_2015 <- raster("lst_2015.tif")
plot (lst_2015)

par (mfrow=c(2,2)) #par unisce in una unica schermata i diversi plot
plot (lst_2000)
plot (lst_2005)
plot (lst_2010)
plot (lst_2015)

lst() #serve a vedere la lista di tutti gli oggetti per vedere se sono stati caricati
#per caricare tutti i file più velocemente: "lapply" permette di applicare una funzone qualsiasi a una intera lista di dati

# list f files. list.files(pattern) #pattern è un pezzo di nome comune a tutte le immagini che vogliamo caricare, list.files serve a caricare la lista
rlist <- list.files(pattern="lst")
rlist

#lapply(nome della lista, funzione che vogliamo applicare)
import <- lapply(rlist, raster)   #lapply applica alla lista di file la funzione raster
import

#utilizza la funzione che si chiamma stack per creare una immagine con tutte e quattro gli oggetti
stack(import)    #invece di importare i singoli file, faccio una lista di file dentro la cartella, importo tutto insieme e faccio lo stack
TGr <- stack(import)
TGr
plot(TGr)

plotRGB(TGr, r=1, g=2, b=3, strecht="Lin") #in rosso le temperture del 2000, in verde del 2005 e in blu del 2010
#Per vedere dove di preciso è aumentata la temperatura dal 2000 al 2005:
dift = TGr[[2]] - TGr[[1]]
plot(dift)  

cl <- colorRampPalette(c("blue","light blue","pink","red"))(100) #cambio la scala di colore alle quattro immagini degli anni diversi per notare meglio lo scioglimento dei ghiacciai
plot(TGr, col=cl)

13/04
# es.2: eurpean NO2

install.packages("raster")
install.packages("rasterVis")
library(raster)
library(rasterVis)
#library(rgdal)
setwd("C:/Telerilevamento_lab/En")
#analisi nutitemporale della varaizone dei dati (di ossidi di azoto) en nel tempo. 
getwd()# per controlllare se è salvato

#importing a file 
# per importare i file all'interno da R si una la funziona brick (quando ho un ummagine satellitare a più strati)
#si usa raster per importare una sola immagine

en_first <- raster ("EN_0001.png")
en_first
# creiamo palette d colori 
cl <- colorRampPalette(c("red","orange","yellow"))(100)
plot(en_first, col=cl)
#facciamo una serie di file con il patter EN, abbiamo una lista per applicare il raster e creiamo uno stack 
#lapplay applica una funzione ad una lista
lst()
rlist <- list.files(pattern="EN")
rlist

import <- lapply(rlist, raster)   #lapply applica alla lista di file la funzione raster
import
stack(import)    #invece di importare i singoli file, faccio una lista di file dentro la cartella, importo tutto insieme e faccio lo stack
EN <- stack(import)
EN
plot(EN)

plot (EN, col=cl)
 #per accostare immagni
par (mfrow=c(1,2))
plot (en_first,col=cl) 
#l'immagine che abbiamo importato per prima deve essere uguale all'altra seno risuta sbagliato
plot (EN[[1]], col=cl)

#controllo 
difcheck <- en_first - EN[[1]]
difcheck
plot(difcheck)

#primo e ultimo dato
par (mfrow=c(1,2))
plot (en_first,col=cl)
plot (EN[[13]], col=cl)

#differenza dati per vedere diminuzione maggiore
difen <- EN [[1]]-EN[[13]]
difen
cldif <- colorRampPalette(c('blue', 'white','red')) (100)
plot (difen, col=cldif)

plotRGB(EN, r=1, g=7, Bb=13, stretch='Lin')# prende i valori originale e apprilìca una funzione lienare per cambiare il range
