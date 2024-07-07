distr_laplace_ui <- function(namespace) {
  ns <- NS(namespace)
  tagList(
    card(
      card_header(
        "Central tendency"
      ),
      card_body(
        control_mean_ui(namespace)
      )
    ),
    card(
      card_header(
        "Measure of variance"
      ),
      card_body(
        control_var_ui(namespace),
        control_scale_ui(namespace)
      )
    )
  )
}

distr_laplace_server <- function(namespace) {
  ns <- NS(namespace)

  moduleServer(namespace, function(input, output, session) {

    # Validators ---------------------------------------------------------------
    iv <- InputValidator$new()
    control_mean_server(namespace=namespace, iv=iv)
    control_var_server(namespace=namespace, iv=iv)
    control_scale_server(namespace=namespace, iv=iv)
    iv$enable()

    # Reactor ------------------------------------------------------------------
    observe({
      req(iv$is_valid())
      
      distr$distr$setParameterValue(mean = input$mean)
      distr$react <- runif(1)
    }) |>
      bindEvent(input$mean, ignoreInit = TRUE)


    observe({
      req(iv$is_valid())

      distr$distr <- Laplace$new(mean = input$mean, var = input$var)
      distr$react <- runif(1)

      update_control(namespace = namespace,
                     ids = c("scale"),
                     distr = distr$distr)
    }) |>
      bindEvent(input$var, ignoreInit = TRUE)

    observe({
      req(iv$is_valid())

      distr$distr <- Laplace$new(mean = input$mean, scale = input$scale)
      distr$react <- runif(1)

      update_control(namespace = namespace,
                     ids = c("var"),
                     distr = distr$distr)
    }) |>
      bindEvent(input$scale, ignoreInit = TRUE)

    # Distribution controller --------------------------------------------------
    distr <- reactiveValues(
      distr = Laplace$new(),
      iv = iv
    )

    return(distr)
  })

}
