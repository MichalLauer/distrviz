control_df_ui <- function(namespace,
                          inputId = "df",
                          label = "Degrees of freedom (ν)",
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

control_df_server <- function(namespace, iv, input = NULL, react_on = NULL) {

  # Validator
  add_control_validation(distr = dparse(glue("{namespace}()")),
                         param = "df",
                         iv = iv)

}
