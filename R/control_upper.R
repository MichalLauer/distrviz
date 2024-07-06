control_upper_ui <- function(namespace,
                             inputId = "upper",
                             label = "Upper",
                             value = 5,
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

control_upper_server <- function(namespace, iv, input = NULL, react_on = NULL) {

  # Validator
  # needs to be inside observe(...) because iv itself is reactive
  observe({
    req(input$upper)
    
    add_control_validation(distr = dparse(glue("{namespace}()")),
                           param = "upper",
                           iv = iv)
  })
  
}
