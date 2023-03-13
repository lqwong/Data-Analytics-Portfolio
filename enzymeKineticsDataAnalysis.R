#Installing tidyverse package which contains readxl
install.packages("tidyverse")

#Loading the library
library(tidyverse)
library(readxl)

#Loading the data
enzyme <- read_excel("~/Enzymology Data/Enzymology.xlsx")
View(enzyme)

#Graphing the temperature and rate data
stripchart(Rate~Temperature,
           data=enzyme,
           vertical = TRUE,
           method = "jitter",
           pch = 1,
           ylim = c(0,3.5),
           xlab = "Temperature (Celcius)")

#Statistically testing the differences
enzyme$Temperature <- as.factor(enzyme$Temperature)
test <- aov(Rate~Temperature, data=enzyme)
summary(test) #Since our p-value of 3.13e-11 is less than 0.05, we can conclude that our data is statistically significant
TukeyHSD(test) #Tukey test allowed us to conclude that following temperatures groups were not significantly different due to a p-value of greater than 0.05: 20-30, 37-40-50, 60-70

#Graphing plot showcasing statistical differences
stripchart(Rate~Temperature,
           data=enzyme,
           vertical = TRUE,
           method = "jitter",
           pch = 1,
           ylim = c(0,3.5))
segments(x0 = .9, y0 = 0.25, x1 = 2.0, y1 = 0.25, lwd=3) #Depicts no significant difference in 20-30 temperature group
segments(x0 = 2.8, y0 = 0.25, x1 = 5.2, y1 = 0.25, lwd=3) #Depicts no significant difference in 37-40-50 temperature group
segments(x0 = 5.8, y0 = 0.25, x1 = 7.2, y1 = 0.25, lwd=3) #Depicts no significant difference in 60-70 temperature group



