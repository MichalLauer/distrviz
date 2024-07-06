distr_beta_ui <- function(namespace) {
  ns <- NS(namespace)
  tagList(
    card(
      card_header(
        "Parameters"
      ),
      card_body(
        control_alpha_ui(namespace),
        control_beta_ui(namespace)
      )
    )
  )
}

distr_beta_server <- function(namespace) {
  ns <- NS(namespace)

  moduleServer(namespace, function(input, output, session) {

    # Validators ---------------------------------------------------------------
    iv <- InputValidator$new()
    control_alpha_server(namespace=namespace, iv=iv)
    control_beta_server(namespace=namespace, iv=iv)
    iv$enable()

    # Reactor ------------------------------------------------------------------
    observe({
      req(iv$is_valid())
      
      distr$distr$setParameterValue(shape1 = input$shape1)
      distr$react <- runif(1)
    }) |>
      bindEvent(input$shape1, ignoreInit = TRUE)

    observe({
      req(iv$is_valid())
      
      distr$distr$setParameterValue(shape2 = input$shape2)
      distr$react <- runif(1)
    }) |>
      bindEvent(input$shape2, ignoreInit = TRUE)

    # Distribution controller --------------------------------------------------
    distr <- reactiveValues(
      distr = Beta$new(),
      iv = iv
    )

    return(distr)
  })

}
