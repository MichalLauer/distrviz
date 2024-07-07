distr_gamma_ui <- function(namespace) {
  tagList(
    card(
      card_header(
        "Location"
      ),
      card_body(
        control_mean_ui(namespace),
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

distr_gamma_server <- function(namespace) {
  ns <- NS(namespace)

  moduleServer(namespace, function(input, output, session) {

    # Validators ---------------------------------------------------------------
    iv <- InputValidator$new()
    control_mean_server(namespace=namespace, iv=iv)
    control_rate_server(namespace=namespace, iv=iv)
    control_scale_server(namespace=namespace, iv=iv)
    control_shape_server(namespace=namespace, iv=iv)
    iv$enable()
    
    # Reactor ------------------------------------------------------------------
    observe({
      req(iv$is_valid())
      
      distr$distr <- Gamma$new(mean = input$mean, shape = input$shape)
      distr$react <- runif(1)
      update_control(namespace = namespace,
                     ids = c("rate", "scale"),
                     distr = distr$distr)
    }) |>
      bindEvent(input$mean, ignoreInit = TRUE)

    observe({
      req(iv$is_valid())
      
      distr$distr <- Gamma$new(rate = input$rate, shape = input$shape)
      distr$react <- runif(1)
      update_control(namespace = namespace,
                     ids = c("mean", "scale"),
                     distr = distr$distr)
    }) |>
      bindEvent(input$rate, ignoreInit = TRUE)

    observe({
      req(iv$is_valid())
      
      distr$distr <- Gamma$new(scale = input$scale, shape = input$shape)
      distr$react <- runif(1)
      update_control(namespace = namespace,
                     ids = c("rate", "mean"),
                     distr = distr$distr)
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
      distr = Gamma$new(),
      iv = iv
    )

    return(distr)
  })

}
