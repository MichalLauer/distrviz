distr_studentt_ui <- function(namespace) {
  ns <- NS(namespace)
  card(
    card_header(
      "Central tendency"
    ),
    card_body(
      control_df_ui(namespace)
    )
  )
}

distr_studentt_server <- function(namespace) {
  ns <- NS(namespace)

  moduleServer(namespace, function(input, output, session) {

    # Degrees of freedom Controller --------------------------------------------
    df <- control_df_server(namespace)
    observe({
      distr$distr$setParameterValue(df = input$df)
      distr$react <- runif(1)
    }) |>
      bindEvent(input$df, ignoreInit = TRUE)

    # Distribution controller --------------------------------------------------
    distr <- reactiveValues(
      distr = StudentT$new(),
      react = runif(1)
    )

    return(distr)
  })

}
