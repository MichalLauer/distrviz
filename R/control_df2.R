control_df2_ui <- function(namespace,
                          inputId = "df2",
                          label = "Degrees of freedom 1 (ν₂)",
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

control_df2_server <- function(namespace, iv, input = NULL, react_on = NULL) {

  # Validator
  add_control_validation(distr = dparse(glue("{namespace}()")),
                         param = "df2",
                         iv = iv)

}
