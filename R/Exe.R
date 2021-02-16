#' Execute Yacas Expression using Ryacas
#'
#' Executes `Yacas` expressions using `Ryacas`
#' with different output options.
#'
#' @author Ivan Jacob Agaloos Pesigan
#'
#' @inherit yacR references
#'
#' @param expr Character string. `Yacas` expresion.
#' @param str Logical.
#'   If `str = TRUE`, returns symbolic result as string.
#'   If `str = FALSE`, returns symbolic result as an `R` expression.
#' @param ysym Logical.
#'   If `ysym = TRUE`, returns symbolic result as `yac_symbol`
#'   if `str = TRUE`.
#'   If `ysym = FALSE`, returns symbolic result as string
#'   if `str = TRUE`.
#' @param tex Logical.
#'   If `tex = TRUE` returns results as latex math
#'   if `str = TRUE`.
#'   If `tex = FALSE`, returns symbolic result as string
#'   if `str = TRUE`.
#' @param simplify Logical. Simplify symbolic results.
#' @examples
#' A <- Ryacas::ysym(
#'   matrix(c("a", "c", "b", "d"), ncol = 2)
#' )
#' expr <- paste0("Determinant(", A, ")")
#' Exe(expr)
#' Exe(expr, str = TRUE, ysym = FALSE)
#' Exe(expr, str = TRUE, tex = TRUE)
#' Exe(expr, str = FALSE)
#'
#' a <- 1
#' b <- 2
#' c <- 3
#' d <- 4
#' eval(Exe(expr, str = FALSE))
#'
#' # `det.yac_symbol` from Ryacas
#' Ryacas::det(A)
#'
#' # `det` from base R
#'
#' A <- matrix(c(a, c, b, d), ncol = 2)
#' det(A)
#' @export
Exe <- function(expr,
                str = TRUE,
                ysym = TRUE,
                tex = FALSE,
                simplify = FALSE) {
  if (simplify) {
    expr <- paste0(
      "Simplify(",
      expr,
      ")"
    )
  }
  if (str) {
    out <- Ryacas::yac_str(expr)
    if (tex) {
      return(
        Ryacas::tex(
          Ryacas::ysym(out)
        )
      )
    } else {
      if (ysym) {
        return(
          Ryacas::ysym(out)
        )
      } else {
        return(
          out
        )
      }
    }
  } else {
    return(
      Ryacas::yac_expr(expr)
    )
  }
}
