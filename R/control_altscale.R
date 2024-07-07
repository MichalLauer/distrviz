control_altscale_ui <- function(namespace,
                                inputId = "altscale",
                                label = "Altscale (γ)",
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

control_altscale_server <- function(namespace, iv) {

  # Validator
  add_control_validation(distr = dparse(glue("{namespace}()")),
                          param = "altscale",
                          iv = iv)
}
