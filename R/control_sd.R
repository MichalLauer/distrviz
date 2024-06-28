control_sd_ui <- function(namespace,
                          inputId = "sd",
                          label = "Standard deviation (σ)",
                          value = 1,
                          min = 0.1,
                          max = NA,
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

control_sd_server <- function(namespace, input, iv, react_on = NULL) {

  # Validator
  iv$add_rule("sd", sv_required())
  iv$add_rule("sd", sv_gt(rhs = 0))

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
        tf <- transformations[["sd"]][[name]](new)
        update_control(namespace = namespace,
                       id = "sd",
                       new_value = tf)
        req(NULL)
      }
    }

  }) |>
    bindEvent({
      lapply(react_on, function(x) input[[x]])
    }, ignoreInit = T)

}
