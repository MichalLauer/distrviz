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

control_mean_server <- function(namespace) {
  ns <- NS(namespace)

  iv <- InputValidator$new()
  iv$add_rule("mean", sv_required())
  iv$enable()

  return(reactive(input$mean))

}
