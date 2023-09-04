library (raster)
setwd ("C:/Telerilevamento_lab")
getwd ()

# devo predendere la working directory
#esercizio: import defor_1.png
#brick importaintero set di mande, è una funzione. l1992


l1992 <-brick("defor1_.png")
l1992

#exercise : plot the image via plotRGB

plotRGB(l1992, r=1, g=2, b=3, stretch="Lin")
# what is NIR?

# la veget è rosso, dove la banda riflette molto si ha l'infrarosso
# NIR=1
# red=2
#green=3

#le bande sono invertite

# l'acqua in infrarosso assorbe la luce? 
# calcolo indice di vegetazione

#esercizio: calcola DVI per 1992. DVI: different vegetation index
# band infrarosso meno la banda del rosso
# il nir è l'infrarosso 

# faremo un calcolo per ogni pixell una differenza

dvil1992 = l1992[[1]]- l1992 [[2]]
dvil1992
#palette di colore

cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100) # specifying a color scheme

plot (dvil1992, col=cl)

# eseguo lo stesso esercizio con Defor2

l2006 <- brick("defor2_.png")
l2006 

plotRGB(l2006, r=1, g=2, b=3, stretch="Lin")

dvil2006 = l2006[[1]]- l2006 [[2]]
dvil2006
cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100) # specifying a color scheme

plot (dvil2006, col=cl)

par(mfrow=c(2,1))     # carico le due immagini ottenute in precedenza  in una singola immagine a 2 righe e una colonna 
plotRGB(l1992, r=1, g=2, b=3, stretch="lin")
plotRGB(l2006, r=1, g=2, b=3, stretch="lin") 
#per metterle invece una accanto all'altra:
par(mfrow=c(1,2))     
plotRGB(l1992, r=1, g=2, b=3, stretch="lin")
plotRGB(l2006, r=1, g=2, b=3, stretch="lin") 

library(raster)
setwd("C:/Telerilevamento_lab")
getwd()
#analisi multitemporale, differenza tra due DVI (1992 vs 2006),se la differenza è alta indica maggiore distruzione in questo intervallo di tempo
difdvi = dvil1992 - dvil2006
cld <- colorRampPalette(c('blue','white','red')) (100)
plot(difdvi, col=cld) 
#Non si possono paragonare due immagini che hanno bit diversi, per sistemare il problema si normailzza il dvi -> NDVI (cioè normal dvi)
# NDVI 1992 normalizziamo sulla somma delle due bande (differenza diviso la somma), il numero di bit di una immagine è la risoluzione radiometrica,spettrale  e spaziale
ndvi1992 = dvil1992 / (l1992[[1]] + l1992[[2]])
plot(ndvi1992, col=cl)  
#calcoliamo il NDVI del 2006
ndvi2006 = dvil2006 / (l2006[[1]] + l2006[[2]])
plot(ndvi2006, col=cl)

#differenza tra i due ndvi
difndvi = ndvi1992 - ndvi2006
plot(difndvi, col=cld) 

# Multiframe with NDVI1992 on top of the NDVI2006 image
par(mfrow=c(2,1))
plot(ndvi1992, col=cl)
plot(ndvi2006, col=cl)

