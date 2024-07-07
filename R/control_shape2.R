control_shape2_ui <- function(namespace,
                              inputId = "shape2",
                              label = "Beta (β)",
                              step = 1,
                              param = inputId,
                              distr = namespace) {
  control_numeric(namespace = namespace,
                  inputId = inputId,
                  label = label,
                  step = step,
                  param = inputId,
                  distr = namespace)
}

control_shape2_server <- function(namespace, iv, input = NULL, react_on = NULL) {

  # Validator
  add_control_validation(distr = dparse(glue("{namespace}()")),
                          param = "shape2",
                          iv = iv)

}
