control_numeric <- function(namespace,
                            inputId,
                            label,
                            step,
                            param = inputId,
                            distr = namespace) {
  
  ns <- NS(namespace)
  d <- dparse(glue("{distr}()"))
  p <- d$parameters()$supports[[inputId]]

  numericInput(
    inputId = ns(inputId),
    label = label,
    value = d$getParameterValue(param),
    min = p$min,
    max = p$max,
    step = step
  )
}