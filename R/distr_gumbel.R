distr_gumbel_ui <- function(namespace) {
  ns <- NS(namespace)
  tagList(
    card(
      card_header(
        "Parameters"
      ),
      card_body(
        control_location_ui(namespace),
        control_scale_ui(namespace)
      )
    )
  )
}

distr_gumbel_server <- function(namespace) {
  ns <- NS(namespace)

  moduleServer(namespace, function(input, output, session) {

    # Validators ---------------------------------------------------------------
    iv <- InputValidator$new()
    control_location_server(namespace=namespace, iv=iv)
    control_scale_server(namespace=namespace, iv=iv)

    # Reactor ------------------------------------------------------------------
    observe({
      req(iv$is_valid())

      distr$distr$setParameterValue(location = input$location)
      distr$react <- runif(1)
    }) |>
      bindEvent(input$location, ignoreInit = TRUE)

    observe({
      req(iv$is_valid())
      
      distr$distr$setParameterValue(scale = input$scale)
      distr$react <- runif(1)
    }) |>
      bindEvent(input$scale, ignoreInit = TRUE)

    # Distribution controller --------------------------------------------------
    distr <- reactiveValues(
      distr = Gumbel$new(),
      iv = iv
    )

    return(distr)
  })

}
