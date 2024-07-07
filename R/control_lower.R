control_lower_ui <- function(namespace,
                             inputId = "lower",
                             label = "Lower (L)",
                             step = 1,
                             param = inputId,
                             distr = namespace) {
  control_numeric(namespace = namespace,
                  inputId = inputId,
                  label = label,
                  step = step,
                  param = inputId,
                  distr = namespace)
}

control_lower_server <- function(namespace, iv, input = NULL, react_on = NULL) {

  # Validator
  add_control_validation(distr = dparse(glue("{namespace}()")),
                          param = "lower",
                          iv = iv)
  
}
