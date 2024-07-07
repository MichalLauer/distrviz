control_meanlog_ui <- function(namespace,
                            inputId = "meanlog",
                            label = "[log] Mean (µ)",
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

control_meanlog_server <- function(namespace, iv) {

  # Validator
  add_control_validation(distr = dparse(glue("{namespace}()")),
                          param = "meanlog",
                          iv = iv)
}
