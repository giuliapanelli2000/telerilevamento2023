# My first code in Git Hub
# Let's install the raster package
install.packages ("raster")
# per controllare se si sono installati <- library 
library (raster)
#install.packages( "raster" )
library(raster)
#importa i dati, impostando la directory di lavoro
#setwd ("C:/lab/")#windows

library(raster)
setwd ("C:/Telerilevamento_lab")
getwd ()

l2011 <- brick("p224r63_2011_masked.grd")
plot (l2011)
cl <- colorRampPalette (c("red", "orange", "yellow")) (100) 
# serve per modificare i colori, si parte da  tre colori di base e si hanno poi le diverse sfumature
# si abbina il cambio di colori alle carte, assieme alle 100 sfumature diverse
plot (l2011)

#tracciare un elemento
plot (l2011 [[4]], col= cl )
plot (l2011 $ b4_sre, col=cl) #il dollaro lega dei pezzi fra loro
nir <- l2011 [[4]] #oppure nir <- l2011$B4_sre
plot (nir, col = cl)

# giorno 16/03/23
cl <- colorRampPalette(c("darkorchid","cyan","bisque","darkmagenta","cyan4")) (200)    # 5 colori diversi e mettendo 200 sfumature attribuite a cl
plot(l2011, col=cl)                                                                    #Plot02

#exercise plot the NIR band
#b1=blue
#b2=green
#b3=red
#b4=NIR

# Doppia parentesi quadra, plotto solo l'immagine dell'infrarosso vicino
plot(l2011[[4]], col=cl)
plot(l2011$B4_sre, col=cl)        #fa la stessa cosa del plot precedente

#Export graphs da R alla cartella lab salvata e creata a inizio corso tramite (Plot03):
pdf("myfirstgraph.pdf")           #png fa la stessa cosa -> cambia solo il format
plot(l2011$B4_sre, col=cl)        #si salva nella cartella lab il plot che si scriverà
dev.off()                         #per chiudere il tutto 

#PROVA:
pdf("ciao.pdf")
plot(l2011$B4_sre, col=cl)
dev.off()                         #ottengo un file pdf che si chiama ciao

#plotto banda del rosso e infrarosso (MULTIFRAME -> mf), row -> numero di righe, utilizzo una sola colonna.
#La funzione per fare questo si chiama "par"
#Otterrò 2 righe e una colonna
#Plotting several bands in a multiframe

par(mfrow=c(2,1))                 #Plot04
plot(l2011[[3]], col=cl)
plot(l2011[[4]], col =cl)

#Invece di fare un plot con le due bande, lo facciamo con tutte e 4 (sarà quindi: 2,2) le bande, faremo quindi un nuovo multiframe:
par(mfrow=c(2,2)) #Per fare uscire tutte e 4 i plot assieme

#Plottiamo il blu (plot05)
clb <- colorRampPalette(c("blue","lightblue","blue4","blue2")) (100)
plot(l2011[[1]], col=clb)

#plottiamo il verde (plot06)
clg <- colorRampPalette(c("chartreuse","chartreuse1","chartreuse2","chartreuse3")) (100)
plot(l2011[[2]], col=clg)

#plottiamo il rosso 
clr <- colorRampPalette(c("brown1","brown2","brown3","brown4")) (100)
plot(l2011[[3]], col=clr)

#plottiamo l'infrarosso
cln <- colorRampPalette(c("darkorchid","darkorchid1","darkorchid2","darkorchid3")) (100)
plot(l2011[[1]], col=cln)

#OTTERO' COME RISULTATO LE QUATTRO MAPPE PLOTTATE CON BASE CROMATICA A DIFFERENTI COLORI (INFRAROSSO,ROSSO,VERDE E BLU) (Plot08)


# giorno 17/03/23
# Componenti RGB (red,green,blue), come prima cosa caricheremo un pacchetto raster
library(raster)
setwd("C:/Telerilevamento_lab")
l2011 <- brick ("p224r63_2011_masked.grd")
#faremo una immagine a colori naturali, associamo ad ogni componente la banda corrispondente.
#RGB plotting, plottiamo un raster con le tre componenti di colore.
# ? per avere info su funzioni
#Alla componente 3 diamo la banda numero 3, alla verde la 2, alla blu la 1.
#strecht per allargare il più possibile la scala di colore lineare.
plotRGB(l2011, r=3, g=2, b=1, stretch="Lin") #plot09
#Ora evidenziamo la vegetazione (usiamo una delle bande che identifichi al meglio la vegetazione, useremo l'infrarosso (banda numero4) per evidenziare la vegetazione)
plotRGB(l2011, r=4, g=3, b=2, stretch="Lin") #plot10  #tutto quello che riflette molto nella banda numero 4 (infrarossso) diventerà rosso.
plotRGB(l2011, r=3, g=4, b=2, stretch="Lin") #plot11  #per mostrare l'infrarosso in verde  enon con il rosso
plotRGB(l2011, r=3, g=2, b=4, stretch="Lin")  #plot12 per mostrare l'infrarosso in blue

#Multiframe with natural and false colours per vedere i due plot confrontati.
par(mfrow=c(2,1))
plotRGB(l2011, r=3, g=2, b=1, stretch="Lin")
plotRGB(l2011, r=4, g=3, b=2, stretch="Lin")   #plot13

#Histogram stretching Hist al posto di lin
par(mfrow=c(2,1))
plotRGB(l2011, r=3, g=2, b=1, stretch="Hist")
plotRGB(l2011, r=4, g=3, b=2, stretch="Hist")  #plot14

#Lin vs Hist
par(mfrow=c(2,1))
plotRGB(l2011, r=4, g=3, b=2, stretch="Hist")
plotRGB(l2011, r=4, g=3, b=2, stretch="Lin")   #plot15

#giorno 23/03/2023
library(raster)
setwd ("C:/Telerilevamento_lab/p224r63_2011")
getwd ()

l2011 <- brick("p224r63_2011_masked.gri")
l2011

#esercizio nir per una banda
plot(l2011[[4]])

plotRGB(l2011, r=3, g=2, b=1, stretch="Lin") #stretch aumenta la gamma dei colori utilitizzabili

#usiamo bande colori diversi, bande che noi no vediamo, posso usare al massimo 3 bande

plotRGB(l2011, r=4, g=3, b=2, stretch="Lin") #abbiamo messo infrarosso 4 sul rosso     
#monto l'infrarosso su un'altra componente, cioè la banda numero 4
plotRGB(l2011, r=3, g=4, b=2, stretch="Lin")
#mettiamo sulla componente blu
plotRGB(l2011, r=3, g=2, b=4, stretch="Lin")
#si osservano zone agricole gialle

#esercizio : importa the 1988 image
library(raster)
setwd ("C:/Telerilevamento_lab")
getwd ()

l1988 <- brick("p224r63_1988_masked.gri")
l1988


#eserzio : plot in RGB space (natural colours)

plotRGB (l1988, r=3, g=2, b=1, stretch="Lin")

plotRGB (l1988, r=4, g=3, b=2, stretch="Lin")


plotRGB (l1988, 4, 3, 2, stretch="Lin")

#metodi per mettere grafici assiemeù
#multiframe
#uso due righe e una colonna, voglio sovrapporre immagini
par(mfrow=c(2,1))
plotRGB (l1988, 4, 3, 2, stretch="Lin")
plotRGB(l2011, 4, 3, 2, stretch="Lin")
dev.off() #chiudi le finetre aperte
 #variazioni tra le code e l'inizio . differenza tra valori medi ed estremi stretch="hist")
#differenza media e mediana: media (somma numero diviso N) mediana (mantengo il valore centrale per evitare che numero esterno mi cambi la media)

plotRGB(l2011, 4, 3, 2, stretch="hist")

# faccio due righe e due colonne, immagine 88 con strtch lienari, nel seconno 2011 con strtch lienare, nel terzo  nel quarto 88 e 2011 con strect hist
#con infrarosso sulla componente red

par(mfrow=c(2,2))
plotRGB (l1988, 4, 3, 2, stretch="Lin")
plotRGB(l2011, 4, 3, 2, stretch="Lin")
plotRGB(l1988, 4, 3, 2, stretch="hist")
plotRGB(l2011, 4, 3, 2, stretch="hist")

