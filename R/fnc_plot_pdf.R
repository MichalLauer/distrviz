plot_pdf <- function(distr, npoints = 3000) {

  l <- distr$properties$support$length

  if (l == Inf) {
    plot <- .plot_pdf_continuous(distr = distr, npoints = npoints)
  } else {
    plot <- .plot_pdf_discrete(distr = distr, length = l)
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

.plot_pdf_continuous <- function(distr, npoints) {

  if (distr$properties$support$lower == -Inf) {
    from <- distr$quantile(1/npoints)
  } else {
    from <- distr$properties$support$lower
  }

  if (distr$properties$support$upper == Inf) {
    to <- distr$quantile(1 - (1/npoints))
  } else {
    to <- distr$properties$support$upper
  }

  tibble(
    x = seq(from = from, to = to, length.out = npoints),
    y = distr$pdf(x)
  ) |>
  ggplot(aes(x = x, y = y)) +
  geom_line() +
  theme_bw() +
  theme(
    panel.grid.major.y = element_blank(),
    panel.grid.minor.y = element_blank(),
    plot.title = element_text(hjust = 0.5)
  ) +
  labs(title = distr$strprint(),
       x = NULL, y = "p(x)")
  
}

.plot_pdf_discrete <- function(distr, length) {

  tibble(
    x = seq(from = distr$properties$support$lower,
            to = distr$properties$support$upper,
            length.out = length),
    y = distr$pdf(x)
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
