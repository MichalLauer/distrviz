update_control <- function(namespace, distr, ignore, group = "linked") {
  # So it's not printed
  sink(nullfile())
  t <- distr$parameters()$print()
  sink()

  ids <- t[grepl(group, t$Tags),]$Id
  ids <- setdiff(ids, ignore)
  for (id in ids) {
    new_value <- distr$getParameterValue(id)
    js <- glue("$('#{namespace}-{id}').val({new_value})")
    runjs(js)
  }
}

update_control2 <- function(namespace, inputId, value) {
  js <- glue("$('#{namespace}-{inputId}').val('{value}')")
  runjs(js)
}
