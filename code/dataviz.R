library(tidyverse)
library(palmerpenguins)
penguins <- penguins
library(ggplot2)
ggplot(penguins)

ggplot(penguins) + 
  aes(x = body_mass_g, y = flipper_length_mm) +
  geom_point()

penguins <- penguins |>
  dplyr::filter(!is.na(body_mass_g))

ggplot(penguins) +
  aes(x = body_mass_g, y = flipper_length_mm, color = island) +
  geom_point() +
  scale_color_viridis_d(end = 0.7) # avoid yellow

ggplot(penguins) +
  aes(x = body_mass_g, y = flipper_length_mm, color = island) +
  geom_point() +
  scale_color_brewer(palette = "Set1") # don't need discrete, color palette is discrete 


ggplot(penguins) +
  aes(x = body_mass_g, y = flipper_length_mm, color = island, shape = sex) +
  geom_point() +
  scale_color_brewer(palette = "Set1") +
  scale_shape_discrete(na.translate = FALSE) +
  scale_x_continuous(name = "Body Mass (grams)") +
  
  ggplot(penguins) + 
  aes(x = body_mass_g, y = species, fill = species) +
  geom_boxplot(show.legend = FALSE) + 
  theme_classic() +
  theme(axis.text = element_text (color = "black"))  scale_y_continuous(name = "Flipper Length (millimeters)") +
  theme_classic() +
  theme(axis.text = element_text(color = "black", family = "Times New Roman"))


ggplot(penguins) + 
  aes(x = body_mass_g, fill = species) +
  geom_histogram(position = "dodge") + 
  theme_classic() +
  theme(axis.text = element_text (color = "black"))

ggplot(penguins) + 
  aes(x = body_mass_g, y = species, fill = species) +
  geom_boxplot(show.legend = FALSE) + 
  theme_classic() +
  theme(axis.text = element_text (color = "black"))

ggplot(penguins) + 
  aes(x = body_mass_g, y = species, fill = island) +
  geom_boxplot() + 
  theme_classic() +
  theme(axis.text = element_text (color = "black"))

ggplot(penguins) + 
  aes(x = body_mass_g, y = species, fill = island) +
  geom_violin(draw_quantiles = c(0.25, 0.5, 0.75)) + 
  theme_classic() +
  theme(axis.text = element_text (color = "black"))

ggplot(penguins)+
  aes(x = bill_length_mm, y = bill_depth_mm) +
  geom_density_2d(linewidth = 0.25, color = "black") +
  scale_y_continuous(limits = c(12.5,NA)) +
  theme_classic() +
  theme(axis.text = element_text(color= "black"))

ggplot(economics) +
  aes(x = date, y = unemploy) +
  geom_line() +
  theme_classic() +
  theme(axis.text = element_text(color = "black"))

ggplot(economics) +
  aes(x = unemploy / pop, y = psavert) +
  geom_path(aes(color = as.numeric(date))) +
  theme_classic()

ggplot(penguins) +
  aes(x = bill_length_mm, y = bill_depth_mm) +
  geom_density_2d_filled() +
  geom_density_2d(linewidth = 0.25, color = "black") +
  geom_point() 


ggplot(penguins) +
  aes(x = bill_length_mm, y = bill_depth_mm) +
  geom_point() +
  geom_density_2d_filled(alpha = 0.5 ) +    #alpha is transparency
  geom_density_2d(linewidth = 0.25, color = "black") +
  theme_classic() +
  scale_x_continuous(limits = c(30, 60)) +
  scale_y_continuous(limits = c(12, 23)) +
  coord_cartesian(expand = FALSE)




ggplot(penguins) +
  aes(x = body_mass_g, y = flipper_length_mm, color = island, shape = sex) +
  geom_point() +
  scale_color_brewer(palette = "Set1") +
  scale_shape_discrete(na.translate = FALSE) +
  labs(x = "Body Mass (grams)", y = "Flipper Length (millimeters)", title = "Size of Penguins") +
  theme_classic() +
  facet_wrap(vars(species), ncol = 1)

ggplot(penguins) +
  aes(x = body_mass_g, y = flipper_length_mm, color = island, shape = sex) +
  geom_point() +
  scale_color_brewer(palette = "Set1") +
  scale_shape_discrete(na.translate = FALSE) +
  labs(x = "Body Mass (grams)", y = "Flipper Length (millimeters)", title = "Size of Penguins") +
  theme_classic() +
  facet_grid(rows = vars(year), cols = vars(species))

library(patchwork)  

g1 <- ggplot(penguins) +
  aes(x = body_mass_g, y = flipper_length_mm) +
  geom_point() +
  theme_classic()
  
g2 <- ggplot(penguins) +
  aes(x = bill_length_mm, y = bill_depth_mm) +
  geom_point() +
  geom_density_2d_filled(alpha = 0.5 ) +    #alpha is transparency
  geom_density_2d(linewidth = 0.25, color = "black") +
  theme_classic() +
  scale_x_continuous(limits = c(30, 60)) +
  scale_y_continuous(limits = c(12, 23)) +
  coord_cartesian(expand = FALSE)

g1 + g2


g3 <- ggplot(penguins) +
  aes(x = island, y = bill_length_mm) +
  geom_boxplot() +
  theme_classic()

(g1 | g2) / g3
  
ggsave("figures/penguins-1.jpg", g1, height = 10, width = 10)

gg <- (g1 | g2) / g3

ggsave("figures/penguins-2.jpg", gg, height = 10, width =10)










  





