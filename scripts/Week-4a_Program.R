#load the dataset
data(iris)

#inspect the data
?iris
View(iris)
str(iris)
class(iris)

#Basic Box plot
boxplot(iris$Sepal.Length)

#labeld box plot
boxplot(iris$Sepal.Length,
  main="Box plot for Sepal Length",
  ylab="Sepal Length",
  col='steelblue'
)

#Grouped Box plot by Species
boxplot(Sepal.Length ~ Species,
  data = iris,
  main="Sepal Length by Species",
  xlab="Species",
  ylab="Sepal Length",
  col=c('pink','lightgreen','skyblue')
)

#multi-variable Box plot
boxplot(iris[,1:4],
        main = "Multi Variable Box Plot",
        col = c('pink','lightgreen','skyblue','orange')
)

#Using Custom color Palette
species_colors <- c(
  "setosa" = "red",
  "versicolor" = "steelblue",
  "virginica" = "green"
)
boxplot(
  Sepal.Length ~ Species,
  data = iris,
  main = "Sepal Length by Species (Custom color platte)",
  col = species_colors
)

#GGPLOT2
library(ggplot2)

ggplot(iris,
       aes(x = Species, y = Sepal.Length,fill = Species))+
  geom_boxplot()

#colored box plot by species
ggplot(iris,aes(x = Species, y = Sepal.Length,fill = Species))+
  theme_minimal()

#Using Manual Color palette
ggplot(iris,aes(x = Species, y = Sepal.Length,fill = Species))+
  geom_boxplot() +
  scale_fill_manual(
    values =c("setosa" = "red",
      "versicolor" = "steelblue",
      "virginica" = "green"
    )
  )+
  theme_minimal()
  