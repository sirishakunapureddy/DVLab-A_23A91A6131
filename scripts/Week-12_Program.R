#Install the required packages:
install.packages("maps")
install.packages("mapdata")
install.packages("mapproj")
#Load the libraries:
library(maps)
library(mapdata)
library(mapproj)
#Basic World Map (Base R)
map("world")
#Map with Title and Colors
map("world",
    col="lightblue",
    fill=TRUE,
    bg="white",
    main="World Map Visualization")
#Map of a Specific Country(#example: India)
map("world",
    regions = "India",
    fill = TRUE,
    col = "green",
    main = "Map of India"
)

#Map with Points (Locations)
# Example: major cities in India
map("world",fill = TRUE, col = "lightgreen")
points(
  x=c(77.2090,72.8777,80.2707),
  y=c(28.6139,19.0760,13.0827),
  col="red",
  pch=19
)
#Cities plotter
#   |   cities   |  Coordinates        |
#   |------------|---------------------|
#   | Delhi      | (77.2090,28.6139)   |
#   | Mumbai     | (72.8777,19.0760)   |
#   | Chennai    | (80.2707,13.0827)    |

# Labeling Locations
map("world",fill=TRUE,col="lightyellow")
points(77.2090,28.6139,pch=19,col="red")
text(
  77.2090,
  28.6139,
  labels = "Delhi",
  pos = 4
)

# Map Using ggplot2
library(ggplot2)
world_map <- map_data("world")
# Basic map:
ggplot(world_map, aes(long, lat, group = group)) +
  geom_polygon(fill = "lightblue", color = "black") +
  coord_fixed() +
  theme_minimal()

# Explanation:
#
# | Component | Purpose |
# | ------------ | ---------------------------- |
# | geom_polygon | draws map regions |
# | coord_fixed | keeps geographic proportions |
#
# ---

# Highlighting a Country
ggplot(world_map, aes(long, lat, group = group)) +
  geom_polygon(fill = "lightgray", color = "black") +
  geom_polygon(
    data = subset(world_map, region == "India"),
    fill = "orange"
  ) +
  coord_fixed() +
  theme_minimal()
# India gets highlighted.

# Map with Data Points (ggplot)
cities <- data.frame(
  city = c("Delhi","Mumbai","Chennai"),
  lon = c(77.2090,72.8777,80.2707),
  lat = c(28.6139,19.0760,13.0827)
)
ggplot() +
  geom_polygon(
    data = world_map,
    aes(x = long, y = lat, group = group),
    fill = "lightgray",
    color = "white"
  )+
  geom_point(
    data = cities,
    aes(x = lon, y = lat),
    color = "red",
    size = 3
  ) +
  coord_fixed(xlim = c(65, 100), ylim = c(5, 40)) +
  theme_minimal()
# Maps often require projections.
map(
  "world",
  proj = "orthographic",
  orientation = c(20,80,0)
)
map(
  "state",
  fill = TRUE,
  col = rainbow(50),
  main = "US State Map"
)