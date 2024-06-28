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

control_alpha_server <- function(namespace, input, iv, react_on = NULL) {

  # Validator
  iv$add_rule("alpha", sv_required())
  iv$add_rule("alpha", sv_gt(rhs = 0))

}
