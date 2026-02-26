#data() to check all built in data sets

?airquality
class(airquality)
hist(airquality$Temp)


hist(airquality$Temp,
     main="temp distribution of airquality datasets",
     xlab="temp distribution",
     ylab="Frequency",
     labels=TRUE,
     col = "yellow",
     border = "darkgreen")




ggplot(
  airquality,
  aes(x=Temp)
)+
  geom_histogram(bins=25,
                 fill="steelblue",col="white")+
  labs(title="GGPLOT-Histogram",
       x="temp distribution",
       y="Frequency")+
  theme_light()

#install.packages("ggplot2")