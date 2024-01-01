library(ggplot2)
mtcars$color_cyl <- factor(mtcars$cyl,
                            levels = c(4, 6, 8))


ggplot(mtcars, aes(x = wt, y = mpg, color = color_cyl)) +
  geom_point() +
  scale_color_embark() +
  labs(color = "Cylinders") +
  embark_theme_a

