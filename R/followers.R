library(tidyverse)
library(ggtext)

df_followers <- readr::read_csv(here::here('data', 'followers.csv'))

theme_set(theme_void(base_size = 16))

theme_update(
  axis.text = element_blank(),
  plot.title = element_text(size = 11, color = "grey30", face = "italic", margin = margin(0, 0, 2, 0)),
  plot.background = element_rect(color = "black", fill = "#F1F5F7")
)

x <- as.Date('2020-08-01')
y <- c(1, 1000, 10000, 100000, 1000000)
labels <- c(1, 1000, 10000, 100000, 1000000)

plot.labels <- tibble(x, y, labels)

df_followers %>%
  ggplot(aes(x = date, y = followers)) +
  geom_area() +
  geom_richtext(data = plot.labels, aes(x = x, y = y, label = labels)) +
  labs(
    title = "Fall Guys"
  ) +
  scale_y_continuous(labels = scales::comma)
