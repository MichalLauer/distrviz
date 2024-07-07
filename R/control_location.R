control_location_ui <- function(namespace,
                                inputId = "location",
                                label = "Location (λ)",
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

control_location_server <- function(namespace, iv, input = NULL, react_on = NULL) {

  # Validator
  add_control_validation(distr = dparse(glue("{namespace}()")),
                          param = "location",
                          iv = iv)
  
}
