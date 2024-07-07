distr_lognormal_ui <- function(namespace) {
  ns <- NS(namespace)
  tagList(
    card(
      card_header(
        "Central tendency"
      ),
      card_body(
        control_mean_ui(namespace),
        control_meanlog_ui(namespace)
      )
    ),
    card(
      card_header(
        "Measure of variance"
      ),
      card_body(
        control_var_ui(namespace),
        control_varlog_ui(namespace),
        control_sd_ui(namespace),
        control_sdlog_ui(namespace),
        control_prec_ui(namespace),
        control_preclog_ui(namespace)
      )
    )
  )
}

distr_lognormal_server <- function(namespace) {
  ns <- NS(namespace)

  moduleServer(namespace, function(input, output, session) {

    # Validators ---------------------------------------------------------------
    iv <- InputValidator$new()
    control_mean_server(namespace=namespace, iv=iv)
    control_meanlog_server(namespace=namespace, iv=iv)
    control_var_server(namespace=namespace, iv=iv)
    control_varlog_server(namespace=namespace, iv=iv)
    control_sd_server(namespace=namespace, iv=iv)
    control_sdlog_server(namespace=namespace, iv=iv)
    control_prec_server(namespace=namespace, iv=iv)
    control_preclog_server(namespace=namespace, iv=iv)
    iv$enable()

    # Reactor ------------------------------------------------------------------
    observe({
      req(iv$is_valid())
      
      v <- distr$distr$getParameterValue("var")
      distr$distr <- Lognormal$new(mean = input$mean, var = v)
      distr$react <- runif(1)

      update_control(namespace = namespace,
                     distr = distr$distr,
                     ignore = "mean",
                     group = "means")
    }) |>
      bindEvent(input$mean, ignoreInit = TRUE)

    observe({
      req(iv$is_valid())
      
      vl <- distr$distr$getParameterValue("varlog")
      distr$distr <- Lognormal$new(meanlog = input$meanlog, varlog = vl)
      distr$react <- runif(1)

      update_control(namespace = namespace,
                     distr = distr$distr,
                     ignore = "meanlog",
                     group = "means")
    }) |>
      bindEvent(input$meanlog, ignoreInit = TRUE)

    # ---

    observe({
      req(iv$is_valid())

      distr$distr <- Lognormal$new(mean = input$mean, var = input$var)
      distr$react <- runif(1)

      update_control(namespace = namespace,
                     distr = distr$distr,
                     ignore = "var",
                     group = "vars")
    }) |>
      bindEvent(input$var, ignoreInit = TRUE)

    observe({
      req(iv$is_valid())

      distr$distr <- Lognormal$new(meanlog = input$meanlog, varlog = input$varlog)
      distr$react <- runif(1)

      update_control(namespace = namespace,
                     distr = distr$distr,
                     ignore = "varlog",
                     group = "vars")
    }) |>
      bindEvent(input$varlog, ignoreInit = TRUE)

    # ---

    observe({
      req(iv$is_valid())

      distr$distr <- Lognormal$new(mean = input$mean, sd = input$sd)
      distr$react <- runif(1)

      update_control(namespace = namespace,
                     distr = distr$distr,
                     ignore = "sd",
                     group = "vars")
    }) |>
      bindEvent(input$sd, ignoreInit = TRUE)

    observe({
      req(iv$is_valid())

      distr$distr <- Lognormal$new(meanlog = input$meanlog, sdlog = input$sdlog)
      distr$react <- runif(1)

      update_control(namespace = namespace,
                     distr = distr$distr,
                     ignore = "sdlog",
                     group = "vars")
    }) |>
      bindEvent(input$sdlog, ignoreInit = TRUE)

    # ---

    observe({
      req(iv$is_valid())

      distr$distr <- Lognormal$new(mean = input$mean, prec = input$prec)
      distr$react <- runif(1)
      
      update_control(namespace = namespace,
                     distr = distr$distr,
                     ignore = "prec",
                     group = "vars")
    }) |>
      bindEvent(input$prec, ignoreInit = TRUE)

    observe({
      req(iv$is_valid())

      distr$distr <- Lognormal$new(meanlog = input$meanlog, preclog = input$preclog)
      distr$react <- runif(1)
      
      update_control(namespace = namespace,
                     distr = distr$distr,
                     ignore = "preclog",
                     group = "vars")
    }) |>
      bindEvent(input$preclog, ignoreInit = TRUE)

    # Distribution controller --------------------------------------------------
    distr <- reactiveValues(
      distr = Lognormal$new(),
      iv = iv
    )

    return(distr)
  })

}
