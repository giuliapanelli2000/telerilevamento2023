
library(raster)                    #raster porta dentro R solo singoli strati, brick invece tira dentro dati con diversi livelli
setwd("C:/Telerilevamento_lab")    #setting working directory
getwd()
so <- brick("Solar_Orbiter.jpg")  # importare immagine della solar_orbiter(so)
plotRGB(so, 1,2,3, stretch="Lin")  #3 livelli energetici dal colore piu scuro a quello più chiaro
plotRGB(so, 1,2,3, stretch="Hist")   #plottaggio a istogramma

#Dobbiamo (per utilizzare la funzione di classificazione) : 
1. prendere tutti i singoli valori 
singlenr <- getValues(so) 
2. classificare
kcluster <- kmeans(singlenr, centers = 3)  
3. Set values to a raster on the basis of so
soclass <- setValues(so[[1]], kcluster$cluster)  #restituisce i valori ottenuti in formato immagine abbinando a ogni singola classe dei colori (setvalues passa dei dati continui in formato immagine)
#per unire due pezzi si usa il $ 
cl <- colorRampPalette(c('yellow','black','red'))(100)   #giallo è la classe numero 1 -> valore energetico più alto  (sono il 21%), rosso invece classe energetica intermedia (41%), nero valore più basso  (37%)
plot(soclass, col=cl) 
#quant'è la percentuale di pixel a bassa o alta energia? 
frequencies <- freq(soclass)
frequencies   #frequenze delle 3 classi
tot = 2221440
percentages = frequencies * 100 /  tot    
percentages #per vedere il risultato


# Gran Canyon
library(raster)
setwd("C:/Telerilevamento_lab")
gc <- brick("dolansprings_oli_2013088_canyon_lrg.jpg")
gc
plotRGB(gc, 1,2,3, stretch="Lin"
#Ora ritaglieremo l'immagine (peserà meno), disegneremo un rettangolo nell'immagine per ritagliarlo (utilizzeremo crop)
gcc <- crop(gc, drawExtent())
plotRGB(gcc, 1,2,3, stretch="Lin")   #Immagine ritagliata
ncell(gcc) #numero di pixel dell'immagine ritagliata
classificare: 
#tirare fuori i valori dei pixel (catturare i valori dei pixel dell'immagine ritagliata):
1.
        singlenr <- getValues(gcc)
singlenr
2. classificazione -> associa ad ogni pixel incognito una classe (scegliamo 3 classi)
kcluster <- kmeans(singlenr, centers=3)  
kcluster
3. 
gcclass <- setValues(gcc[[1]], kcluster$cluster) # i valori vengono associati ad una immagine. il simblo del dollaro unise due funzioni
plot(gcclass)   #plot51
#classe 1: rocce vulcaniche
#classe 2: arenarie
#classe 3: conglomerati
#calcolo frequenze di queste classi: numero di pixel per ogni classe
frequencies <- freq(gcclass)
frequencies
#estraiamo il totale
total=ncell (gcclass)
total
percentages = frequencies * 100 /  total    
percentages #per vedere il risultato
