Mappe di land cover x il cambiamneto delle classi nel tempo
library(raster)
#install.packages("ggplot2")
library(ggplot2)
# install.packages("patchwork")
library(patchwork) # for multiframe ggplot plotting

library(ggplot2)  #per i grafici di ggplot
library(patchwork)

setwd("C:/Telerilevamento_lab")
#caricare le due immagini: defor1 e defor2
defor1 <- brick("defor1_.png") 
defor2 <- brick("defor2_.png")
par(mfrow=c(2,1))    #proiettiamo le immagini in due righe e una colonna   #plot52
plotRGB(defor1, 1,2,3, stretch="Lin")
plotRGB(defor2, 1,2,3, stretch="Lin")

classificazione 
1. prendere tutti i singoli valori di defor1
singlenr1 <- getValues(defor1)
singlenr1                #ora abbiamo una serie di dati da far studiare a kmeans
2. classificare
kcluster1 <- kmeans(singlenr1, centers = 2)  #lavoriamo con la classificazione kmeans e il numero di centri che usciamo sono due
kcluster1
#prendiamo tutti i valori che abbiamo generato delle classi e otteniamo una immagine, da soli pixel e valori ricaviamo una immagine
3. set values to a raster
defor1class <- setValues(defor1[[1]], kcluster1$cluster) 
plot(defor1class) 

#stesso processo per la seconda immagine
singlenr2 <- getValues(defor2)
singlenr2
kcluster2 <- kmeans(singlenr2, centers = 2)
kcluster
defor2class <- setValues(defor2[[2]], kcluster2$cluster)
plot(defor2class) 
par(mfrow=c(2,1))
plot(defor1class)
plot(defor2class)


# install.packages("patchwork")
install.packages("patchwork")
#lavoriamo sulle frequenze per poi fare dei plot con gli istogrami che mostrino le differenze
#quanta area occupano le due classi in percentuale?

frequencies1 <- freq(defor1class)
frequencies1
tot1 <- ncell(defor1class)  #per vedere da quanti pixel è composto
tot1
percentages1 = frequencies1 * 100 / tot1


#stessa cosa con defor2class
frequencies2 <- freq(defor2class)
frequencies2
tot2 <- ncell(defor2class)  #per vedere da quanti pixel è composto
tot2
percentages2 = frequencies2 * 100 / tot2


#costruire un data frame tabella
cover <- c("Forest","Bare soil")  #prima colonna che avrà due valori
percent_1992 <- c(89.746, 10.253)
percent_2006 <- c(52.069, 47.931)

percentages <- data.frame(cover, percent_1992, percent_2006)  #per creare la tabella
percentages

#Facciamo il plot
ggplot(percentages, aes(x=cover, y=percent1992, color=cover)) + geom_bar(stat="identity", fill="white")  #geom_bar crea istogrammi, fill è il colore di riempimento delle barre #plot55

ggplot(percentages, aes(x=cover, y=percent2006, color=cover)) + geom_bar(stat="identity", fill="white") 

p1 <- ggplot(percentages, aes(x=cover, y=percent1992, color=cover)) + geom_bar(stat="identity", fill="white")

p2 <- ggplot(percentages, aes(x=cover, y=percent2006, color=cover)) + geom_bar(stat="identity", fill="white")

p1+p2   

#per ottenere lo stesso risultato con però un range da 0 a 100 in termini quantitativi
p1 <- ggplot(percentages, aes(x=cover, y=percent1992, color=cover)) + geom_bar(stat="identity", fill="white") +
ylim(c(0,100))

p2 <- ggplot(percentages, aes(x=cover, y=percent2006, color=cover)) + geom_bar(stat="identity",
fill="white") +
ylim(c(0,100))

p1+p2   
