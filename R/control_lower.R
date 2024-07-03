control_lower_ui <- function(namespace,
                            inputId = "lower",
                            label = "Lower",
                            value = 0,
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

control_lower_server <- function(namespace, iv, input = NULL, react_on = NULL) {

  # Validator
  # needs to be inside observe(...) because iv itself is reactive
  observe({
    add_control_validation(distr = dparse(glue("{namespace}()")),
                           param = "lower",
                           iv = iv)
  })
  
}
