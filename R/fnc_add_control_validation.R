add_control_validation <- function(distr, param, iv, input=param) {
  supp <- distr$parameters()$supports[[param]]
  if (is.null(supp)) {
    warning(glue("Parameter '{param}' not defined for '{distr$classname}'"))
  }

  iv$add_rule(input, sv_required())
  .add_control_lower(supp, input, iv)
  .add_control_upper(supp, input, iv)
  .add_control_set(supp, input, iv)

}

.add_control_lower <- function(supp, input, iv) {


  lower_bound <- strsplit(supp$type, "")[[1]][1]
  if (lower_bound == "(") {
    iv$add_rule(input, sv_gt(supp$lower))
  } else if (lower_bound == "[") {
    iv$add_rule(input, sv_gte(supp$lower))
  } else {
    warning(glue("Lower bound '{lower_bound}' not implemented"))
  }
}

.add_control_upper <- function(supp, input, iv) {
  upper_bound <- strsplit(supp$type, "")[[1]][2]
  if (upper_bound == ")") {
    iv$add_rule(input, sv_lt(supp$upper))
  } else if (upper_bound == "]") {
    iv$add_rule(input, sv_lte(supp$upper))
  } else {
    warning(glue("Upper bound '{upper_bound}' not implemented"))
  }
}

.add_control_set <-function(supp, input, iv) {
  set <- supp$properties$countability
  if (set == "uncountable") {
    # do nothing - uncountable is the default
  } else if (set == "countably infinite" || set == "countably finite") {
    iv$add_rule(input, sv_integer())
  } else {
    warning(glue("Set '{set}' not implemented"))
  }
}