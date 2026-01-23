#load Air Passengers Dataset
data(AirPassengers)

#Verify the Dataset
?AirPassengers
class(AirPassengers)
View(AirPassengers)

#Convert the Dataset to DataFrame
ap_df <- data.frame(
  year <- time(AirPassengers),
  passengers = as.numeric(AirPassengers)
)
ap_df

#DataFrame with Years and Months Seperately
ap_df_months <- data.frame(
  year = floor(time(AirPassengers)),
  month = cycle(time(AirPassengers)),
  passengers = as.numeric(AirPassengers)
)
ap_df_months

#Basic plot
plot(AirPassengers)

#Plot with Title,Axis labels and color
plot(AirPassengers,
     type = 'l',
     main = "Air Passengers Trend Analysis",
     xlab = "Months",
     ylab = "No of Passengers",
     col = "red"
)

#Changing the line width and point color
plot(AirPassengers,
     type = 'l',
     lwd = 1.5,
     main = "Air Passengers Trend Analysis",
     xlab = "Months",
     ylab = "No of Passengers",
     col = "red"
)
points(AirPassengers,
       type = 'o',
       pch = 16,
       col = "blue"
)
grid()


#using ggplot2 library
library(ggplot2)

#A basic grid with x&y axes
ggplot(
  ap_df,
  aes(x=year,y=passengers))+
  geom_line(color='blue',linewidth=0.7)+
  labs(
    title='Trend Analysis of Air Passengers',
    subtitle='From 1949-1960',
    caption='using Built-in Air Passengers Dataset',
    x='Months',
    y='No.of Passengers')+
  geom_point(color='red',size=2)+
  geom_smooth(se=FALSE,color='orange',linewidth=0.8)+
  theme_minimal()+
  theme(
    plot.title=element_text(face="bold",size=14,color = 'brown',hjust = 0.5),
    plot.subtitle=element_text(size=10,hjust=0.5)
  )
