#' embark_theme_g
#' adds theme with Garet font family
#' @return ggtheme
#' @export

embark_theme_g <-
  theme_minimal() +
  theme(
    text = element_text(size = 18, family = "Garet", color = "#1a4e66"),
    axis.text = element_text(size = 18, family = "Garet", color = "#1a4e66"),
    axis.title = element_text(size = 18, face = "bold", color = "#1a4e66"),
    plot.title = element_text(hjust = 0.5, size = 18, family = "Garet", face = "bold", color = "#1a4e66"),
    legend.position = "top",
  plot.background = element_rect(fill = "transparent", color = NA)
  )

#' embark_theme_a
#' adds theme with Avenir font family
#' @return ggtheme
#' @export

embark_theme_a <-
  theme_minimal() +
  theme(
    text = element_text(size = 18, family = "Avenir", color = "#1a4e66"),
    axis.text = element_text(size = 18, family = "Avenir", color = "#1a4e66"),
    axis.title = element_text(size = 18, face = "bold", color = "#1a4e66"),
    plot.title = element_text(hjust = 0.5, size = 18, family = "Avenir", face = "bold", color = "#1a4e66"),
    legend.position = "top",
    plot.background = element_rect(fill = "transparent", color = NA)
    )
