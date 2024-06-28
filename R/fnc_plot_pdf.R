plot_pdf <- function(distr, npoints = 10000) {

  if (distr$properties$support$lower == -Inf) {
    # lower_bound <- distr$quantile(1/npoints)
    from <- distr$quantile(1/npoints)
  } else {
    # lower_bound <- distr$properties$support$lower
    from <- distr$properties$support$lower
  }

  if (distr$properties$support$upper == Inf) {
    # upper_bound <- distr$quantile(1 - (1/npoints))
    to <- distr$quantile(1 - (1/npoints))
  } else {
    # upper_bound <- distr$properties$support$upper
    to <- distr$properties$support$upper
  }

  plotdf <-
    dplyr::tibble(
      x = seq(from = from, to = to, length.out = npoints),
      y = distr$pdf(x)
    )

  plot <-
    ggplot(plotdf, aes(x = x, y = y)) +
    geom_line() +
    # coord_cartesian(xlim = c(lower_bound, upper_bound)) +
    theme_bw() +
    theme(
      panel.grid.major.y = element_blank(),
      panel.grid.minor.y = element_blank(),
      plot.title = element_text(hjust = 0.5)
    ) +
    labs(title = distr$strprint(),
         x = NULL, y = "p(x)")

  ggplotly(plot) |>
    layout(
      xaxis = list(
        rangeslider = list(visible = T)
      )
    ) |>
    config(modeBarButtonsToRemove = c("zoomIn2d", "zoomOut2d", "pan",
                                      "autoscale", "zoom",
                                      "hoverClosestCartesian",
                                      "hoverCompareCartesian"))

}
