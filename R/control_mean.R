control_mean_ui <- function(namespace,
                            inputId = "mean",
                            label = "Mean (µ)",
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

control_mean_server <- function(namespace, iv, input = NULL, react_on = NULL) {

  # Validator
  add_control_validation(distr = dparse(glue("{namespace}()")),
                          param = "mean",
                          iv = iv)
}
