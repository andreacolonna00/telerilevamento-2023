# My first code in Git Hub
# Let's install the raster package

install.packages("raster")

library(raster)

# import dei dati, setto la cartella di lavoro

setwd("C:/lab/") # windows
# studiamo cosa avviene nella riserva di Paracana
# path 224, row 63 (posizione)

l2011 <- brick("p224r63_2011_masked.grd")

# plotto i dati
plot(l2011)

cl <- colorRampPalette(c("red","orange","yellow")) (100) # 100 sono le sfumature
plot(l2011[[4]], col=cl) # banda infrarosso
