control_df_ui <- function(namespace,
                          inputId = "df",
                          label = "Degrees of freedom (ν)",
                          value = 3,
                          min = NA,
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

control_df_server <- function(namespace, input, iv, react_on = NULL) {

  # Validator
  iv$add_rule("df", sv_required())
  iv$add_rule("df", sv_gt(rhs = 0))

}
