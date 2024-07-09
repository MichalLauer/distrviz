distr_degenerate_ui <- function(namespace) {
  card(
    card_header(
      "Shape"
    ),
    card_body(
      control_mean_ui(namespace)
    )
  )
}

distr_degenerate_server <- function(namespace) {
  ns <- NS(namespace)

  moduleServer(namespace, function(input, output, session) {

    # Validators ---------------------------------------------------------------
    iv <- InputValidator$new()
    control_mean_server(namespace=namespace, iv=iv)
    iv$enable()
    
    # Reactor ------------------------------------------------------------------
    observe({
      req(iv$is_valid())
      
      distr$distr$setParameterValue(mean = input$mean)
      distr$react <- runif(1)
    }) |>
      bindEvent(input$mean, ignoreInit = TRUE)

    # Distribution controller --------------------------------------------------
    distr <- reactiveValues(
      distr = Degenerate$new(),
      iv = iv
    )

    return(distr)
  })

}
