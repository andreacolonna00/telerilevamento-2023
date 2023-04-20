library(raster)
# install.packages("RStoolbox")
# library(RStoolbox)

setwd("C:/lab/") # Linux
# setwd("C:/lab/") # Windows
# setwd("/Users/name/Desktop/lab/") # Mac

# data import
so <- brick("Solar_Orbiter_s_first_views_of_the_Sun_pillars.jpg")

plotRGB(so, 1, 2, 3, stretch="lin")
plotRGB(so, 1, 2, 3, stretch="hist")

# Classifying the solar data

# https://rspatial.org/raster/rs/4-unsupclassification.html

# 1. Get all the single values
singlenr <- getValues(so)
singlenr
#
# set.seed(99)

# 2. Classify
kcluster <- kmeans(singlenr, centers = 3)
kcluster

# 3. Set values to a raster on the basis of so
soclass <- setValues(so[[1]], kcluster$cluster) # assign new values to a raster object

cl <- colorRampPalette(c('yellow','black','red'))(100)
plot(soclass, col=cl)

# set.seed can be used for repeating the experiment in the same manner for N times
# http://rfunction.com/archives/62

####

# day 2 Grand Canyon

gc <- brick("dolansprings_oli_2013088_canyon_lrg.jpg")
gc

# rosso = 1
# verde = 2
# blu = 3

plotRGB(gc, r=1, g=2, b=3, stretch="lin")


# change the stretch to histogram stretching
plotRGB(gc, r=1, g=2, b=3, stretch="hist")

gcc <- crop(gc, drawExtent()) # the image is quite big
plotRGB(gcc, r=1, g=2, b=3, stretch="lin")

ncell(gcc) # tells the number of pixels

# classification

# 1. Get values
singlenr <- getValues(gcc)
singlenr

# 2. Classify
kcluster <- kmeans(singlenr, centers = 3)
kcluster

# 3. Set values
gcclass <- setValues(gcc[[1]], kcluster$cluster) # assign new values to a raster object
gcclass
plot(gcclass)

# Class 1: sandstone
# Class 2: volcanic rocks
# Class 3: conglomerates

cl <- colorRampPalette(c('yellow','black','red'))(100)
plot(gcclass, col=cl)

frequencies <- freq(gcclass)
total <- ncell(gcc)
percentages = frequencies * 100 /  tot

# Exercise: classify the map with 4 classes



