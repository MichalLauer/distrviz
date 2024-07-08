distr_geometric_ui <- function(namespace) {
  ns <- NS(namespace)
  tagList(
    card(
      card_header(
        "Probability"
      ),
      card_body(
        control_prob_ui(namespace),
        control_qprob_ui(namespace)
      )
    ),
    card(
      card_header(
        "Size"
      ),
      card_body(
        control_trials_ui(namespace)
      )
    )
  )
}

distr_geometric_server <- function(namespace) {
  ns <- NS(namespace)

  moduleServer(namespace, function(input, output, session) {

    # Validators ---------------------------------------------------------------
    iv <- InputValidator$new()
    control_prob_server(namespace=namespace, iv=iv)
    control_qprob_server(namespace=namespace, iv=iv)
    control_trials_server(namespace=namespace, iv=iv)
    iv$enable()
    
    # Reactor ------------------------------------------------------------------
    observe({
      req(iv$is_valid())
      
      distr$distr <- Geometric$new(trials = input$trials, prob = input$prob)
      distr$react <- runif(1)

      update_control(namespace = namespace,
                     distr = distr$distr,
                     ignore = "prob")
    }) |>
      bindEvent(input$prob, ignoreInit = TRUE)

    observe({
      req(iv$is_valid())
      
      distr$distr <- Geometric$new(trials = input$trials, qprob = input$qprob)
      distr$react <- runif(1)
      
      update_control(namespace = namespace,
                     distr = distr$distr,
                     ignore = "qprob")
    }) |>
      bindEvent(input$qprob, ignoreInit = TRUE)

    observe({
      req(iv$is_valid())
      
      p <- distr$distr$getParameterValue("prob")
      distr$distr <- Geometric$new(trials = input$trials, prob = p)
      distr$react <- runif(1)
    }) |>
      bindEvent(input$trials, ignoreInit = TRUE)

    # Distribution controller --------------------------------------------------
    distr <- reactiveValues(
      distr = Geometric$new(),
      iv = iv
    )

    return(distr)
  })

}
