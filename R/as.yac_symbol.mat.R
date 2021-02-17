#' Coerce to `yac_symbol` Matrix
#'
#' The function uses [as.yac_symbol()]
#' to convert `x` to an object of class `yac_symbol` `y`.
#' If `y$is_mat = TRUE`, the function returns `y`.
#' If `y$is_vec = TRUE`, the function converts `y`
#' to a column vector, that is, an `m by 1` matrix.
#'
#' @author Ivan Jacob Agaloos Pesigan
#'
#' @family assert functions
#' @keywords assert
#'
#' @examples
#' as.yac_symbol.mat(1:5)
#' (x <- matrix(1:10, ncol = 2))
#' as.yac_symbol.mat(x)
#' @inheritParams is.yac_symbol
#' @export
as.yac_symbol.mat <- function(x) {
  y <- as.yac_symbol(x)
  stopifnot(y$is_mat | y$is_vec)
  if (y$is_vec) {
    expr <- paste0(
      "Transpose(",
      "{",
      y$yacas_cmd,
      "}",
      ")"
    )
    return(Exe(expr))
  }
  if (y$is_mat) {
    return(y)
  }
}

#' @rdname as.yac_symbol.mat
#' @examples
#' as.ysym.mat(6:10)
#' (y <- matrix(11:20, ncol = 2))
#' as.ysym.mat(y)
#' @export
as.ysym.mat <- function(x) {
  as.yac_symbol.mat(x)
}
