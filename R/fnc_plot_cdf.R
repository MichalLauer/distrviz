plot_cdf <- function(distr, npoints = 3000) {

  l <- distr$properties$support$length

  if (l == Inf) {
    plot <- .plot_cdf_continuous(distr = distr, npoints = npoints)
  } else {
    plot <- .plot_cdf_discrete(distr = distr, length = l)
  }

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

.plot_cdf_continuous <- function(distr, npoints) {

  from <- 0 + 1/npoints
  to <- 1 - 1/npoints

  tibble(
      x = distr$quantile(seq(from = from, to = to, length.out = npoints)),
      y = distr$cdf(x)
    ) |> 
    ggplot(aes(x = x, y = y)) +
    coord_cartesian(xlim = distr$quantile(c(from, to))) +
    theme_bw() +
    geom_line() +
    theme(
      panel.grid.major.y = element_blank(),
      panel.grid.minor.y = element_blank(),
      plot.title = element_text(hjust = 0.5)
    ) +
    labs(title = distr$strprint(),
         x = NULL, y = "F(x)")
  
}

.plot_cdf_discrete <- function(distr, length) {

  tibble(
    x = seq(from = distr$properties$support$lower,
            to = distr$properties$support$upper,
            length.out = length),
    y = distr$cdf(x)
  ) |>
    ggplot(aes(x = x, y = y)) +
    geom_col() + 
    scale_x_continuous(breaks = seq_len(length) - 1) +
    theme_bw() +
    theme(
      panel.grid.major.y = element_blank(),
      panel.grid.minor.y = element_blank(),
      panel.grid.major.x = element_blank(),
      panel.grid.minor.x = element_blank(),
      plot.title = element_text(hjust = 0.5)
    ) +
    labs(title = distr$strprint(),
        x = NULL, y = "p(x)")

}
