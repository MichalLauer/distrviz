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
                  param = param,
                  distr = distr)
}

control_lower_server <- function(namespace, iv) {

  # Validator
  add_control_validation(distr = dparse(glue("{namespace}()")),
                          param = "lower",
                          iv = iv)
  
}
