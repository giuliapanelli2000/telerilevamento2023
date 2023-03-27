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

#esercizio: calcola DVI per 1992
# band infrarosso meno la banda del rosso
# il nir è l'infrarosso 

# faremo un calcolo per ogni pixell una differenza

dvil1992 = l1992[[1]]- l1992 [[2]]
dvil1992
#palette di colore

cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100) # specifying a color scheme

plot (dvil1992, col=cl)
