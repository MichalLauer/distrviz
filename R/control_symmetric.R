control_symmetric_ui <- function(namespace,
                                 inputId = "symmetric",
                                 label = "Symmetric?") {
  ns <- NS(namespace)
  checkboxInput(inputId = ns(inputId),
                label = label,
                value = FALSE)
}

control_symmetric_server <- function(namespace, iv) {


}
