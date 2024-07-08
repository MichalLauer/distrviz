distr_hypergeometric_ui <- function(namespace) {
  ns <- NS(namespace)
  tagList(
    card(
      card_header(
        "Probability"
      ),
      card_body(
        control_size_ui(namespace, label = "Size (N)"),
        control_successes_ui(namespace),
        control_failures_ui(namespace)
      )
    ),
    card(
      card_header(
        "Size"
      ),
      card_body(
        control_draws_ui(namespace)
      )
    )
  )
}

distr_hypergeometric_server <- function(namespace) {
  ns <- NS(namespace)

  moduleServer(namespace, function(input, output, session) {

    # Validators ---------------------------------------------------------------
    iv <- InputValidator$new()
    control_successes_server(namespace=namespace, iv=iv)
    observe({
      iv$add_rule("successes", function(s) {
        N <- input$size
        if ( !(s <= N) ) {
          "'Successes' must be <= 'Size'"
        }
      })
    }) |> 
      bindEvent(input$successes)

    control_failures_server(namespace=namespace, iv=iv)
    observe({
      iv$add_rule("failures", function(f) {
        N <- input$size
        if ( !(f <= N) ) {
          "'Failures' must be <= 'Size'"
        }
      })
    }) |> 
      bindEvent(input$failures)

    control_draws_server(namespace=namespace, iv=iv)
    observe({
      iv$add_rule("draws", function(d) {
        N <- input$size
        if ( !(d <= N) ) {
          "'Draws' must be <= 'Size'"
        }
      })
    }) |> 
      bindEvent(input$draws)

    control_size_server(namespace=namespace, iv=iv)
    iv$enable()
    
    # Reactor ------------------------------------------------------------------
    observe({
      req(iv$is_valid())
      
      distr$distr$setParameterValue(draws = input$draws)
      distr$react <- runif(1)
    }) |>
      bindEvent(input$draws, ignoreInit = TRUE)

    observe({
      req(iv$is_valid())
      
      distr$distr <- Hypergeometric$new(size = input$size, draws = input$draws,
                                        successes = input$successes)
      distr$react <- runif(1)

      update_control(namespace = namespace,
                     distr = distr$distr,
                     ignore = "")
    }) |>
      bindEvent(input$size, ignoreInit = TRUE)

    observe({
      req(iv$is_valid())
      
      distr$distr <- Hypergeometric$new(size = input$size, draws = input$draws,
                                       failures = input$failures)
      distr$react <- runif(1)
      
      update_control(namespace = namespace,
                     distr = distr$distr,
                     ignore = "failures")
    }) |>
      bindEvent(input$failures, ignoreInit = TRUE)

    observe({
      req(iv$is_valid())
      
      distr$distr <- Hypergeometric$new(size = input$size, draws = input$draws,
                                        successes = input$successes)
      distr$react <- runif(1)
      
      update_control(namespace = namespace,
                     distr = distr$distr,
                     ignore = "successes")
    }) |>
      bindEvent(input$successes, ignoreInit = TRUE)

    # Distribution controller --------------------------------------------------
    distr <- reactiveValues(
      distr = Hypergeometric$new(),
      iv = iv
    )

    return(distr)
  })

}
