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

  moduleServer(namespace, function(input, output, session) {

    # Validators ---------------------------------------------------------------
    iv <- InputValidator$new()
    control_df_server(namespace, input, iv)
    iv$enable()

    # Degrees of freedom Controller --------------------------------------------
    observe({
      distr$distr$setParameterValue(df = input$df)
      distr$react <- runif(1)
    }) |>
      bindEvent(input$df, ignoreInit = TRUE)

    # Distribution controller --------------------------------------------------
    distr <- reactiveValues(
      distr = StudentT$new(),
      iv = iv
    )

    return(distr)
  })

}
