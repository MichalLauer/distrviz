control_mean_ui <- function(namespace,
                            inputId = "mean",
                            label = "Mean (µ)",
                            value = 0,
                            min = NA,
                            max = NA,
                            step = .1) {
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

control_mean_server <- function(namespace, input = NULL, iv = NULL) {
  ns <- NS(namespace)

  iv$add_rule("mean", sv_required())

  return(iv)
}
