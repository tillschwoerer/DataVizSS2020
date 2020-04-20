# Step 1: Build a plot by hand using fixed inputs

df <- ggplot2::diamonds

df %>% 
  filter(cut %in% c("Ideal", "Premium")) %>%
  group_by(clarity, color) %>%
  summarise(kpi = mean(price)) %>%
  ggplot(aes(x = clarity, y = color, fill = kpi)) +
  geom_tile() +
  labs(fill = kpi) +
  theme_minimal()


# Step 2: Turn fixed inputs into variables


x <- "color"
y <- "clarity"
cut_filter <- c("Ideal", "Premium", "Good")
kpi <- "price"

df %>% 
  filter(cut %in% cut_filter) %>%
  group_by(.data[[x]], .data[[y]]) %>%
  summarise(kpi = mean(.data[[kpi]])) %>%
  ggplot(aes(x = .data[[x]], y = .data[[y]], fill = kpi)) +
  geom_tile() +
  labs(fill = kpi) +
  theme_minimal()
  
