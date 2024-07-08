control_draws_ui <- function(namespace,
                             inputId = "draws",
                             label = "Draws (n)",
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

control_draws_server <- function(namespace, iv) {

  # Validator
  add_control_validation(distr = dparse(glue("{namespace}()")),
                         param = "draws",
                         iv = iv)

}
