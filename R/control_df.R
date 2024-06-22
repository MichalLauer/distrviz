control_df_ui <- function(namespace,
                          inputId = "df",
                          label = "Degrees of freedom (ν)",
                          value = 5,
                          min = 1,
                          max = NA,
                          step = 1) {
  ns <- NS(namespace)
  numericInput(
    inputId = ns(inputId),
    label = label,
    value = value,
    min = min,
    max = max,
    step = step
  )
}

control_df_server <- function(namespace, input, react_on = NULL) {

  # Validator
  iv <- InputValidator$new()
  iv$add_rule("df", sv_gt(rhs = 0))
  iv$add_rule("df", sv_integer())
  iv$enable()

  # Return
  return(iv)

}
