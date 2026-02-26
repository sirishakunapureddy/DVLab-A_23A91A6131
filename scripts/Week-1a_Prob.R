#Week1-a
#VA Deaths
#To know about data in help panel
?VADeaths
class(VADeaths)
help(class)
va_df <- as.data.frame(VADeaths)
class(va_df)
#To view data as table
View(va_df)
#To create new column in data frame
va_df$AgeGroups <- row.names(VADeaths)
#Changing data into long format using reshape function
va_long=reshape(va_df,direction="long", 
                varying = colnames(VADeaths) ,
                v.names="DeathRate" ,
                timevar="Population" ,
                times=colnames(VADeaths))
va_long

hist(va_long$DeathRate)

help(hist)


hist(va_long$DeathRate,
     main="Basic Histogram of VA Deathrates",
     xlab="VA Deathrates",
     ylab="Frequency",
     labels=TRUE,
     col = "yellow",
     border = "darkgreen")


#Data
#Asthetics -->X,,Y axis to various variables
#Geometry
#Facets
#Statistics
#Coordinates
#Themes
#Labels


library(ggplot2)

ggplot(
  va_long,
  aes(x=DeathRate)
)+
  geom_histogram(fill="steelblue",col="white")+
  
  labs(title="GGPLOT-Histogram",
       x="Death Rate",
       y="Frequency")+
  #facet_wrap(~Population)
  theme_dark()
help(ggplot)
