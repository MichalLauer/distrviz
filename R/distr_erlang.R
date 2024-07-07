distr_erlang_ui <- function(namespace) {
  ns <- NS(namespace)
  tagList(
    card(
      card_header(
        "Location"
      ),
      card_body(
        control_rate_ui(namespace),
        control_scale_ui(namespace)
      )
    ),
    card(
      card_header(
        "Shape"
      ),
      card_body(
        control_shape_ui(namespace)
      )
    )
  )
}

distr_erlang_server <- function(namespace) {
  ns <- NS(namespace)

  moduleServer(namespace, function(input, output, session) {

    # Validators ---------------------------------------------------------------
    iv <- InputValidator$new()
    control_rate_server(namespace=namespace, iv=iv, input=input)
    control_scale_server(namespace=namespace, iv=iv, input=input)
    control_shape_server(namespace=namespace, iv=iv)
    iv$enable()
    
    # Reactor ------------------------------------------------------------------
    observe({
      req(iv$is_valid())
      
      distr$distr <- Erlang$new(rate = input$rate, shape = input$shape)
      distr$react <- runif(1)

      update_control(namespace = namespace,
                     distr = distr$distr,
                     ignore = "rate")
    }) |>
      bindEvent(input$rate, ignoreInit = TRUE)

    observe({
      req(iv$is_valid())
      
      distr$distr <- Erlang$new(scale = input$scale, shape = input$shape)
      distr$react <- runif(1)
      
      update_control(namespace = namespace,
                     distr = distr$distr,
                     ignore = "scale")
    }) |>
      bindEvent(input$scale, ignoreInit = TRUE)

    observe({
      req(iv$is_valid())
      
      distr$distr$setParameterValue(shape = input$shape)
      distr$react <- runif(1)
    }) |>
      bindEvent(input$shape, ignoreInit = TRUE)

    # Distribution controller --------------------------------------------------
    distr <- reactiveValues(
      distr = Erlang$new(),
      iv = iv
    )

    return(distr)
  })

}
