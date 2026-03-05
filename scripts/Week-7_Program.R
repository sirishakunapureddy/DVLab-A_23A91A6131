#Load and Understand the HairEyeColor Dataset
#Load dataset
data(HairEyeColor)

#Check Structure
str(HairEyeColor)
View(HairEyeColor)
?HairEyeColor

#Very Basic Mosaic Plot(Base R)
mosaicplot(HairEyeColor)

#Add Titles and colors
mosaicplot(HairEyeColor,main = "Mosaic Plot:Hair,Eye Color and Sex", color = TRUE)

#Two-Variable Mosaic Plot
HairEye2D <- margin.table(HairEyeColor,c(1,2))
mosaicplot(HairEye2D,main = "Hair vs Eye Color Mosaic Plot", 
           color = TRUE)

#Mosaic Plots by Sex
par(mfrow = c(1,2))
mosaicplot(HairEyeColor[,, "Male"],main = "Male",color = TRUE)
mosaicplot(HairEyeColor[,, "Female"],main = "Female",color = TRUE)
par(mfrow = c(1,1))

#Custom Colors
mosaicplot(HairEye2D,col = c("brown","lightblue","gold","lightgreen"),
           main = "Hair vs Eye Color(Custom colors")

#Advanced mosaic plot using 'vcd'
install.packages("vcd")
library(vcd)
mosaic(HairEyeColor,shade=TRUE,legend=TRUE,
       main="shaded mosaic Plot(vcd)")

#convert dataset to data frame(for ggplot)
hair_eye_df<-as.data.frame(HairEyeColor)
head(hair_eye_df)

#ggplot alternative(Proportional mosaic-style plot)
library(ggplot2)
ggplot(hair_eye_df,aes(x=Hair,y=Freq,fill=Eye))+
  geom_bar(stat="identity",position="fill")+
  facet_wrap(~Sex)+
  labs(
    title="Proportional Distribution of Eye Color by Hair",
    y="proportion")+
  theme_minimal()

#advanced mosaic with residual shading
mosaic(~Hair+Eye+Sex,data=hair_eye_df,shade=TRUE,legend=TRUE)
