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

control_lower_server <- function(namespace, input, iv, react_on = NULL) {

}
