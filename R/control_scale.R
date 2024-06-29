control_scale_ui <- function(namespace,
                                inputId = "scale",
                                label = "Scale (γ)",
                                value = 1,
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

control_scale_server <- function(namespace, input, iv) {

  # Validator
  iv$add_rule("scale", sv_required())
  iv$add_rule("scale", sv_gt(rhs = 0))

}
