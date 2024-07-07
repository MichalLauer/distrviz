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
                  param = inputId,
                  distr = namespace)
}

control_prob_server <- function(namespace, iv, input = NULL, react_on = NULL) {

  # Validator
  add_control_validation(distr = dparse(glue("{namespace}()")),
                          param = "prob",
                          iv = iv)

  # Reactor
  local_others <- NULL
  observe({
    req(iv$is_valid(), !is.null(react_on))
    if (is.null(local_others)) {
      local_others <<- lapply(react_on, FUN = function(x) input[[x]])
      names(local_others) <<- react_on
      req(NULL)
    }

    for (i in seq_along(local_others)) {
      name <- names(local_others[i])

      local <- local_others[[i]]
      new <- input[[ name ]]
      if (local != new) {
        local_others[[name]] <<- new
        tf <- transformations[["prob"]][[name]](new)
        update_control(namespace = namespace,
                        id = "prob",
                        new_value = tf)
        req(NULL)
      }
    }

  }) |>
    bindEvent({
      lapply(react_on, function(x) input[[x]])
    }, ignoreInit = T)

}
