# Load and Understand the DataSet
data(iris)
str(iris)

# Basic 3D Scatter plot

# Install Neccessary packages
install.packages('scatterplot3d')
library(scatterplot3d)

# Basic 3d Plot
scatterplot3d(
  iris$Sepal.Length,
  iris$Sepal.Width,
  iris$Petal.Length
)

# Labelled 3D Scatter Plot
scatterplot3d(
  iris$Sepal.Length,
  iris$Sepal.Width,
  iris$Petal.Length,
  main="3D Scatter Plot of Iris Data",
  xlab='Sepal length',
  ylab='Sepal Width',
  zlab='Petal Length',
  pch=16
)

# Colored 3d Scatter plot by species
colors <- as.numeric(iris$Species)

scatterplot3d(
  iris$Sepal.Length,
  iris$Sepal.Width,
  iris$Petal.Length,
  color=colors,
  pch=16,
  main= '3D Scatter plot by species'
)

legend(
  "topright",
  legend=levels(iris$Species),
  col=1:3,
  pch=16
)

# 3D plot using 'cloud()' (Lattice)

# Load Lattice package:
library(lattice)

# Basic 3d Cloud plot:
cloud(
  Petal.Length ~ Sepal.Length * Sepal.Width,
  data=iris
)

# Colored Cloud Plot
cloud(
  Petal.Length ~ Sepal.Length * Sepal.Width,
  data=iris,
  groups=Species,
  auto.key=TRUE,
  main="3D Cloud Plot of Iris Data"
)

# Multi-panel Scatter using 'xyplot()'
# although 'xyplot()' is not true 3d, allows multi-dimensional comparison

xyplot(
  Petal.Length ~ Sepal.Length | Species,
  data=iris,
  pch=16,
  col="blue",
  layout=c(3,1)
)

# Interactive 3D plot using Plotly (Advanced)

# Install plotly:
install.packages('plotly')
library(plotly)

# interactive 3d Scatter
plot_ly(
  iris,
  x= ~Sepal.Length,
  y= ~Sepal.Width,
  z= ~Petal.Length,
  color= ~Species,
  type = "scatter3d",
  mode = "markers"
)

# 3D Plot with size encoding
plot_ly(
  iris,
  x= ~Sepal.Length,
  y= ~Sepal.Width,
  z= ~Petal.Length,
  color= ~Species,
  size= ~Petal.Width,
  type='scatter3d',
  mode = "markers"
)