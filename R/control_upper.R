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

control_upper_server <- function(namespace, input, iv, react_on = NULL) {

}
