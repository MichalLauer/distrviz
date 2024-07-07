control_size_ui <- function(namespace,
                            inputId = "size",
                            label = "Size (n)",
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

control_size_server <- function(namespace, iv) {

  # Validator
  add_control_validation(distr = dparse(glue("{namespace}()")),
                          param = "size",
                          iv = iv)

}
