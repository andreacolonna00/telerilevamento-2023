library(raster)

setwd("C:/lab/sentinel/")

s2_april_nir <- raster("23_April_2023_nir.jp2")
s2_april_red <- raster("23_April_2023_red.jp2")
s2_april_green <- raster("23_April_2023_green.jp2")
s2_april_blue <- raster("23_April_2023_blue.jp2")

s2_may_nir <- raster("23_May_2023_nir.jp2")
s2_may_red <- raster("23_May_2023_red.jp2")
s2_may_green <- raster("23_May_2023_green.jp2")
s2_may_blue <- raster("23_May_2023_blue.jp2")

rlist_april <- list.files(pattern="23_April_2023_")
rlist_april

raster_april <- lapply(rlist_april,raster)
raster_april

stack_april <- stack(raster_april)
stack_april

plotRGB(stack_april, 3,2,1, stretch="Lin", col=cl)

rlist_may <- list.files(pattern="23_May_2023_")
rlist_may

raster_may <- lapply(rlist_may,raster)
raster_may

stack_may <- stack(raster_may)
stack_may

plotRGB(stack_may, 3,2,1, stretch="Lin")

ext <- c (730000,740000,4930000,4940000)

par(mfrow=c(2,1))
plotRGB(stack_april, 3,2,1, stretch="Lin", ext= ext)
plotRGB(stack_may, 3,2,1, stretch="Lin", ext= ext)

s2_april_nir_crop <- crop (s2_april_nir, ext)
s2_april_green_crop <- crop (s2_april_green, ext)
s2_april_red_crop <- crop (s2_april_red, ext)

s2_may_nir_crop <- crop (s2_may_nir, ext)
s2_may_green_crop <- crop (s2_may_green, ext)
s2_may_red_crop <- crop (s2_may_red, ext)

cl <- colorRampPalette(c('darkred','bisque2','blue','green'))(100) # specifying a color scheme

par(mfrow=c(2,1))
plot(s2_april_crop, col=cl)
plot(s2_may_crop, col=cl)

dev.off()

dvi_april = (s2_april_nir_crop - s2_april_red_crop) 
ndvi_april = (s2_april_nir_crop - s2_april_red_crop) / (s2_april_nir_crop + s2_april_red_crop)

plot(ndvi_april, col=cl)

dvi_may = (s2_may_nir_crop - s2_may_red_crop)
ndvi_may = (s2_may_nir_crop - s2_may_red_crop) / (s2_may_nir_crop + s2_may_red_crop)
plot(ndvi_may, col=cl)

par(mfrow=c(2,2))
plot(dvi_april, col=cl)
plot(dvi_may, col=cl)
plot(ndvi_april, col=cl)
plot(ndvi_may, col=cl)

dev.off()
par(mfrow=c(2,1))
plotRGB(stack_may, 3,2,1, stretch="Lin", ext= ext)
plot(ndvi_may, col=cl)



dev.off()

dwi_april = (s2_april_green_crop - s2_april_nir_crop) 
ndwi_april = (s2_april_green_crop - s2_april_nir_crop) / (s2_april_green_crop + s2_april_nir_crop)

plot(ndwi_april, col=cl)

dwi_may = (s2_may_green_crop - s2_may_nir_crop)
ndwi_may = (s2_may_green_crop - s2_may_nir_crop) / (s2_may_green_crop + s2_may_nir_crop)
plot(ndwi_may, col=cl)

par(mfrow=c(2,2))
plot(dwi_april, col=cl)
plot(dwi_may, col=cl)
plot(ndwi_april, col=cl)
plot(ndwi_may, col=cl)

dev.off()
par(mfrow=c(2,1))
plotRGB(stack_may, 3,2,1, stretch="Lin", ext= ext)
plot(ndwi_may, col=cl)






