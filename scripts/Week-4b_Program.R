# Load dataset
data(airquality)

# Inspect the data
?airquality
View(airquality)
str(airquality)
class(airquality)
#boxplot for the Ozone
boxplot(airquality$Ozone,
        main = "Box plot for Ozone",
        ylab = "Ozone",
        col = "steelblue")

#convert monthh into factor
airquality$Month <- as.factor(airquality$Month)

boxplot(Ozone ~ Month,
        data = airquality,
        main = "Ozone by Month",
        xlab = "Month",
        ylab = "Ozone",
        col = c('pink','lightgreen','skyblue','orange','purple'))
#Multi-variable box plot
boxplot(airquality[,1:4],
        main = "Multi Variable Box Plot",
        col = c('pink','lightgreen','skyblue','orange'))
#custom color palette
month_colors <- c(
  "5" = "red",
  "6" = "steelblue",
  "7" = "green",
  "8" = "purple",
  "9" = "orange"
)

boxplot(Ozone ~ Month,
        data = airquality,
        main = "Ozone by Month (Custom Color Palette)",
        col = month_colors)

#Using ggplot
library(ggplot2)
#color box plot with theme
ggplot(airquality,
       aes(x = Month, y = Ozone, fill = Month)) +
  geom_boxplot()
# Manual colo Palette in ggplot
ggplot(airquality,
       aes(x = Month, y = Ozone, fill = Month)) +
  geom_boxplot() +
  scale_fill_manual(
    values = c(
      "5" = "red",
      "6" = "steelblue",
      "7" = "green",
      "8" = "purple",
      "9" = "orange"
    )
  ) +
  theme_minimal()