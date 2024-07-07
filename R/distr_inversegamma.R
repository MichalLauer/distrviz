distr_inversegamma_ui <- function(namespace) {
  card(
    card_header(
      "Location"
    ),
    card_body(
      control_scale_ui(namespace),
      control_shape_ui(namespace)
    )
  )
}

distr_inversegamma_server <- function(namespace) {
  ns <- NS(namespace)

  moduleServer(namespace, function(input, output, session) {

    # Validators ---------------------------------------------------------------
    iv <- InputValidator$new()
    control_scale_server(namespace=namespace, iv=iv)
    control_shape_server(namespace=namespace, iv=iv)
    iv$enable()
    
    # Reactor ------------------------------------------------------------------
    observe({
      req(iv$is_valid())
      
      distr$distr <- InverseGamma$new(scale = input$scale)
      distr$react <- runif(1)
    }) |>
      bindEvent(input$scale, ignoreInit = TRUE)

    observe({
      req(iv$is_valid())
      
      distr$distr <- InverseGamma$new(shape = input$shape)
      distr$react <- runif(1)
    }) |>
      bindEvent(input$shape, ignoreInit = TRUE)

    # Distribution controller --------------------------------------------------
    distr <- reactiveValues(
      distr = InverseGamma$new(),
      iv = iv
    )

    return(distr)
  })

}
