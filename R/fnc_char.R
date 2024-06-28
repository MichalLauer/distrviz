char <- function(x, replace = " - ") {
  if (is.function(x)) {
    tryCatch(x(), error = function(e) replace)
  } else if (length(x) == 0) {
    replace
  } else {
    x
  }
}