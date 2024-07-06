distr_arcsine_ui <- function(namespace) {
  ns <- NS(namespace)
  tagList(
    card(
      card_header(
        "Parameters"
      ),
      card_body(
        control_lower_ui(namespace),
        control_upper_ui(namespace)
      )
    )
  )
}

distr_arcsine_server <- function(namespace) {
  ns <- NS(namespace)

  moduleServer(namespace, function(input, output, session) {

    # Validators ---------------------------------------------------------------
    iv <- InputValidator$new()
    control_lower_server(namespace=namespace, iv=iv)
    control_upper_server(namespace=namespace, iv=iv)
    
    iv$add_rule("upper", function(u) {
      req(input$lower)
      req(input$upper)

      l <- as.numeric(input$lower)
      if (u < l) {
        "'Lower' must be <= 'Upper'"
      }
    })
    iv$enable()

    # Reactor ------------------------------------------------------------------
    observe({
      req(iv$is_valid())

      distr$distr$setParameterValue(lower = input$lower)
      distr$react <- runif(1)
    }) |>
      bindEvent(input$lower, ignoreInit = TRUE)

    observe({
      req(iv$is_valid())
      
      distr$distr$setParameterValue(upper = input$upper)
      distr$react <- runif(1)
    }) |>
      bindEvent(input$upper, ignoreInit = TRUE)

    # Distribution controller --------------------------------------------------
    distr <- reactiveValues(
      distr = Arcsine$new(),
      iv = iv
    )

    return(distr)
  })

}
