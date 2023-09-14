# Good morning! I'm Giulia and this is my Rproject for the exam of Telerilevamento Geo_Ecologico 2023.  
# The immages is from Copernicus, sentinel 2
# Firt of all I need setting my working directory

# Immage from 2022

library(raster)
library (ggplot2)

setwd("C:/Telerilevamento_lab")

setwd

# Now, I assign a name to immage uploading by the fuction 'brick'.
# Brick is a fuction used for upload immage in R

Hy22 <- brick ("hymalaia_2022_.jpg")
Hy22

# Hy stay for Hymalaia, immage 2022

plotRGB(Hy22, 1, 2, 3, stretch="Lin")
# Make Red-Green_Blue plot. Use a stretch lineare 

# I want to classify the immage in three class of three different type of rock
# First I get all sigle value in the immage

singlenr1 <- getValues(Hy22)
singlenr1

View(singlenr1) # to see the single values divide in three columns

# Now, I need to classify. The fuction used to divide the pixel in different class based on the mean of the value, in three class

kcluster1 <- kmeans(singlenr1, centers = 2)
kcluster1

Hy22class <- setValues(Hy22[[1]], kcluster1$cluster)
Hy22class
# to assign new values to a raster object

#I decide the three color used to identify the two class
cl <- colorRampPalette(c('grey','yellow','blue'))(100)
plot(Hy22class, col=cl)

# class 1 : substrate-grey
# class 2 : glacier-blue

# Now i need to estimate the frequencies of the different class. To do this, I need the total number of the cell in che immage
frequencies1 <- freq(Hy22class)
frequencies1

total1 = ncell (Hy22class)
total1

# total number of pixel of the immage (I need the total number to do the percentages of the three different class)
percentages1= frequencies1 * 100 / total1
percentages1

# percent_substrate22: 20%
# percent_glacier22: 80%

dev.off()
# to close all plot before

# immage 2023

# setting Working directory and going on in the same way I did before for the immage 2022

library(raster)

library (ggplot2)

setwd("C:/Telerilevamento_lab")

setwd

Hy23 <- brick ("hymalaia_2023_.jpg")
Hy23

plotRGB(Hy23, 1, 2, 3, stretch="Lin")

singlenr2 <- getValues(Hy23)
singlenr2

View(singlenr2)

kcluster2 <- kmeans(singlenr2, centers = 2)

kcluster2


Hy23class <- setValues(Hy23[[1]], kcluster2$cluster) # to assign new values to a raster object

Hy23class

cl <- colorRampPalette(c('grey','yellow','blue'))(100)

plot(Hy23class, col=cl)

# class 1 : substrate
# class 2 : glacier

frequencies2 <- freq(Hy23class)
frequencies2


total2 = ncell (Hy23class)
total2

percentages2= frequencies2 * 100 / total2
percentages2

#percent_glacier23: 60%
#percent_substrate23: 40%

# Build graphs for comparison between 2022 and 2023

cover <- c("glacier", "substrate")
percent_2022 <- c(60, 40)
percent_2023 <- c(80, 20)

percentages <- data.frame (cover, percent_2022, percent_2023)
percentages

# Let's plot the graphs

ggplot (percentages, aes (x=cover, y=percent_2022, color=cover)) + geom_bar (stat="identity", fill= "beige") + labs(title = "Hymalaia_2022")

ggplot (percentages, aes (x=cover, y=percent_2023, color=cover)) + geom_bar (stat="identity", fill= "beige")+ labs(title= "Hymalaia_2023")

p1 <- ggplot (percentages, aes (x=cover, y=percent_2022, color=cover)) + geom_bar (stat="identity", fill= "beige") + labs(title= "Hymalaia_2022")

p2 <- ggplot (percentages, aes (x=cover, y=percent_2023, color=cover)) + geom_bar (stat="identity", fill= "beige") + labs(title= "Hymalaia_2023")


# The graphs show an increase in ice cover of 20% from 2022 to 2023.


