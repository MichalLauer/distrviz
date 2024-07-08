control_successes_ui <- function(namespace,
                               inputId = "successes",
                               label = "Successes (K)",
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

control_successes_server <- function(namespace, iv) {

  # Validator
  add_control_validation(distr = dparse(glue("{namespace}()")),
                         param = "successes",
                         iv = iv)

}
