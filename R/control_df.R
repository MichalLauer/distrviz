control_df_ui <- function(namespace,
                          inputId = "df",
                          label = "Degrees of freedom (ν)",
                          value = 3,
                          min = NA,
                          max = NA,
                          step = 1) {
  ns <- NS(namespace)
  numericInput(
    inputId = ns(inputId),
    label = label,
    value = value,
    min = min,
    max = max,
    step = step
  )
}

control_df_server <- function(namespace, iv, input = NULL, react_on = NULL) {

  # Validator
  # needs to be inside observe(...) because iv itself is reactive
  observe({
    req(input$df)
    
    add_control_validation(distr = dparse(glue("{namespace}()")),
                           param = "df",
                           iv = iv)
  })

}
