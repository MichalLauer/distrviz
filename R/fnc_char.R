char <- function(x, replace = " - ") {
  if (is.function(x)) {
    tryCatch({
      res <- x()
      if (is.nan(res)) {
        return(replace)
      } else {
        return(res)
      }
     
    }, error = function(e) replace)
  } else if (length(x) == 0 || x == 'NaN' || x == 'undefined') {
    replace
  } else {
    x
  }
}