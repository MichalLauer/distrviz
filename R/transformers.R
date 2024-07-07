transformations <- list(
  "var" = list(
    "sd" = function(x) return(x**2),
    "prec" = function(x) return(1/x)
  ),
  "sd" = list(
    "var" = function(x) return(sqrt(x)),
    "prec" = function(x) return(1/(x^2))
  ),
  "prec" = list(
    "var" = function(x) return(1/x),
    "sd" = function(x) return(1/(x^2))
  ),
  "prob" = list(
    "qprob" = function(x) return(1 - x)
  ),
  "qprob" = list(
    "prob" = function(x) return(1 - x)
  ),
  "rate" = list(
    "scale" = function(x) return(1 / x)
  ),
  "scale" = list(
    "rate" = function(x) return(1 / x)
  )
)
