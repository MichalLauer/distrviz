plot_cdf <- function(distr, npoints = 1000) {
  plotdf <-
    data.frame(
      x = distr$quantile(seq(from = 0 + 1/npoints,
                             to   = 1 - 1/npoints,
                             length.out = npoints))
    )
  plotdf$y <- distr$cdf(plotdf$x)
  plot <-
    ggplot(plotdf, aes(x = x, y = y)) +
    coord_cartesian(xlim = distr$quantile(c(0.001, 0.999))) +
    theme_bw() +
    geom_line() +
    theme(
      panel.grid.major.y = element_blank(),
      panel.grid.minor.y = element_blank(),
      plot.title = element_text(hjust = 0.5)
    ) +
    labs(title = distr$strprint(),
         x = "x", y = "F(x)")

  ggplotly(plot)
}
