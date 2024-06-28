library(shiny)
library(shinyjs)
library(shinyvalidate)
library(htmltools)
library(bslib)

library(distr6)
library(glue)

library(plotly)

rm(list = ls())
invisible(sapply(list.files("R", full.names = T), FUN = source))

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
    selectInput(inputId = "distr_select",
                label = "Select distribution",
                choices = c(
                  "Normal distribution" = "normal",
                  "Student distribution" = "studentt",
                  "Beta distribution" = "beta",
                  "Chi-Squared distribution" = "chisquared",
                  "Arcsine distribution" = "arcsine"
                )),
    uiOutput("distr_show"),
    textOutput("distr_info"),
    actionButton(inputId = "draw",
                 label = "Draw!",
                 icon = icon("pencil"),
                 class = "btn btn-success")

  ),
  # plots
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

  distributions <- reactiveValues(
    # TODO: Distribution parser který ověří že existuje (ochrana proti code
    # injection)
    normal = distr_normal_server("normal"),
    studentt = distr_studentt_server("studentt"),
    beta = distr_beta_server("beta"),
    chisquared = distr_chisquared_server("chisquared"),
    arcsine = distr_arcsine_server("arcsine"),
  )

  distr <- NULL
  observe({
    # TODO: Distribution parser který ověří že existuje (ochrana proti code
    # injection)
    distr <<- distributions[[input$distr_select]]
  }) |>
    bindEvent(input$distr_select)

  output$distr_show <- renderUI({
    # TODO: Distribution parser který ověří že existuje (ochrana proti code
    # injection)
    ui_call <- glue("distr_{input$distr_select}_ui('{input$distr_select}')")
    eval(parse(text = ui_call))
  }) |>
    bindEvent(input$distr_select)

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
    text <- list(
      glue("Expected value (E[X]) = {distr$distr$mean()}"),
      glue("Variance (E[(X - E[X])^2]) = {distr$distr$variance()}"),
      glue("Precision = {distr$distr$prec()}"),
      glue("Kurtosis = {distr$distr$properties$kurtosis}"),
      glue("Symmetry = {distr$distr$properties$symmetry}"),
      glue("Skewness = {distr$distr$properties$skewness}")
    )
    return(paste0(text, collapse = "\n"))
  }) |>
    bindEvent(input$draw, ignoreInit=T)
}

shinyApp(ui, server, options = list(
  launch.browser = F,
  port = 1234
))

