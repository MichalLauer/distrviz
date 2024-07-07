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
    observe({
      iv$add_rule("lower", function(l) {
        u <- as.numeric(input$upper)
        if ( !(l <= u) ) {
          "'Lower' must be <= 'Upper'"
        }
      })
    }) |> 
      bindEvent(input$lower)

    control_upper_server(namespace=namespace, iv=iv)
    observe({
      iv$add_rule("upper", function(u) {
        l <- as.numeric(input$lower)
        if ( !(u >= l) ) {
          "'Upper' must be >= 'Lower'"
        }
      })
    }) |> 
      bindEvent(input$upper)

    iv$enable()

    # Reactor ------------------------------------------------------------------
    observe({
      req(iv$is_valid())

      distr$distr <- Arcsine$new(lower = input$lower, upper = input$upper)
      distr$react <- runif(1)
    }) |>
      bindEvent(input$lower, input$upper, ignoreInit = TRUE)


    # Distribution controller --------------------------------------------------
    distr <- reactiveValues(
      distr = Arcsine$new(),
      iv = iv
    )

    return(distr)
  })

}
