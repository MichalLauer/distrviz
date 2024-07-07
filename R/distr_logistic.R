distr_logistic_ui <- function(namespace) {
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
        control_scale_ui(namespace),
        control_sd_ui(namespace)
      )
    )
  )
}

distr_logistic_server <- function(namespace) {
  ns <- NS(namespace)

  moduleServer(namespace, function(input, output, session) {

    # Validators ---------------------------------------------------------------
    iv <- InputValidator$new()
    control_mean_server(namespace=namespace, iv=iv)
    control_scale_server(namespace=namespace, iv=iv)
    control_sd_server(namespace=namespace, iv=iv)
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

      distr$distr <- Logistic$new(mean = input$mean, scale = input$scale)
      distr$react <- runif(1)

      update_control(namespace = namespace,
                     distr = distr$distr,
                     ignore = "scale")
    }) |>
      bindEvent(input$scale, ignoreInit = TRUE)

    observe({
      req(iv$is_valid())

      distr$distr <- Logistic$new(mean = input$mean, sd = input$sd)
      distr$react <- runif(1)

      update_control(namespace = namespace,
                     distr = distr$distr,
                     ignore = "sd")
    }) |>
      bindEvent(input$sd, ignoreInit = TRUE)

    # Distribution controller --------------------------------------------------
    distr <- reactiveValues(
      distr = Logistic$new(),
      iv = iv
    )

    return(distr)
  })

}
