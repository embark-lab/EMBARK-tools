#' Histogram by Age and Sex
#'
#' Creates a faceted bar chart showing the percentage distribution of a variable
#' across age groups, split by sex. The data must contain columns named `sex`
#' and `age`.
#'
#' @param df_1 A data frame containing the data.
#' @param x_var_1 An unquoted variable name for the x-axis.
#' @param graph_title A character string for the plot title.
#' @return A ggplot2 plot object.
#' @importFrom dplyr filter select mutate group_by summarise ungroup
#' @importFrom ggplot2 ggplot aes geom_col geom_text position_dodge
#'   scale_y_continuous scale_fill_manual facet_wrap labs theme_bw theme
#'   element_blank element_text
#' @importFrom scales percent
#' @export
hist_by_age_sex <- function(df_1, x_var_1, graph_title) {
  x_var_1 <- dplyr::enquo(x_var_1)
  df_2 <- frq_table_by_age_sex(df_1, !!x_var_1)
  plot_1 <- ggplot2::ggplot(
    data = df_2,
    ggplot2::aes(
      x = !!x_var_1, y = pct, fill = sex,
      label = sprintf("%0.1f%%", pct * 100)
    )
  ) +
    ggplot2::geom_col(position = "dodge") +
    ggplot2::geom_text(
      position = ggplot2::position_dodge(width = 0.9),
      vjust = 0.0,
      size = 3
    ) +
    ggplot2::scale_y_continuous(labels = scales::percent, limits = c(0, 1)) +
    ggplot2::labs(
      x = ggplot2::element_blank(),
      y = "Percent (within gender)",
      title = graph_title
    ) +
    ggplot2::scale_fill_manual(
      values = c("Male" = "darkgreen", "Female" = "orange")
    ) +
    ggplot2::facet_wrap(~age) +
    ggplot2::theme_bw() +
    ggplot2::theme(
      legend.title = ggplot2::element_blank(),
      axis.text.x = ggplot2::element_text(angle = 45, vjust = 1, hjust = 1),
      text = ggplot2::element_text(size = 12)
    )
  return(plot_1)
}

#' Frequency Table by Age and Sex
#'
#' Creates a summary table of counts and proportions for a variable, grouped
#' by sex and age. The data must contain columns named `sex` and `age`.
#'
#' @param df A data frame or tibble.
#' @param x_var An unquoted variable name.
#' @return A tibble with columns for the variable, sex, age, n, and pct.
#' @importFrom dplyr filter select mutate group_by summarise ungroup enquo
#' @export
frq_table_by_age_sex <- function(df, x_var) {
  x_var <- dplyr::enquo(x_var)
  df_1 <- df |>
    dplyr::filter(!is.na(!!x_var) & !is.na(sex)) |>
    dplyr::select(!!x_var, sex, age) |>
    dplyr::mutate(sex = as_factor(sex)) |>
    dplyr::mutate(!!x_var := as_factor(!!x_var)) |>
    dplyr::group_by(!!x_var, sex, age) |>
    dplyr::summarise(n = dplyr::n(), .groups = "drop") |>
    dplyr::group_by(sex, age) |>
    dplyr::mutate(pct = prop.table(n)) |>
    dplyr::ungroup()
  return(df_1)
}
