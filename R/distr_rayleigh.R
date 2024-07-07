distr_rayleigh_ui <- function(namespace) {
  ns <- NS(namespace)
  tagList(
    card(
      card_header(
        "Parameters"
      ),
      card_body(
        control_mode_ui(namespace)
      )
    )
  )
}

distr_rayleigh_server <- function(namespace) {
  ns <- NS(namespace)

  moduleServer(namespace, function(input, output, session) {

    # Validators ---------------------------------------------------------------
    iv <- InputValidator$new()
    control_mode_server(namespace=namespace, iv=iv)

    # Reactor ------------------------------------------------------------------
    observe({
      req(iv$is_valid())

      distr$distr$setParameterValue(mode = input$mode)
      distr$react <- runif(1)
    }) |>
      bindEvent(input$mode, ignoreInit = TRUE)

    # Distribution controller --------------------------------------------------
    distr <- reactiveValues(
      distr = Rayleigh$new(),
      iv = iv
    )

    return(distr)
  })

}
