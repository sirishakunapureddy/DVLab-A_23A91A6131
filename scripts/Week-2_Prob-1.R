#load the dataset
data(iris)

#inspect the data
?iris
head(iris,3)
str(iris)
class(iris)

#count of each species and to see data in column "species"
iris$Species
View(iris)

#ploting a bar chart
barplot(
  table(iris$Species),
  col='pink'
)

#labeld bar chart
barplot(
  table(iris$Species),
  main="Count of Iris Species",
  xlab="Species",
  ylab="Number of Items",
  col='steelblue'
)

#bar plot from aggregated data using mean sepal length per species
mean_sepal<-tapply(iris$Sepal.Length,iris$Species,mean)
mean_sepal

barplot(
  mean_sepal,
  col='orange',
  main="Average Sepal Length by Species",
  xlab="Species",
  ylab="Mean Sepal Length"
)

#grouped bar chart
group_means<-rbind(
  sepal=tapply(iris$Sepal.Length,iris$Species,mean),
  petal=tapply(iris$Petal.Length,iris$Species,mean)
)
group_means

barplot(
  group_means,
  beside=TRUE,
  col=c("skyblue","pink"),
  legend.text=TRUE,
  main="Clustered Bar Chart: Sepal vs Petal Length"
)
barplot(
  group_means,
  beside=FALSE,
  col=c("skyblue","pink"),
  legend.text=TRUE,
  main="Stacked Bar Chart: Sepal vs Petal Length"
)


## End of File
## New
  
