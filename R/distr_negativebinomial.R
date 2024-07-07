distr_negativebinomial_ui <- function(namespace) {
  ns <- NS(namespace)
  tagList(
    card(
      card_header(
        "Probability"
      ),
      card_body(
        control_mean_ui(namespace),
        control_prob_ui(namespace),
        control_qprob_ui(namespace)
      )
    ),
    card(
      card_header(
        "Size"
      ),
      card_body(min_height = "250px",
      control_nbform_ui(namespace),
      control_size_ui(namespace,
                      label = "Trials (K)")
      )
    )
  )
}

distr_negativebinomial_server <- function(namespace) {
  ns <- NS(namespace)

  moduleServer(namespace, function(input, output, session) {

    # Validators ---------------------------------------------------------------
    iv <- InputValidator$new()
    control_mean_server(namespace=namespace, iv=iv)
    control_prob_server(namespace=namespace, iv=iv)
    control_qprob_server(namespace=namespace, iv=iv)
    control_size_server(namespace=namespace, iv=iv)
    control_nbform_server(namespace=namespace, iv=iv)
    iv$enable()
    
    # Reactor ------------------------------------------------------------------
    observe({
      req(iv$is_valid())
      
      distr$distr <- NegativeBinomial$new(size = input$size, mean = input$mean, form = input$form)
      distr$react <- runif(1)

      update_control(namespace = namespace,
                     distr = distr$distr,
                     ignore = "mean")
    }) |>
      bindEvent(input$mean, ignoreInit = TRUE)

    observe({
      req(iv$is_valid())
      
      distr$distr <- NegativeBinomial$new(size = input$size, prob = input$prob, form = input$form)
      distr$react <- runif(1)

      update_control(namespace = namespace,
                     distr = distr$distr,
                     ignore = "prob")
    }) |>
      bindEvent(input$prob, ignoreInit = TRUE)

    observe({
      req(iv$is_valid())
      
      distr$distr <- NegativeBinomial$new(size = input$size, qprob = input$qprob, form = input$form)
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

    observe({
      req(iv$is_valid())
      
      m <- distr$distr$getParameterValue("mean")
      distr$distr <- NegativeBinomial$new(size = input$size,
                                          form = input$form,
                                          mean = m)
      distr$react <- runif(1)
    }) |>
      bindEvent(input$form, ignoreInit = TRUE)
    # Distribution controller --------------------------------------------------
    distr <- reactiveValues(
      distr = NegativeBinomial$new(),
      iv = iv
    )

    return(distr)
  })

}
