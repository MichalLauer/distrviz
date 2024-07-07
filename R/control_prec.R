control_prec_ui <- function(namespace,
                            inputId = "prec",
                            label = "Precision (τ)",
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

control_prec_server <- function(namespace, iv) {

  # Validator
  add_control_validation(distr = dparse(glue("{namespace}()")),
                          param = "prec",
                          iv = iv)

}
