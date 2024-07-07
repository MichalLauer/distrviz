distr_triangular_ui <- function(namespace) {
  ns <- NS(namespace)
  tagList(
    card(
      card_header(
        "Parameters"
      ),
      card_body(
        control_lower_ui(namespace),
        control_mode_ui(namespace),
        control_upper_ui(namespace),
        control_symmetric_ui(namespace)
      )
    )
  )
}

distr_triangular_server <- function(namespace) {
  ns <- NS(namespace)

  moduleServer(namespace, function(input, output, session) {

    # Validators ---------------------------------------------------------------
    iv <- InputValidator$new()
    control_lower_server(namespace=namespace, iv=iv)
    observe({
      iv$add_rule("lower", function(l) {
        u <- as.numeric(input$upper)
        if ( !(l < u) ) {
          "'Lower' must be < 'Upper'"
        }
      })
    }) |> 
      bindEvent(input$lower)

    control_upper_server(namespace=namespace, iv=iv)
    observe({
      iv$add_rule("upper", function(u) {
        l <- as.numeric(input$lower)
        if ( !(u > l) ) {
          "'Upper' must be > 'Lower'"
        }
      })
    }) |> 
      bindEvent(input$upper)

    control_mode_server(namespace=namespace, iv=iv)
    observe({
      iv$add_rule("mode", function(m) {
        if (input$symmetric) {
          return(NULL)
        }

        l <- as.numeric(input$lower)
        u <- as.numeric(input$upper)

        if ( !(m > l) ) {
          "'Mode' must be > 'Lower'"
        } else if ( !(m < u) ) {
          "'Mode' must be < 'Upper'"
        } else {
          NULL
        }
      })
    }) |> 
      bindEvent(input$mode)

    control_symmetric_server(namespace=namespace, iv=iv)

    iv$enable()

    # Reactor ------------------------------------------------------------------
    # All parameters need to be updated altogether; otherwise, some might be invalid
    observe({
      req(iv$is_valid())

      if (input$symmetric) {
        distr$distr <- Triangular$new(lower = input$lower, upper = input$upper,
                                      symmetric = TRUE)
      } else {
        distr$distr <- Triangular$new(lower = input$lower, upper = input$upper,
                                      symmetric = FALSE, mode = input$mode)
      }

      distr$react <- runif(1)
    }) |>
      bindEvent(input$lower, input$mode, input$upper, input$symmetric, 
                ignoreInit = TRUE)

    observe({
      if (input$symmetric) {
        disable("mode")
      } else {
        enable("mode")
      }
    }) |>
      bindEvent(input$symmetric, ignoreInit = TRUE)


    # Distribution controller --------------------------------------------------
    distr <- reactiveValues(
      distr = Triangular$new(),
      iv = iv
    )

    return(distr)
  })

}
