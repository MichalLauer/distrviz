control_scale_ui <- function(namespace,
                                inputId = "scale",
                                label = "Scale (γ)",
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

control_scale_server <- function(namespace, iv, input = NULL, react_on = NULL) {

  # Validator
  add_control_validation(distr = dparse(glue("{namespace}()")),
                          param = "scale",
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
          tf <- transformations[["scale"]][[name]](new)
          update_control(namespace = namespace,
                          id = "scale",
                          new_value = tf)
          req(NULL)
        }
      }
  
    }) |>
      bindEvent({
        lapply(react_on, function(x) input[[x]])
      }, ignoreInit = T)
}
