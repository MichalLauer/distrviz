update_control <- function(namespace, id, new_value) {
  js <- glue("$('#{namespace}-{id}').val({new_value})")
  runjs(js)
}
