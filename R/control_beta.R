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

control_beta_server <- function(namespace, input, iv, react_on = NULL) {

  # Validator
  iv$add_rule("beta", sv_gt(rhs = 0))

}
