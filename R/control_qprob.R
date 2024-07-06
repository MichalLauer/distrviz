control_qprob_ui <- function(namespace,
                            inputId = "qprob",
                            label = "Probability (q)",
                            value = .5,
                            min = 0,
                            max = 1,
                            step = .1) {
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

control_qprob_server <- function(namespace, iv, input = NULL, react_on = NULL) {

  # Validator
  # needs to be inside observe(...) because iv itself is reactive
  observe({
    req(input$qprob)
    
    add_control_validation(distr = dparse(glue("{namespace}()")),
                           param = "qprob",
                           iv = iv)
  })

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
            tf <- transformations[["qprob"]][[name]](new)
            update_control(namespace = namespace,
                           id = "qprob",
                           new_value = tf)
            req(NULL)
          }
        }
    
      }) |>
        bindEvent({
          lapply(react_on, function(x) input[[x]])
        }, ignoreInit = T)
}
