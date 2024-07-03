control_size_ui <- function(namespace,
                            inputId = "size",
                            label = "Size (n)",
                            value = 10,
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

control_size_server <- function(namespace, iv, input = NULL, react_on = NULL) {

  # Validator
  # needs to be inside observe(...) because iv itself is reactive
  observe({
    add_control_validation(distr = dparse(glue("{namespace}()")),
                           param = "size",
                           iv = iv)
  })

}
