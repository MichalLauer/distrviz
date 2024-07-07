distr_binomial_ui <- function(namespace) {
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
        control_size_ui(namespace)
      )
    )
  )
}

distr_binomial_server <- function(namespace) {
  ns <- NS(namespace)

  moduleServer(namespace, function(input, output, session) {

    # Validators ---------------------------------------------------------------
    iv <- InputValidator$new()
    control_prob_server(namespace=namespace, iv=iv, input=input)
    control_qprob_server(namespace=namespace, iv=iv, input=input)
    control_size_server(namespace=namespace, iv=iv)
    iv$enable()
    
    # Reactor ------------------------------------------------------------------
    observe({
      req(iv$is_valid())
      
      distr$distr <- Binomial$new(size = input$size, prob = input$prob)
      distr$react <- runif(1)

      update_control(namespace = namespace,
                     distr = distr$distr,
                    ignore = "prob")
    }) |>
      bindEvent(input$prob, ignoreInit = TRUE)

    observe({
      req(iv$is_valid())
      
      distr$distr <- Binomial$new(size = input$size, qprob = input$qprob)
      distr$react <- runif(1)
      
      update_control(namespace = namespace,
                     distr = distr$distr,
                     ignore = "qprob")
    }) |>
      bindEvent(input$qprob, ignoreInit = TRUE)

    observe({
      req(iv$is_valid())
      
      distr$distr$setParameterValue(size = input$size)
      distr$react <- runif(1)
    }) |>
      bindEvent(input$size, ignoreInit = TRUE)

    # Distribution controller --------------------------------------------------
    distr <- reactiveValues(
      distr = Binomial$new(),
      iv = iv
    )

    return(distr)
  })

}
