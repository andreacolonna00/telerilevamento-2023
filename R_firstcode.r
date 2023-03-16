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
