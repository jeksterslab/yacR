#' Test for Object of Class `yac_symbol`
#'
#' Tests if an `R` object `x` is of class `yac_symbol`.
#'
#' @author Ivan Jacob Agaloos Pesigan
#'
#' @examples
#' x <- 1:5
#' is.yac_symbol(x)
#' is.yac_symbol(Ryacas::ysym(x))
#' @param x Object.
#' @export
is.yac_symbol <- function(x) {
  return(
    methods::is(x, "yac_symbol")
  )
}

#' @rdname is.yac_symbol
#' @export
is.ysym <- function(x) {
  is.yac_symbol(x)
}

#' Coerce to an Object of Class `yac_symbol`
#'
#' The function checks if `x` is of class `yac_symbol`.
#' If the test is `TRUE`, it returns `x`.
#' otherwise, it applies `Ryacas::ysym` to `x`
#' and returns the result.
#'
#' @author Ivan Jacob Agaloos Pesigan
#'
#' @examples
#' x <- 1:5
#' as.yac_symbol(x)
#' as.yac_symbol(Ryacas::ysym(x))
#' @inheritParams is.yac_symbol
#' @export
as.yac_symbol <- function(x) {
  if (is.yac_symbol(x)) {
    return(x)
  } else {
    return(Ryacas::ysym(x))
  }
}

#' @rdname as.yac_symbol
#' @export
as.ysym <- function(x) {
  as.yac_symbol(x)
}
