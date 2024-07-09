control_x_ui <- function(namespace,
                         inputId = "x",
                         label = "Data points",
                         placeholder = "1, 2, 3, 4, ...",
                         param = inputId,
                         distr = namespace) {
  ns <- NS(namespace)
  textInput(inputId = ns(inputId),
            label = label,
            value = NULL,
            placeholder = placeholder)
}

control_x_server <- function(namespace, iv) {

  # Validator
  iv$add_rule("x", function(x) {
    
    # Check that at least one data-point is given
    if (!input_provided(x)) {
      return("Give at-least one data point.")
      }
      
    cx <- strsplit(x, ",\\s?")[[1]]

    # Check that all inputs are numbers
    suppressWarnings({
      nx <- try({ as.numeric((cx)) })
    })
    if (any(is.na(nx))) {
      return("Only numbers are acceptable.")
    }

    return(NULL)
  })
}



