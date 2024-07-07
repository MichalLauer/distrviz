library(shiny)
library(shinyjs)
library(shinyvalidate)
library(shinyWidgets)
library(htmltools)
library(bslib)

library(distr6)
library(extraDistr)

library(glue)
library(dplyr)

library(plotly)

rm(list = ls())
invisible(sapply(list.files("R", full.names = T), FUN = source))

AVAILABLE_DISTRIBUTIONS <- c(
  "Normal" = "normal",
  "Student" = "studentt",
  "Beta" = "beta",
  "Noncentral Beta" = "betanoncentral",
  "ChiSquared" = "chisquared",
  "Noncentral ChiSquared" = "chisquarednoncentral",
  "Arcsine" = "arcsine",
  "Cauchy" = "cauchy",
  "Binomial" = "binomial",
  "Erlang" = "erlang"
)

ui <- page_sidebar(
  title = "DistViz",
  theme = bs_theme(version = 5) |>
    bs_theme_update(code_font = font_collection(font_google("Fira Code"),
                                                "monospace"),
                    preset = "journal") |>
    bs_add_rules(rules = sass::sass_file("assets/style.scss")),
  useShinyjs(),
  sidebar = sidebar(
    open = NA,
    gap = ".5rem",
    virtualSelectInput(inputId = "distr_select",
                       label = "Select distribution",
                       search = T,
                       choices = sort(AVAILABLE_DISTRIBUTIONS),
                       selected = "normal"),
    uiOutput("distr_show"),
    textOutput("distr_info"),
    actionButton(inputId = "draw",
                 label = "Draw!",
                 icon = icon("pencil"),
                 class = "btn btn-success")

  ),
  # Cards
  layout_column_wrap(
    width = 1/2,
    heights_equal = "row",
    card(
      height = "70vh",
      full_screen = T,
      card_header("Probability distribution function (PDF)"),
      plotlyOutput("pdf")
    ),
    card(
      height = "70vh",
      card_header("Cumulative distribution function (PDF)"),
      plotlyOutput("cdf")
    ),
    card(
      height = "30vh",
      card_header("Characteristics of distribution"),
      verbatimTextOutput("info"),
    ),
    card(
      height = "30vh",
      card_header("Characteristics of distribution"),
      "STRL"
    )
  )
)

server <- function(input, output, session) {

  # Add controls for a given distribution
  redrawing <- FALSE
  output$distr_show <- renderUI({
    req(validate_input(input = input$distr_select, distribs = AVAILABLE_DISTRIBUTIONS))
    redrawing <<- TRUE

    ui_call <- glue("distr_{input$distr_select}_ui('{input$distr_select}')")
    ui <- eval(parse(text = ui_call))
    return(ui)
  }) |>
    bindEvent(input$distr_select)
  
  # Add distr_xxx_server only after the UI is rendered so that the validation
  # does not throw errors and does not slow the app
  session$onFlushed(function() {
    if (redrawing) {
      select <- isolate(input$distr_select)
      server_call <- glue("distr_{select}_server('{select}')")
      distr <<- eval(parse(text = server_call))
      redrawing <<- F
    }
  }, once = F)

  # Plots ---
  output$pdf <- renderPlotly({
    req(distr$iv$is_valid(), cancelOutput = T)

    plot_pdf(distr$distr)
  }) |>
    bindEvent(input$draw, ignoreInit=T)

  output$cdf <- renderPlotly({
    req(distr$iv$is_valid(), cancelOutput = T)

    plot_cdf(distr$distr)
  }) |>
    bindEvent(input$draw, ignoreInit=T)

  output$info <- renderText({
    req(distr$iv$is_valid(), cancelOutput = T)

    d <- distr$distr
    text <- list(
      glue("Expected value (E[X]) = {char(d$mean)}"),
      glue("Variance (E[(X - E[X])^2]) = {char(d$variance)}"),
      glue("Precision = {char(d$prec)}"),
      glue("Kurtosis = {char(d$properties$kurtosis)}"),
      glue("Symmetry = {char(d$properties$symmetry)}"),
      glue("Skewness = {char(d$properties$skewness)}")
    )

    return(paste0(text, collapse = "\n"))
  }) |>
    bindEvent(input$draw, ignoreInit=T)

}

shinyApp(ui, server, options = list(
  launch.browser = F,
  port = 1234
))

