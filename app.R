library(shiny)
library(shinyjs)
library(shinyvalidate)
library(htmltools)
library(bslib)

library(distr6)
library(glue)

library(plotly)
library(gt)

rm(list = ls())
invisible(sapply(list.files("R", full.names = T), FUN = source))

ui <- page_fillable(
  title = "DistViz",
  theme = bs_theme(version = 5) |>
    bs_theme_update(code_font = font_collection(font_google("Fira Code"),
                                                "monospace"),
                    preset = "journal"),
  useShinyjs(),
  layout_columns(
    col_widths = c(2, 10),
    # Controls
    card(
      card_header("Select distribution"),
      selectInput(inputId = "distr_select",
                  label = "Select distribution",
                  choices = c(
                    "Normal distribution" = "normal",
                    "Student distribution" = "studentt"
                  )),
      uiOutput("distr_show"),
      textOutput("distr_info")
    ),
    # plots
    layout_column_wrap(
      width = 1/2,
      card(
        card_header("Probability distribution function (PDF)"),
        plotlyOutput("pdf")
      ),
      card(
        card_header("Cumulative distribution function (PDF)"),
        plotlyOutput("cdf")
      ),
      card(
        card_header("Characteristics of distribution"),
        gt_output("info"),
      ),
      card(
        card_header("Characteristics of distribution"),
        "STRL"
      )
    )
  )
)

server <- function(input, output, session) {

  distributions <- reactiveValues(
    # TODO: Distribution parser který ověří že existuje (ochrana proti code
    # injection)
    normal = distr_normal_server("normal"),
    studentt = distr_studentt_server("studentt")
  )

  distr <- NULL
  observe({
    # TODO: Distribution parser který ověří že existuje (ochrana proti code
    # injection)
    # browser()
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
    plot_pdf(distr$distr)
  }) |>
    bindEvent({
      list(input$distr_select, distr$react)
    })

  output$cdf <- renderPlotly({
    plot_cdf(distr$distr)
  }) |>
    bindEvent({
      list(input$distr_select, distr$react)
    })

  output$info <- render_gt({
    mtcars |>
      head() |>
      gt()
  })
}

shinyApp(ui, server)

