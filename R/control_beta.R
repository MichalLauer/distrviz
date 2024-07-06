control_beta_ui <- function(namespace,
                            inputId = "beta",
                            label = "Beta (β)",
                            value = 5,
                            min = 1,
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

control_beta_server <- function(namespace, iv, input = NULL, react_on = NULL) {

  # Validator
  # needs to be inside observe(...) because iv itself is reactive
  observe({
    req(input$beta)
    
    add_control_validation(distr = dparse(glue("{namespace}()")),
                           param = "shape2",
                           input = "beta",
                           iv = iv)
  })

}
