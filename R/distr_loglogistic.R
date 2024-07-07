distr_loglogistic_ui <- function(namespace) {
  ns <- NS(namespace)
  tagList(
    card(
      card_header(
        "Central tendency"
      ),
      card_body(
        control_rate_ui(namespace),
        control_scale_ui(namespace)
      )
    ),
    card(
      card_header(
        "Measure of variance"
      ),
      card_body(
        control_shape_ui(namespace)
      )
    )
  )
}

distr_loglogistic_server <- function(namespace) {
  ns <- NS(namespace)

  moduleServer(namespace, function(input, output, session) {

    # Validators ---------------------------------------------------------------
    iv <- InputValidator$new()
    control_rate_server(namespace=namespace, iv=iv)
    control_scale_server(namespace=namespace, iv=iv)
    control_shape_server(namespace=namespace, iv=iv)
    iv$enable()

    # Reactor ------------------------------------------------------------------
    observe({
      req(iv$is_valid())
      
      distr$distr$setParameterValue(shape = input$shape)
      distr$react <- runif(1)
    }) |>
      bindEvent(input$shape, ignoreInit = TRUE)


    observe({
      req(iv$is_valid())

      distr$distr <- Loglogistic$new(shape = input$shape, scale = input$scale)
      distr$react <- runif(1)

      update_control(namespace = namespace,
                     distr = distr$distr,
                     ignore = "scale")
    }) |>
      bindEvent(input$scale, ignoreInit = TRUE)

    observe({
      req(iv$is_valid())

      distr$distr <- Loglogistic$new(shape = input$shape, rate = input$rate)
      distr$react <- runif(1)

      update_control(namespace = namespace,
                     distr = distr$distr,
                     ignore = "rate")
    }) |>
      bindEvent(input$rate, ignoreInit = TRUE)

    # Distribution controller --------------------------------------------------
    distr <- reactiveValues(
      distr = Loglogistic$new(),
      iv = iv
    )

    return(distr)
  })

}
