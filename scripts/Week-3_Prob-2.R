#load the dataset
data(airquality)

#inspect the data
?airquality
head(airquality,3)
str(airquality)
class(airquality)

#count of each species and to see data in column "Month"
airquality$Month
View(airquality)

#ploting a bar chart
barplot(
  table(airquality$Month)
)

#labeld bar chart
barplot(
  table(airquality$Month),
  main="Count of airquality day",
  xlab="wind",
  col='steelblue'
)

#bar plot from aggregated data using mean wind speed per Month
mean_wind<-tapply(airquality$Wind,airquality$Month,mean)
mean_wind

barplot(
  mean_wind,
  col='black',
  main="Average Wind Length by Month",
  xlab="Month",
  ylab="Mean Wind speed",
  
)

#grouped bar chart by Month
group_means<-rbind(
  wind=tapply(airquality$Wind,airquality$Month,mean),
  temp=tapply(airquality$Temp,airquality$Month,mean)
)
group_means

barplot(
  group_means,
  beside=TRUE,
  col=c("steelblue","orange"),
  legend.text=TRUE,
  main="Clustered Bar Chart: Wind vs Temp by Month"
)
barplot(
  group_means,
  beside=FALSE,
  col=c("steelblue","orange"),
  legend.text=TRUE,
  main="Stacked Bar Chart: Wind vs Temp by Month",
)
