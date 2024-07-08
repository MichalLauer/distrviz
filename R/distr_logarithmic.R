distr_logarithmic_ui <- function(namespace) {
  card(
    card_header(
      "Probability"
    ),
    card_body(
      control_theta_ui(namespace)
    )
  )
}

distr_logarithmic_server <- function(namespace) {
  ns <- NS(namespace)

  moduleServer(namespace, function(input, output, session) {

    # Validators ---------------------------------------------------------------
    iv <- InputValidator$new()
    control_theta_server(namespace=namespace, iv=iv)
    iv$enable()
    
    # Reactor ------------------------------------------------------------------
    observe({
      req(iv$is_valid())
      
      distr$distr <- Logarithmic$new(theta = input$theta)
      distr$react <- runif(1)
    }) |>
      bindEvent(input$theta, ignoreInit = TRUE)

    # Distribution controller --------------------------------------------------
    distr <- reactiveValues(
      distr = Logarithmic$new(),
      iv = iv
    )

    return(distr)
  })

}
