distr_poisson_ui <- function(namespace) {
  card(
    card_header(
      "Central tendency"
    ),
    card_body(
      control_rate_ui(namespace)
    )
  )
}

distr_poisson_server <- function(namespace) {
  ns <- NS(namespace)

  moduleServer(namespace, function(input, output, session) {

    # Validators ---------------------------------------------------------------
    iv <- InputValidator$new()
    control_rate_server(namespace=namespace, iv=iv)
    iv$enable()

    # Reactor ------------------------------------------------------------------
    observe({
      req(iv$is_valid())

      distr$distr$setParameterValue(rate = input$rate)
      distr$react <- runif(1)
    }) |>
      bindEvent(input$rate, ignoreInit = TRUE)

    # Distribution controller --------------------------------------------------
    distr <- reactiveValues(
      distr = Poisson$new(),
      iv = iv
    )

    return(distr)
  })

}
