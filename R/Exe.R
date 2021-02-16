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
#' @param expression Logical.
#'   If `expression = TRUE`, returns symbolic result as an `R` expression.
#'   If `expression = FALSE`, returns symbolic result as `"ysym"`, `"str"`,  or `"tex"`.
#' @param format Character string.
#'   Only used when `expression = FALSE`.
#'   If `format = "ysym"`,
#'   returns symbolic result as `yac_symbol`.
#'   If `format = "str"`,
#'   returns symbolic result as a characetr string.
#'   If `format = "tex"`,
#'   returns symbolic result as laTeX math.
#' @param simplify Logical. Simplify symbolic results.
#' @examples
#' A <- Ryacas::ysym(
#'   matrix(c("a", "c", "b", "d"), ncol = 2)
#' )
#' expr <- paste0("Determinant(", A, ")")
#' Exe(expr, expression = FALSE, format = "ysym")
#' Exe(expr, expression = FALSE, format = "str")
#' Exe(expr, expression = FALSE, format = "tex")
#' Exe(expr, expression = TRUE)
#'
#' a <- 1
#' b <- 2
#' c <- 3
#' d <- 4
#' eval(Exe(expr, expression = TRUE))
#'
#' # `det.yac_symbol` from `Ryacas`
#' Ryacas::det(A)
#'
#' # `det` from `base` R
#'
#' A <- matrix(c(a, c, b, d), ncol = 2)
#' det(A)
#' @export
Exe <- function(expr,
                expression = FALSE,
                format = "ysym",
                simplify = FALSE) {
  if (simplify) {
    expr <- paste0(
      "Simplify(",
      expr,
      ")"
    )
  }
  if (expression) {
    return(
      Ryacas::yac_expr(expr)
    )
  }
  if (format == "str") {
    return(Ryacas::yac_str(expr))
  }
  if (format == "ysym") {
    return(
      Ryacas::ysym(Ryacas::yac_str(expr))
    )
  }
  if (format == "tex") {
    return(
      Ryacas::tex(
        Ryacas::ysym(Ryacas::yac_str(expr))
      )
    )
  }
}
