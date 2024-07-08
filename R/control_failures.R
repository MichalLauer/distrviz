control_failures_ui <- function(namespace,
                               inputId = "failures",
                               label = "Failures (n - K)",
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

control_failures_server <- function(namespace, iv) {

  # Validator
  add_control_validation(distr = dparse(glue("{namespace}()")),
                         param = "failures",
                         iv = iv)

}
