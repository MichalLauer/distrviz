distr_frechet_ui <- function(namespace) {
  ns <- NS(namespace)
  tagList(
    card(
      card_header(
        "Parameters"
      ),
      card_body(
        control_scale_ui(namespace),
        control_shape_ui(namespace),
        control_minimum_ui(namespace)
      )
    )
  )
}

distr_frechet_server <- function(namespace) {
  ns <- NS(namespace)

  moduleServer(namespace, function(input, output, session) {

    # Validators ---------------------------------------------------------------
    iv <- InputValidator$new()
    control_scale_server(namespace=namespace, iv=iv)
    control_shape_server(namespace=namespace, iv=iv)
    control_minimum_server(namespace=namespace, iv=iv)
    iv$enable()

    # Reactor ------------------------------------------------------------------
    observe({
      req(iv$is_valid())
      
      distr$distr$setParameterValue(scale = input$scale)
      distr$react <- runif(1)
    }) |>
      bindEvent(input$scale, ignoreInit = TRUE)

    observe({
      req(iv$is_valid())
      
      distr$distr$setParameterValue(shape = input$shape)
      distr$react <- runif(1)
    }) |>
      bindEvent(input$shape, ignoreInit = TRUE)

    observe({
      req(iv$is_valid())
      
      distr$distr$setParameterValue(minimum = input$minimum)
      distr$react <- runif(1)
    }) |>
      bindEvent(input$minimum, ignoreInit = TRUE)
    # Distribution controller --------------------------------------------------
    distr <- reactiveValues(
      distr = Frechet$new(),
      iv = iv
    )

    return(distr)
  })

}
