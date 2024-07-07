control_sdlog_ui <- function(namespace,
                             inputId = "sdlog",
                             label = "Standard deviation (σ)",
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

control_sdlog_server <- function(namespace, iv) {

  # Validator
  add_control_validation(distr = dparse(glue("{namespace}()")),
                         param = "sdlog",
                         iv = iv)

}
