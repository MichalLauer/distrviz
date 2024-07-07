update_control <- function(namespace, ids, distr) {
  for (id in ids) {
    new_value <- distr$getParameterValue(id)
    js <- glue("$('#{namespace}-{id}').val({new_value})")
    runjs(js)
  }
}