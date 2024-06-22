distr_normal_ui <- function(namespace) {
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
        control_variance_ui(namespace),
        control_sd_ui(namespace),
        control_prec_ui(namespace)
      )
    )
  )
}

distr_normal_server <- function(namespace) {
  ns <- NS(namespace)

  moduleServer(namespace, function(input, output, session) {

    # Validators ---------------------------------------------------------------
    iv <- InputValidator$new()
    control_mean_server(namespace, input, iv)
    control_variance_server(namespace, input, iv,
                            react_on = reactiveValues("sd" = reactive(input$sd),
                                                      "prec" = reactive(input$prec)))
    control_sd_server(namespace, input, iv,
                      react_on = reactiveValues("var" = reactive(input$var),
                                                "prec" = reactive(input$prec)))
    control_prec_server(namespace, input, iv,
                        react_on = reactiveValues("var" = reactive(input$var),
                                                  "sd" = reactive(input$sd)))
    iv$enable()

    # Reactors -----------------------------------------------------------------
    observe({
      req(iv$is_valid())
      distr$distr$setParameterValue(mean = input$mean)
      distr$react <- runif(1)
    }) |>
      bindEvent(input$mean, ignoreInit = TRUE)


    observe({
      req(iv$is_valid())
      distr$distr <- Normal$new(mean = input$mean, var = input$var)
      distr$react <- runif(1)
    }) |>
      bindEvent(input$var, ignoreInit = TRUE)

    observe({
      req(iv$is_valid())
      distr$distr <- Normal$new(mean = input$mean, sd = input$sd)
      distr$react <- runif(1)
    }) |>
      bindEvent(input$sd, ignoreInit = TRUE)

    observe({
      req(iv$is_valid())
      distr$distr <- Normal$new(mean = input$mean, prec = input$prec)
      distr$react <- runif(1)
    }) |>
      bindEvent(input$prec, ignoreInit = TRUE)

    # Distribution controller --------------------------------------------------
    distr <- reactiveValues(
      distr = Normal$new(),
      react = runif(1)
    )

    return(distr)
  })

}
