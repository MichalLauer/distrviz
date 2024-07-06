control_alpha_ui <- function(namespace,
                             value = 1,
                             step = 1, 
                             distr = namespace,
                             inputId = "shape1",
                             label = "Alpha (α)") {
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

control_alpha_server <- function(namespace, iv, input = NULL, react_on = NULL) {

  # Validator
  add_control_validation(distr = dparse(glue("{namespace}()")),
                         param = "shape1",
                         iv = iv)

}
