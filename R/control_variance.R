control_var_ui <- function(namespace,
                                inputId = "var",
                                label = "Variance (σ²)",
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

control_var_server <- function(namespace, iv) {

  # Validator
  add_control_validation(distr = dparse(glue("{namespace}()")),
                          param = "var",
                          iv = iv)

}
