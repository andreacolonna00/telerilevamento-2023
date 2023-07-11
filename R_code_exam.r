# Analysis of satellite data from Sentinel to observe the effects of floods in the Emilia-Romagna region (Italy), may 2023

library(raster)
library(ggplot2)
library(viridis)
library(patchwork)

setwd("C:/lab/sentinel/")

# importing bands from Sentinel image

s2_april <- raster("23_April_2023.jp2")
s2_april_nir <- raster("23_April_2023_nir.jp2")
s2_april_red <- raster("23_April_2023_red.jp2")
s2_april_green <- raster("23_April_2023_green.jp2")
s2_april_blue <- raster("23_April_2023_blue.jp2")

s2_may <- raster("23_May_2023.jp2")
s2_may_nir <- raster("23_May_2023_nir.jp2")
s2_may_red <- raster("23_May_2023_red.jp2")
s2_may_green <- raster("23_May_2023_green.jp2")
s2_may_blue <- raster("23_May_2023_blue.jp2")

# creating a list of files
rlist_april <- list.files(pattern="23_April_2023_")
rlist_april

raster_april <- lapply(rlist_april,raster) # applying raster function to files in the list
raster_april

stack_april <- stack(raster_april) # stacking raster files
stack_april

#plotRGB(stack_april, 3,2,1, stretch="Lin", col=cl) # creating image with nir (3), green (2) and blue (1) bands
#plotRGB(stack_april, 4,2,1, stretch="Lin", col=cl) # creating image with red (4), green (2) and blue (1) bands

rlist_may <- list.files(pattern="23_May_2023_") # doing the same for may
rlist_may

raster_may <- lapply(rlist_may,raster)
raster_may

stack_may <- stack(raster_may)
stack_may

#plotRGB(stack_may, 3,2,1, stretch="Lin")
#plotRGB(stack_may, 4,2,1, stretch="Lin")


par(mfrow=c(1,2)) # Comparing RGB images
plotRGB(stack_april, 4,2,1, stretch="Lin", col=cl)
plotRGB(stack_may, 4,2,1, stretch="Lin", col=cl)

dev.off()
par(mfrow=c(1,2)) # Comparing infrared images
plotRGB(stack_april, 3,2,1, stretch="Lin", col=cl)
plotRGB(stack_may, 3,2,1, stretch="Lin", col=cl)

ext <- c (730000,740000,4930000,4940000)

par(mfrow=c(2,1)) # plotting cropped nir images 
plotRGB(stack_april, 3,2,1, stretch="Lin", ext= ext)
plotRGB(stack_may, 3,2,1, stretch="Lin", ext= ext)

s2_april_crop <- crop (s2_april, ext) # cropping files
s2_april_nir_crop <- crop (s2_april_nir, ext) 
s2_april_green_crop <- crop (s2_april_green, ext)
s2_april_red_crop <- crop (s2_april_red, ext)

s2_may_crop <- crop (s2_may, ext)
s2_may_nir_crop <- crop (s2_may_nir, ext)
s2_may_green_crop <- crop (s2_may_green, ext)
s2_may_red_crop <- crop (s2_may_red, ext)

cl <- colorRampPalette(c('darkred','bisque2','blue','green'))(100) # specifying a color scheme

dev.off()

dvi_april = (s2_april_nir_crop - s2_april_red_crop) # dvi (difference vegetation index)
dvi_may = (s2_may_nir_crop - s2_may_red_crop)
ndvi_april = (s2_april_nir_crop - s2_april_red_crop) / (s2_april_nir_crop + s2_april_red_crop) # ndvi (normalized difference vegetation index)
ndvi_may = (s2_may_nir_crop - s2_may_red_crop) / (s2_may_nir_crop + s2_may_red_crop)

par(mfrow=c(2,2)) # plotting ndvi from April and May
plot(dvi_april, col=cl, main = "dvi Aprile")
plot(dvi_may, col=cl, main = "dvi Maggio")
plot(ndvi_april, col=cl, main = "ndvi Aprile")
plot(ndvi_may, col=cl, main = "ndvi Maggio")

dev.off()

dwi_april = (s2_april_green_crop - s2_april_nir_crop) # dwi (difference water index)
dwi_may = (s2_may_green_crop - s2_may_nir_crop)
ndwi_april = (s2_april_green_crop - s2_april_nir_crop) / (s2_april_green_crop + s2_april_nir_crop) # ndwi (normalized difference water index)
ndwi_may = (s2_may_green_crop - s2_may_nir_crop) / (s2_may_green_crop + s2_may_nir_crop)

par(mfrow=c(2,2)) # plotting ndwi from April and May
plot(dwi_april, col=cl, main = "dwi Aprile")
plot(dwi_may, col=cl, main = "dwi Maggio")
plot(ndwi_april, col=cl, main = "ndwi Aprile")
plot(ndwi_may, col=cl, main = "ndwi Maggio")

dev.off()
par(mfrow=c(2,2)) # plotting dwi and ndwi from April and May
plot(ndvi_april, col=cl)
plot(ndvi_may, col=cl)
plot(ndwi_april, col=cl)
plot(ndwi_may, col=cl)

dev.off()
par(mfrow=c(1,2)) # comparing infrared image with ndwi
plotRGB(stack_may, 3,2,1, stretch="Lin", ext= ext)
plot(ndwi_may, col=cl)


# plotting with ggplot
s2_may_nir_cropd <- as.data.frame(s2_may_nir_crop, xy=T)
p1 <- ggplot() +
geom_raster(s2_may_nir_cropd, mapping =aes(x=x, y=y, fill=X23_May_2023_nir)) +
scale_fill_viridis(option = "magma") +
ggtitle("Maggio 2023 Infrarosso")

ndwi_mayd<- as.data.frame(ndwi_may, xy=T)
p2 <- ggplot() +
geom_raster(ndwi_mayd, mapping =aes(x=x, y=y, fill=layer)) +
scale_fill_viridis(option = "plasma") +
ggtitle("Maggio 2023 NDWI")

p1 + p2




