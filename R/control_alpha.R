control_alpha_ui <- function(namespace,
                             inputId = "alpha",
                             label = "Alpha (α)",
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

control_alpha_server <- function(namespace, iv, input = NULL, react_on = NULL) {

  # Validator
  # needs to be inside observe(...) because iv itself is reactive
  observe({
    req(input$alpha)

    add_control_validation(distr = dparse(glue("{namespace}()")),
                           param = "shape1",
                           input = "alpha",
                           iv = iv)
  })

}
