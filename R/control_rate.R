control_rate_ui <- function(namespace,
                            inputId = "rate",
                            label = "Rate (λ)",
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

control_rate_server <- function(namespace, iv) {

  # Validator
  add_control_validation(distr = dparse(glue("{namespace}()")),
                         param = "rate",
                         iv = iv)

}
