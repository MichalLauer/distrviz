distr_exponential_ui <- function(namespace) {
  card(
    card_header(
      "Location"
    ),
    card_body(
      control_rate_ui(namespace),
      control_scale_ui(namespace)
    )
  )
}

distr_exponential_server <- function(namespace) {
  ns <- NS(namespace)

  moduleServer(namespace, function(input, output, session) {

    # Validators ---------------------------------------------------------------
    iv <- InputValidator$new()
    control_rate_server(namespace=namespace, iv=iv, input=input,
                        react_on = "scale")
    control_scale_server(namespace=namespace, iv=iv, input=input,
                         react_on = "rate")
    iv$enable()
    
    # Reactor ------------------------------------------------------------------
    observe({
      req(iv$is_valid())
      
      distr$distr <- Exponential$new(rate = input$rate)
      distr$react <- runif(1)
    }) |>
      bindEvent(input$rate, ignoreInit = TRUE)

    observe({
      req(iv$is_valid())
      
      distr$distr <- Exponential$new(scale = input$scale)
      distr$react <- runif(1)
    }) |>
      bindEvent(input$scale, ignoreInit = TRUE)

    # Distribution controller --------------------------------------------------
    distr <- reactiveValues(
      distr = Exponential$new(),
      iv = iv
    )

    return(distr)
  })

}
