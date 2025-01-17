distr_chisquared_ui <- function(namespace) {
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

distr_chisquared_server <- function(namespace) {

  moduleServer(namespace, function(input, output, session) {

    # Validators ---------------------------------------------------------------
    iv <- InputValidator$new()
    control_df_server(namespace=namespace, iv=iv)
    iv$enable()

    # Reactor ------------------------------------------------------------------
    observe({
      req(iv$is_valid())
      
      distr$distr$setParameterValue(df = input$df)
      distr$react <- runif(1)
    }) |>
      bindEvent(input$df, ignoreInit = TRUE)

    # Distribution controller --------------------------------------------------
    distr <- reactiveValues(
      distr = ChiSquared$new(),
      iv = iv
    )

    return(distr)
  })

}
