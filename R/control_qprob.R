control_qprob_ui <- function(namespace,
                            inputId = "qprob",
                            label = "Probability (q)",
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

control_qprob_server <- function(namespace, iv) {

  # Validator
  add_control_validation(distr = dparse(glue("{namespace}()")),
                          param = "qprob",
                          iv = iv)
  
}
