#' embark_colors
#' adds embark color palette
#' @return color palette
#' @export

embark_colors <- c("Navy" = "#1A4F66", "Coral" = "#EF6C45", "Chartreuse" =  "#C2B824", "Lavender" = "#A481C7", "Taupe" = "#EEECE1", "Sunrise" = '#E1AD01')

#' embark_palette
#' adds embark color palette
#' @import ggplot2
#' @param n number of colors
#' @param return_names return color names, T or F
#' @return color palette
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

#' embark_palette_named
#' adds embark color palette with names
#' @import ggplot2
#' @return color palette
#' @export

embark_palette_named <- function() {
  return(embark_colors)
}


#' scale_fill_embark
#' fills graph with embark palette
#' @import ggplot2
#' @export

scale_fill_embark <- function(...) {
  ggplot2::scale_fill_manual(values = embark_palette(), ...)
}
#' scale_color_embark
#' colors graph with embark palette
#' @import ggplot2
#' @export


scale_color_embark <- function(...) {
  ggplot2::scale_color_manual(values = embark_palette(), ...)
}

