distr_betanoncentral_ui <- function(namespace) {
  ns <- NS(namespace)
  tagList(
    card(
      card_header(
        "Parameters"
      ),
      card_body(
        control_location_ui(namespace),
        control_alpha_ui(namespace),
        control_beta_ui(namespace)
      )
    )
  )
}

distr_betanoncentral_server <- function(namespace) {
  ns <- NS(namespace)

  moduleServer(namespace, function(input, output, session) {

    # Validators ---------------------------------------------------------------
    iv <- InputValidator$new()
    control_alpha_server(namespace, input, iv)
    control_beta_server(namespace, input, iv)
    control_location_server(namespace, input, iv)
    iv$enable()

    # Reactor ------------------------------------------------------------------
    observe({
      req(iv$is_valid())

      distr$distr$setParameterValue(shape1 = input$alpha)
      distr$react <- runif(1)
    }) |>
      bindEvent(input$alpha, ignoreInit = TRUE)

    observe({
      req(iv$is_valid())

      distr$distr$setParameterValue(shape2 = input$beta)
      distr$react <- runif(1)
    }) |>
      bindEvent(input$beta, ignoreInit = TRUE)

    observe({
      req(iv$is_valid())

      distr$distr$setParameterValue(location = input$location)
      distr$react <- runif(1)
    }) |>
      bindEvent(input$location, ignoreInit = TRUE)

    # Distribution controller --------------------------------------------------
    distr <- reactiveValues(
      distr = BetaNoncentral$new(),
      iv = iv
    )

    return(distr)
  })

}
