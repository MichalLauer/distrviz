control_minimum_ui <- function(namespace,
                               inputId = "minimum",
                               label = "Minimum (m)",
                               step = 1,
                               param = inputId,
                               distr = namespace) {
  control_numeric(namespace = namespace,
                  inputId = inputId,
                  label = label,
                  step = step,
                  param = param,
                  distr = distr)
}

control_minimum_server <- function(namespace, iv) {

  # Validator
  add_control_validation(distr = dparse(glue("{namespace}()")),
                          param = "minimum",
                          iv = iv)
}
