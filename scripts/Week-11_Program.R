data(iris)
iris_num <- iris[,1:4]
corr_matrix <- cor(iris_num)
corr_matrix
heatmap(
  corr_matrix,
  col = colorRampPalette(c("blue","white","red"))(100),
  main ="Correlation Heatmap of Iris Dataset"
)

heatmap(
  corr_matrix,
  col = colorRampPalette(c("blue","white","red"))(100),
  Rowv = NA,
  Colv = NA,
  scale ="none",
  main = "Correlation Heatmap of Iris Dataset"
)
text(
  rep(1:ncol(corr_matrix),each = nrow(corr_matrix)),
  rep(nrow(corr_matrix):1,ncol(corr_matrix)),
  round(corr_matrix,2))
install.packages("corrplot")
library(corrplot)
corrplot(corr_matrix)
corrplot(
  corr_matrix,
  method = "circle",
  type = "upper",
  tl.col = "black"
)
corrplot(
  corr_matrix,
  method = "number",
  type = "upper"
)
corrplot.mixed(
  corr_matrix,
  lower = "circle",
  upper = "number"
)
#gplot2-style correlogram
# convert correlation matrix to long format
library(reshape2)
library(ggplot2)
corr_long <- melt(corr_matrix)
ggplot(corr_long,aes(Var1 ,Var2,fill=value))+
  geom_tile()+
  scale_fill_gradient2(
    low = "blue",
    mid = "white",
    high = "red",
    midpoint=0
  )+
  theme_minimal()+
  labs(title="correlogram of Iris Dataset")

# Displyas correlation coefficients directly
# mixed correlogram
corrplot.mixed(
  corr_matrix,
  lower = "circle",
  upper = "number"
)



#Correlogram with values
ggplot(corr_long,aes(Var1,Var2,fill=value))+
  geom_tile()+
  geom_text(aes(label = round(value,2)))+
  scale_fill_gradient2(
    low = "blue",
    mid = "white",
    high = "red",
    midpoint = 0
  )+
  theme_minimal()

#Advanced correlogram using GGally
install.packages("GGally")
library(GGally)
ggcorr(
  iris_num,
  label = TRUE,
  label_round = 2
)

#Advanced Scatter Correlogram
library(GGally)
ggpairs(iris,
        columns = 1:4,
        aes(color = Species))