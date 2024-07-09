distr_weighteddiscrete_ui <- function(namespace) {
  ns <- NS(namespace)
  tagList(
    card(
      card_header(
        "Data"
      ),
      card_body(
        control_x_ui(namespace)
      )
    ),
    card(
      card_header(
        "Distributions"
      ),
      card_body(
        control_pdf_ui(namespace),
        control_cdf_ui(namespace)
      )
    )
  )
}

distr_weighteddiscrete_server <- function(namespace) {
  ns <- NS(namespace)

  moduleServer(namespace, function(input, output, session) {

    # Validators ---------------------------------------------------------------
    iv <- InputValidator$new()
    control_x_server(namespace=namespace, iv=iv)
    control_pdf_server(namespace=namespace, iv=iv)
    iv$add_rule("pdf", function(p) {

      x   <- isolate(input$x)
      pdf <- isolate(input$pdf)
      cdf <- isolate(input$cdf)

      # No data provided - no validation required
      if (!input_provided(x)) {
        return(NULL)
      }

      # No pdf/cdf is provided - request at least one and clear input
      if (!input_provided(pdf) && !input_provided(cdf)) {
        update_control2(namespace = namespace, inputId = "cdf", value = "")
        update_control2(namespace = namespace, inputId = "pdf", value = "")
        return("Provide either 'pdf' or 'cdf'")
      }

      # Now at least one of pdf/cdf is provided.

      cx <- as.numeric(strsplit(x, ",\\s?")[[1]])
      cpdf <- as.numeric(strsplit(pdf, ",\\s?")[[1]])
      ccdf <- as.numeric(strsplit(cdf, ",\\s?")[[1]])


      if (input_provided(pdf)) {
        value <- paste0(cumsum(cpdf), collapse = ", ")
        update_control2(namespace = namespace,
                        inputId = "cdf",
                        value = value)

        if (!all(cpdf >= 0)) {
          return("All densities must be >= 0")
        } else if (!all(cpdf <= 1)) {
          return("All densities must be <= 1")
        } else if ((length(cx) != length(cpdf))) {
          return("Length of 'x' and 'pdf' must be the same.")
        } else {
          return(NULL)
        }

      } else if (input_provided(cdf)) {
        value <- paste0(c(ccdf[1], diff(ccdf)), collapse = ", ")
        update_control2(namespace = namespace,
                        inputId = "pdf",
                        value = value)
      }

    })

    control_cdf_server(namespace=namespace, iv=iv)
    iv$add_rule("cdf", function(c) {

      x   <- isolate(input$x)
      pdf <- isolate(input$pdf)
      cdf <- isolate(input$cdf)

      # No data provided - no validation required
      if (!input_provided(x)) {
        return(NULL)
      }

      # No pdf/cdf is provided - request at least one and clear input
      if (!input_provided(pdf) && !input_provided(cdf)) {
        update_control2(namespace = namespace, inputId = "cdf", value = "")
        update_control2(namespace = namespace, inputId = "pdf", value = "")
        return("Provide either 'pdf' or 'cdf'")
      }

      # Now at least one of pdf/cdf is provided.
      cx <- as.numeric(strsplit(x, ",\\s?")[[1]])
      cpdf <- as.numeric(strsplit(pdf, ",\\s?")[[1]])
      ccdf <- as.numeric(strsplit(cdf, ",\\s?")[[1]])


      if (input_provided(pdf)) {
          value <- paste0(cumsum(cpdf), collapse = ", ")
          update_control2(namespace = namespace,
                          inputId = "cdf",
                          value = value)
      } else if (input_provided(cdf)) {
        value <- paste0(c(ccdf[1], diff(ccdf)), collapse = ", ")
        update_control2(namespace = namespace,
                        inputId = "pdf",
                        value = value)

        if (!all(ccdf >= 0)) {
          return("Cummulative densities must be >= 0")
        } else if (!all(ccdf <= 1)) {
          return("Cummulative densities must be <= 1")
        } else if (!all(diff(ccdf) >= 0)) {
          return("Cummulative densities can't decrease.")
        } else if ((length(cx) != length(ccdf))) {
          return("Length of 'x' and 'cdf' must be the same.")
        } else {
          return(NULL)
        }

      }

    })

    iv$enable()

    # Reactor ------------------------------------------------------------------
    observe({
      req(iv$is_valid())

      cx <- as.numeric(strsplit(input$x, ",\\s?")[[1]])
      pdf <- distr$distr$getParameterValue("pdf")

      distr$distr <- WeightedDiscrete$new(x = cx, pdf = pdf)
      distr$react <- runif(1)
    }) |>
      bindEvent(input$x, ignoreInit = TRUE)

    observe({
      req(iv$is_valid())

      cx <- as.numeric(strsplit(input$x, ",\\s?")[[1]])
      pdf <- as.numeric(strsplit(input$pdf, ",\\s?")[[1]])

      req(length(cx) == length(pdf))
      distr$distr <- WeightedDiscrete$new(x = cx, pdf = pdf)
      distr$react <- runif(1)
    }) |>
      bindEvent(input$pdf, ignoreInit = TRUE)

    observe({
      req(iv$is_valid())

      cx <- as.numeric(strsplit(input$x, ",\\s?")[[1]])
      cdf <- as.numeric(strsplit(input$cdf, ",\\s?")[[1]])

      req(length(cx) == length(cdf))
      distr$distr <- WeightedDiscrete$new(x = cx, cdf = cdf)
      distr$react <- runif(1)
    }) |>
      bindEvent(input$cdf, ignoreInit = TRUE)

    # Distribution controller --------------------------------------------------
    distr <- reactiveValues(
      distr = WeightedDiscrete$new(),
      iv = iv
    )

    return(distr)
  })

}
