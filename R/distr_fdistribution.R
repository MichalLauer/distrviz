distr_fdistribution_ui <- function(namespace) {
  ns <- NS(namespace)
  tagList(
    card(
      card_header(
        "Parameters"
      ),
      card_body(
        control_df1_ui(namespace),
        control_df2_ui(namespace)
      )
    )
  )
}

distr_fdistribution_server <- function(namespace) {
  ns <- NS(namespace)

  moduleServer(namespace, function(input, output, session) {

    # Validators ---------------------------------------------------------------
    iv <- InputValidator$new()
    control_df1_server(namespace=namespace, iv=iv)
    control_df2_server(namespace=namespace, iv=iv)
    iv$enable()

    # Reactor ------------------------------------------------------------------
    observe({
      req(iv$is_valid())

      distr$distr$setParameterValue(df1 = input$df1)
      distr$react <- runif(1)
    }) |>
      bindEvent(input$df1, ignoreInit = TRUE)

    observe({
      req(iv$is_valid())

      distr$distr$setParameterValue(df2 = input$df2)
      distr$react <- runif(1)
    }) |>
      bindEvent(input$df2, ignoreInit = TRUE)

    # Distribution controller --------------------------------------------------
    distr <- reactiveValues(
      distr = FDistribution$new(),
      iv = iv
    )

    return(distr)
  })

}
