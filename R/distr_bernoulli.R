distr_bernoulli_ui <- function(namespace) {
  card(
    card_header(
      "Probability"
    ),
    card_body(
      control_prob_ui(namespace),
      control_qprob_ui(namespace)
    )
  )
}

distr_bernoulli_server <- function(namespace) {
  ns <- NS(namespace)

  moduleServer(namespace, function(input, output, session) {

    # Validators ---------------------------------------------------------------
    iv <- InputValidator$new()
    control_prob_server(namespace=namespace, iv=iv)
    control_qprob_server(namespace=namespace, iv=iv)
    iv$enable()
    
    # Reactor ------------------------------------------------------------------
    observe({
      req(iv$is_valid())
      
      distr$distr <- Bernoulli$new(prob = input$prob)
      distr$react <- runif(1)

      update_control(namespace = namespace,
                     distr = distr$distr,
                    ignore = "prob")
    }) |>
      bindEvent(input$prob, ignoreInit = TRUE)

    observe({
      req(iv$is_valid())
      
      distr$distr <- Bernoulli$new(qprob = input$qprob)
      distr$react <- runif(1)
      
      update_control(namespace = namespace,
                     distr = distr$distr,
                     ignore = "qprob")
    }) |>
      bindEvent(input$qprob, ignoreInit = TRUE)

    # Distribution controller --------------------------------------------------
    distr <- reactiveValues(
      distr = Bernoulli$new(),
      iv = iv
    )

    return(distr)
  })

}
