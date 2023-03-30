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

l2006 <- brick("defor2_.png")
l2006
plotRGB(l2006, 1,2,3, stretch="lin")

# Esercizio: plotto 1992 sopra 2006
par(mfrow=c(2,1))
plotRGB(l1992, 1,2,3, stretch="lin")
plotRGB(l2006, 1,2,3, stretch="lin")
dev.off()
dvi2006 <- l2006[[1]]-l2006[[2]]
plot(dvi2006, col=cl)

# ANALISI MULTITEMPORALE
difdvi = dvi1992 - dvi2006
cld <- colorRampPalette(c('blue','white','red'))(100) # per daltonici
plot(difdvi, col=cld)

# NDVI 1992
ndvi1992 = dvi1992 / (l1992[[1]]+l1992[[2]])
plot(ndvi1992, col=cl)

# NDVI 2006
ndvi2006 = dvi2006 / (l2006[[1]]+l2006[[2]])
plot(ndvi2006, col=cl)

difndvi = ndvi1992 - ndvi2006
plot(difndvi, col=cld)

