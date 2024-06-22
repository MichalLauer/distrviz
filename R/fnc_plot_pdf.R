plot_pdf <- function(distr, npoints = 1000) {
  plotdf <-
    data.frame(
      x = distr$quantile(seq(from = 0 + 1/npoints,
                             to   = 1 - 1/npoints,
                             length.out = npoints))
    )

  plot <- ggplot(plotdf, aes(x = x)) +
    geom_line(stat = "density") +
    coord_cartesian(xlim = distr$quantile(c(0.001, 0.999))) +
    theme_bw() +
    theme(
      panel.grid.major.y = element_blank(),
      panel.grid.minor.y = element_blank(),
      plot.title = element_text(hjust = 0.5)
    ) +
    labs(title = distr$strprint(),
         x = "x", y = "p(x)")

  ggplotly(plot)
}
