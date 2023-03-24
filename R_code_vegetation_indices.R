# Calcolo degli indici spettrali

library(raster)
setwd("C:/lab/")

# Esercizio: import defor1_.png
l1992 <- brick("defor1_.png")
l1992 # molti meno pixel, più leggera

# Plottare con plotRGB
plotRGB(l1992, 3,2,1, stretch="lin")

# qual'è NIR?
plotRGB(l1992, 1,2,3, stretch="lin")
# è diventato tutto rosso, NIR è la banda 1
# plotRGB(l1992, r=4, g=3, b=2, stretch="lin") è stata montata così
# NIR=1
# RED=2
# GREEN=3

# Esercizio: calcolo DVI per 1992
dvi1992 <- l1992[[1]]-l1992[[2]]
cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100)
plot(dvi1992, col=cl) # nelle zone rosse il DVI è alto


