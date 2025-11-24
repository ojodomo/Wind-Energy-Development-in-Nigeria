library(sf)
library(ggplot2)

# Load Nigeria boundary
nigeria <- st_read("data/nigeria_boundary.shp")

# Plot map
ggplot() +
  geom_sf(data = nigeria, fill = "lightgray") +
  labs(title = "Map of Nigeria")
