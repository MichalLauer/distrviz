control_trials_ui <- function(namespace,
                                 inputId = "trials",
                                 label = "Trials") {
  ns <- NS(namespace)
  checkboxInput(inputId = ns(inputId),
                label = label,
                value = FALSE)
}

control_trials_server <- function(namespace, iv) {


}
