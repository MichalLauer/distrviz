distr_chisquarednoncentral_ui <- function(namespace) {
  ns <- NS(namespace)
  card(
    card_header(
      "Central tendency"
    ),
    card_body(
      control_df_ui(namespace),
      control_location_ui(namespace)

    )
  )
}

distr_chisquarednoncentral_server <- function(namespace) {

  moduleServer(namespace, function(input, output, session) {

    # Validators ---------------------------------------------------------------
    iv <- InputValidator$new()
    control_df_server(namespace=namespace, iv=iv)
    control_location_server(namespace=namespace, iv=iv)
    iv$enable()

    # Reactor ------------------------------------------------------------------
    observe({
      req(iv$is_valid())
      
      distr$distr$setParameterValue(df = input$df)
      distr$react <- runif(1)
    }) |>
      bindEvent(input$df, ignoreInit = TRUE)

    observe({
      req(iv$is_valid())
      
      distr$distr$setParameterValue(location = input$location)
      distr$react <- runif(1)
    }) |>
      bindEvent(input$location, ignoreInit = TRUE)

    # Distribution controller --------------------------------------------------
    distr <- reactiveValues(
      distr = ChiSquaredNoncentral$new(),
      iv = iv
    )

    return(distr)
  })

}
