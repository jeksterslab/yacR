#' Coerce to LaTeX Math
#'
#' The function uses [as.yac_symbol()]
#' to convert `x` to an object of class `yac_symbol`
#' and then converts it to LaTeX math
#' using [Ryacas::tex()].
#'
#' @author Ivan Jacob Agaloos Pesigan
#'
#' @family assert functions
#' @keywords assert
#'
#' @examples
#' (x <- matrix(1:10, ncol = 2))
#' as.tex(x)
#' @inheritParams is.yac_symbol
#' @export
as.tex <- function(x) {
  return(
    Ryacas::tex(as.yac_symbol(x))
  )
}
