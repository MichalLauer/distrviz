control_scale_ui <- function(namespace,
                                inputId = "scale",
                                label = "Scale (γ)",
                                step = .1,
                                param = inputId,
                                distr = namespace) {
  control_numeric(namespace = namespace,
                  inputId = inputId,
                  label = label,
                  step = step,
                  param = inputId,
                  distr = namespace)
}

control_scale_server <- function(namespace, iv, input = NULL, react_on = NULL) {

  # Validator
  add_control_validation(distr = dparse(glue("{namespace}()")),
                          param = "scale",
                          iv = iv)

}
