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

# Exercise: nuova colorRampPalette
cl1 <- colorRampPalette(c("chartreuse","aquamarine","blue")) (100)
plot(l2011, col=cl1)

# Exercise 2: plotto solo una banda
plot(l2011[[4]], col=cl1)
# plot(l2011$b4_sre, col=cl1) altro modo per scriverlo

# Esporto grafico e lo metto nella cartella lab
pdf("primoGrafico.pdf")
plot(l2011$B4_sre, col=cl1)
dev.off()  #dentro il pdf ci metto il grafico che voglio e con dev.off chiudo la finestra

par(mfrow=c(2,1))


plot(l2011[[3]], col=cl1)
plot(l2011[[4]], col=cl1) # metto un grafico in ogni spazietto

# Plotto 4 bande con i colori corrispondenti
par(mfrow=c(2,2))

#blue
clb <- colorRampPalette(c("blue4","blue2","light blue")) (100)
plot(l2011[[1]], col=clb)

#green
clg <- colorRampPalette(c("chartreuse4","chartreuse2","chartreuse")) (100)
plot(l2011[[2]], col=clg)

#red
clr <- colorRampPalette(c("brown4","brown3","brown1")) (100)
plot(l2011[[3]], col=clr)

#infrarosso
cli <- colorRampPalette(c("darkorchid4","darkorchid2","darkorchid1")) (100)
plot(l2011[[4]], col=cli)
dev.off()

# Plot of l2011 in the NIR channel (NIR band)
plot(l2011$B4_sre, col=cli)
# or:
plot(l2011[[4]])

# Landsat ETM+
# b1 = blu
# b2 = verde
# b3 = rosso
# b4 = infrarosso vicino NIR

# plot RGB layers
plotRGB(l2011, r=3, g=2, b=1, stretch="lin")
plotRGB(l2011, r=3, g=4, b=2, stretch="lin")
plotRGB(l2011, r=3, g=2, b=4, stretch="lin")

plotRGB(l2011, r=3, g=4, b=2, stretch="hist")

# Exercise: build a multiframe with visible RGB
# (linear stretch) on top of false colours
# (histogram stretch)
par(mfrow=c(2,1))
plotRGB(l2011, r=3, g=2, b=1, stretch="lin")
plotRGB(l2011, r=3, g=4, b=2, stretch="hist")

# Exercise: upload the image from 1988
l1988 <- brick("p224r63_1988_masked.grd")
plot(l1988)

par(mfrow=c(2,1))
plotRGB(l1988, r=4, g=3, b=2, stretch="lin")
plotRGB(l2011, r=4, g=3, b=2, stretch="lin")
dev.off()

par(mfrow=c(2,2))
plotRGB(l1988, r=4, g=3, b=2, stretch="lin")
plotRGB(l2011, r=4, g=3, b=2, stretch="lin")
plotRGB(l1988, r=4, g=3, b=2, stretch="hist")
plotRGB(l2011, r=4, g=3, b=2, stretch="hist")

