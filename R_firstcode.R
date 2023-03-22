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
# per cambiare i colori, abbiamo tre colori di base e le diverse sfumature
# abbinare il cambio di colori alle carte, assieme alle 100 sfumature diverse
plot (l2011)

#tracciare un elemento
plot (l2011 [[4]], col= cl )
plot (l2011 $ b4_sre, col=cl) #il dollaro lega dei pezzi fra loro
nir <- l2011 [[4]] #oppure nir <- l2011$B4_sre
plot (nir, col = cl)

