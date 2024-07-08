control_theta_ui <- function(namespace,
                             inputId = "theta",
                             label = "Theta (θ)",
                             step = .1,
                             param = inputId,
                             distr = namespace) {
  control_numeric(namespace = namespace,
                  inputId = inputId,
                  label = label,
                  step = step,
                  param = param,
                  distr = distr)
}

control_theta_server <- function(namespace, iv) {

  # Validator
  add_control_validation(distr = dparse(glue("{namespace}()")),
                         param = "theta",
                         iv = iv)
  
}
