#' Embark Lab Color Palette
#'
#' A named character vector of six Embark Lab brand colors.
#'
#' @format A named character vector with 6 hex color values.
#' @export
embark_colors <- c(
  "Navy" = "#1A4F66",
  "Coral" = "#EF6C45",
  "Chartreuse" = "#C2B824",
  "Lavender" = "#A481C7",
  "Taupe" = "#EEECE1",
  "Sunrise" = "#E1AD01"
)

#' Get Embark Color Palette
#'
#' Returns the Embark Lab color palette, optionally interpolated to `n` colors.
#'
#' @param n Number of colors to return. If `NULL` (default), returns all 6 brand colors.
#'   If specified, uses [grDevices::colorRampPalette()] to interpolate.
#' @param names Logical. If `TRUE`, return named colors. Default is `FALSE`.
#' @return A character vector of hex color values.
#' @export
embark_palette <- function(n = NULL, names = FALSE) {
  colors <- embark_colors
  if (!is.null(n)) {
    colors <- grDevices::colorRampPalette(colors)(n)
  }
  if (!names) {
    colors <- unname(colors)
  }
  return(colors)
}

#' Get Named Embark Color Palette
#'
#' Returns the Embark Lab color palette with names intact.
#'
#' @return A named character vector of hex color values.
#' @export
embark_palette_named <- function() {
  return(embark_colors)
}

#' Embark Fill Scale for ggplot2
#'
#' A convenience wrapper around [ggplot2::scale_fill_manual()] using the
#' Embark Lab color palette.
#'
#' @param ... Additional arguments passed to [ggplot2::scale_fill_manual()].
#' @return A ggplot2 scale object.
#' @export
scale_fill_embark <- function(...) {
  ggplot2::scale_fill_manual(values = embark_palette(), ...)
}

#' Embark Color Scale for ggplot2
#'
#' A convenience wrapper around [ggplot2::scale_color_manual()] using the
#' Embark Lab color palette.
#'
#' @param ... Additional arguments passed to [ggplot2::scale_color_manual()].
#' @return A ggplot2 scale object.
#' @export
scale_color_embark <- function(...) {
  ggplot2::scale_color_manual(values = embark_palette(), ...)
}

