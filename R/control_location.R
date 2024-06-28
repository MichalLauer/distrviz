control_location_ui <- function(namespace,
                            inputId = "location",
                            label = "Location (λ)",
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

control_location_server <- function(namespace, input = NULL, iv = NULL) {
  ns <- NS(namespace)

  # Validator
  iv$add_rule("location", sv_required())
  iv$add_rule("location", sv_gte(0))
}
