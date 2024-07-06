control_shape2_ui <- function(namespace,
                             step = 1,
                             value = 1,
                             distr = namespace,
                             inputId = "shape2",
                             label = "Beta (β)") {
  ns <- NS(namespace)
  p <- dparse(glue("{distr}()"))$parameters()$supports[[inputId]]

  if (!p$contains(value)) {
    warning(glue("Default value is not valid for '{inputId}' in '{namespace}'."))
  }

  numericInput(
    inputId = ns(inputId),
    label = label,
    value = value,
    min = p$lower,
    max = p$upper,
    step = step
  )
}

control_shape2_server <- function(namespace, iv, input = NULL, react_on = NULL) {

  # Validator
  add_control_validation(distr = dparse(glue("{namespace}()")),
                          param = "shape2",
                          iv = iv)

}
