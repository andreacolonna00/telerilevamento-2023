# Codice R per importare e analizzare molte immagini

library (raster)
setwd("C:/lab/greenland/")

lst2000 <- raster("lst_2000.tif")

# Esercizio: importo tutti i dati
lst2005 <- raster("lst_2005.tif")
lst2010 <- raster("lst_2010.tif")
lst2015 <- raster("lst_2015.tif")

ls()

rlist <- list.files(pattern="lst")
rlist

import <- lapply(rlist, raster)
