control_nbform_ui <- function(namespace,
                              inputId = "form",
                              label = "Form",
                              param = inputId,
                              distr = namespace) {
  ns <- NS(namespace)
  virtualSelectInput(inputId = ns(inputId),
                     label = label,
                     choices = c(
                      "failures bef. K suc." = "fbs",
                      "successes bef. K fail." = "sbf",
                      "trials bef. K fail." = "tbf",
                      "trials bef. K suc." = "tbs"
                     ))
}

control_nbform_server <- function(namespace, iv) {

}
