#load the dataset
data(mtcars)

#inspect structure
str(mtcars)

#view first few rows
head(mtcars)

#Basic Heat map
heatmap(as.matrix(mtcars))

#improved Heat Map with LAbles
heatmap( as.matrix(mtcars),main = "Heatmap of mtcars Dataset")

#Heatmap with Customm Colors
colors <- colorRampPalette(c("blue","yellow","red"))(50)
heatmap( as.matrix(mtcars),col = colors,main = "Custom Color Heatmap")

#Correlation Heat Map
corr_matrix <- cor(mtcars)
heatmap( corr_matrix, col = colorRampPalette(c("blue","white","red"))(50),
         main = "Correlation Heatmap of mtcars")

#ggplot2 Heat map
install.packages('reshape2')
library(reshape2)
mtcars$Car <- rownames(mtcars)
mtcars_long <- melt(mtcars,id.vars= "Car")
View(mtcars_long)
library(ggplot2)
ggplot(mtcars_long,aes(x = variable,y=Car,fill = value)) +
  geom_tile()

#Styled ggplot Heat MAp
ggplot(mtcars_long,aes(x = variable,y = Car,fill = value))+
  geom_tile() +
  scale_fill_gradient(low = "white",high = "red") +
  theme_minimal() +
  labs(title = "Heatmap of mtcars Dataset")

#Another Way
ggplot(mtcars_long,aes(variable,Car,fill = value)) +
  geom_tile() +
  scale_fill_viridis_c()+
  theme_minimal()

#Correlation Heatmap with ggplot2
corr_matrix <- cor(mtcars[,sapply(mtcars,is.numeric)])
corr_long <- melt(corr_matrix)
ggplot(corr_long,aes(x=Var1,y=Var2,fill=value)) +
  geom_tile()+
  scale_fill_gradient2( low = "blue", mid = "white", high = "red", midpoint = 0) +
  theme_minimal()+
  labs(title = "Correlation Heatmap of mtcars")

#Heat Map with Values Displayed
ggplot(corr_long,aes(x=Var1,y=Var2,fill=value)) +
  geom_tile() +
  geom_text(aes(label = round(value,2))) +
  scale_fill_gradient2( low = "blue", mid = "white", high = "red", midpoint = 0) +
  theme_minimal()

#Advanced Heat Map Using 'pheatmap'
install.packages("pheatmap")
library(pheatmap)
pheatmap(
  cor(mtcars[,sapply(mtcars,is.numeric)]),
  display_numbers = round(corr_matrix,2),
  main = "Advanced Correlation Heatmap"
)
  