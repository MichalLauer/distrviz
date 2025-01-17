control_prob_ui <- function(namespace,
                            inputId = "prob",
                            label = "Probability (π)",
                            step = .1,
                            param = inputId,
                            distr = namespace) {
  control_numeric(namespace = namespace,
                  inputId = inputId,
                  label = label,
                  step = step,
                  param = param,
                  distr = distr)
}

control_prob_server <- function(namespace, iv) {

  # Validator
  add_control_validation(distr = dparse(glue("{namespace}()")),
                          param = "prob",
                          iv = iv)

}
