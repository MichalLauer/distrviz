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

control_scale_server <- function(namespace, iv, input = NULL, react_on = NULL) {

  # Validator
  add_control_validation(distr = dparse(glue("{namespace}()")),
                          param = "scale",
                          iv = iv)

}
