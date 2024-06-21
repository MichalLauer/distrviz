control_variance_ui <- function(namespace,
                                inputId = "var",
                                label = "Variance (σ²)",
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

control_variance_server <- function(namespace, input, react_on = NULL) {
  # Validator
  iv <- InputValidator$new()
  iv$add_rule("var", sv_gt(rhs = 0))
  iv$enable()

  # Reactor
  local_others <- NULL
  observe({
    others <- reactiveValuesToList(react_on)
    if (is.null(local_others)) {
      local_others <<- lapply(names(others), FUN = function(x) isolate(others[[x]]()))
      names(local_others) <<- names(others)
      req(NULL)
    }

    for (i in seq_along(local_others)) {
      local <- local_others[[i]]
      new <- isolate(others[[i]]())
      if (local != new || is.null(local)) {
        name <- names(others[i])
        local_others[[name]] <<- new
        tf <- transformations[["var"]][[name]](new)
        update_control(namespace = namespace,
                       id = "var",
                       new_value = tf)
        req(NULL)
      }
    }

  }) |>
    bindEvent({
      req(react_on)
      lapply(names(react_on), FUN = function(x) react_on[[x]]())
    })

  # Return
  return(reactive(input$var))
}
