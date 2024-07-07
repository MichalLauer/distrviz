control_df1_ui <- function(namespace,
                          inputId = "df1",
                          label = "Degrees of freedom 1 (ν₁)",
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

control_df1_server <- function(namespace, iv) {

  # Validator
  add_control_validation(distr = dparse(glue("{namespace}()")),
                         param = "df1",
                         iv = iv)

}
