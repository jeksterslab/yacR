#' Test for object of class `yac_symbol`
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

#' Coerce to an object of class `yac_symbol`
#'
#' The function checks if `x` is of class `yac_symbol`.
#' If the test is `TRUE`, it returns `x`.
#' otherwise, it applies `Ryacas::ysym` to `x`.
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
