distr_weibull_ui <- function(namespace) {
  ns <- NS(namespace)
  tagList(
    card(
      card_header(
        "Location"
      ),
      card_body(
        control_scale_ui(namespace),
        control_altscale_ui(namespace)
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

distr_weibull_server <- function(namespace) {
  ns <- NS(namespace)

  moduleServer(namespace, function(input, output, session) {

    # Validators ---------------------------------------------------------------
    iv <- InputValidator$new()
    control_scale_server(namespace=namespace, iv=iv)
    control_altscale_server(namespace=namespace, iv=iv)
    control_shape_server(namespace=namespace, iv=iv)
    iv$enable()
    
    # Reactor ------------------------------------------------------------------
    observe({
      req(iv$is_valid())
      
      distr$distr <- Weibull$new(altscale = input$altscale, shape = input$shape)
      distr$react <- runif(1)

      update_control(namespace = namespace,
                     distr = distr$distr,
                     ignore = "altscale")
    }) |>
      bindEvent(input$altscale, ignoreInit = TRUE)

    observe({
      req(iv$is_valid())
      
      distr$distr <- Weibull$new(scale = input$scale, shape = input$shape)
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
      distr = Weibull$new(),
      iv = iv
    )

    return(distr)
  })

}
