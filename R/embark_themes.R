#' Embark ggplot2 Theme (Garet Font)
#'
#' A ggplot2 theme using the Garet font family with Embark Lab Navy branding.
#' Based on [ggplot2::theme_minimal()] with centered bold titles, top legend,
#' and transparent background.
#'
#' @format A ggplot2 theme object.
#' @export
embark_theme_g <-
  ggplot2::theme_minimal() +
  ggplot2::theme(
    text = ggplot2::element_text(size = 18, family = "Garet", color = "#1a4e66"),
    axis.text = ggplot2::element_text(size = 18, family = "Garet", color = "#1a4e66"),
    axis.title = ggplot2::element_text(size = 18, face = "bold", color = "#1a4e66"),
    plot.title = ggplot2::element_text(hjust = 0.5, size = 18, family = "Garet", face = "bold", color = "#1a4e66"),
    legend.position = "top",
    plot.background = ggplot2::element_rect(fill = "transparent", color = NA)
  )

#' Embark ggplot2 Theme (Avenir Font)
#'
#' A ggplot2 theme using the Avenir font family with Embark Lab Navy branding.
#' Based on [ggplot2::theme_minimal()] with centered bold titles, top legend,
#' and transparent background.
#'
#' @format A ggplot2 theme object.
#' @export
embark_theme_a <-
  ggplot2::theme_minimal() +
  ggplot2::theme(
    text = ggplot2::element_text(size = 18, family = "Avenir", color = "#1a4e66"),
    axis.text = ggplot2::element_text(size = 18, family = "Avenir", color = "#1a4e66"),
    axis.title = ggplot2::element_text(size = 18, face = "bold", color = "#1a4e66"),
    plot.title = ggplot2::element_text(hjust = 0.5, size = 18, family = "Avenir", face = "bold", color = "#1a4e66"),
    legend.position = "top",
    plot.background = ggplot2::element_rect(fill = "transparent", color = NA)
  )
