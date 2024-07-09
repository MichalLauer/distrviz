control_cdf_ui <- function(namespace,
                         inputId = "cdf",
                         label = "CDF [F(x)]",
                         placeholder = ".1, .6, .8, 1, ...",
                         param = inputId,
                         distr = namespace) {
  ns <- NS(namespace)
  textInput(inputId = ns(inputId),
            label = label,
            value = NULL,
            placeholder = placeholder)
}

control_cdf_server <- function(namespace, iv) {

  # Validator
  iv$add_rule("cdf", function(x) {
    if (!input_provided(x)) {
      return(NULL)
    }

    cx <- strsplit(x, ",\\s?")[[1]]

    # # Check that at least one data-point is given
    # if (length(cx) == 0) {
    #   return("Give at-least CDF mass.")
    # }
    
    # Check that all inputs are numbers
    suppressWarnings({
      nx <- try({ as.numeric((cx)) })
    })
    if (any(is.na(nx))) {
      return("Only numbers are acceptable.")
    }
    
  })
}



