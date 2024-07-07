control_preclog_ui <- function(namespace,
                              inputId = "preclog",
                              label = "[log] Precision (τ)",
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

control_preclog_server <- function(namespace, iv) {

  # Validator
  add_control_validation(distr = dparse(glue("{namespace}()")),
                          param = "preclog",
                          iv = iv)

}
