control_shape1_ui <- function(namespace,
                              inputId = "shape1",
                              label = "Alpha (α)",
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

control_shape1_server <- function(namespace, iv, input = NULL, react_on = NULL) {

  # Validator
  add_control_validation(distr = dparse(glue("{namespace}()")),
                         param = "shape1",
                         iv = iv)

}
