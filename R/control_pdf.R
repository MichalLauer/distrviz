control_pdf_ui <- function(namespace,
                         inputId = "pdf",
                         label = "PDF [p(x)]",
                         placeholder = ".1, .5, .2, .2, ...",
                         param = inputId,
                         distr = namespace) {
  ns <- NS(namespace)
  textInput(inputId = ns(inputId),
            label = label,
            value = NULL,
            placeholder = placeholder)
}

control_pdf_server <- function(namespace, iv) {

  # Validator
  iv$add_rule("pdf", function(x) {
    if (!input_provided(x)) {
      return(NULL)
    }
    
    cx <- strsplit(x, ",\\s?")[[1]]

    # # Check that at least one data-point is given
    # if (length(cx) == 0) {
    #   return("Give at-least PDF mass.")
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



