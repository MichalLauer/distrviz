control_upper_ui <- function(namespace,
                             inputId = "upper",
                             label = "Upper (U)",
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

control_upper_server <- function(namespace, iv) {

  # Validator
  add_control_validation(distr = dparse(glue("{namespace}()")),
                         param = "upper",
                         iv = iv)
  
}
