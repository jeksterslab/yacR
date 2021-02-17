#' Execute Yacas Expression using Ryacas
#'
#' Executes `Yacas` expressions using `Ryacas`
#' with different output options.
#'
#' @author Ivan Jacob Agaloos Pesigan
#'
#' @family execute functions
#' @keywords execute
#'
#' @inherit yacR references
#'
#' @param x Character string. `Yacas` expression.
#' @param R Logical.
#'   If `R = TRUE`, returns symbolic result as an `R` expression.
#'   If `R = FALSE`, returns symbolic result as `"ysym"`, `"str"`,  or `"tex"`
#'   depending of `format`.
#' @param format Character string.
#'   Only used when `R = FALSE`.
#'   If `format = "ysym"`,
#'   returns symbolic result as `yac_symbol`.
#'   If `format = "str"`,
#'   returns symbolic result as a characetr string.
#'   If `format = "tex"`,
#'   returns symbolic result as LaTeX math.
#' @param simplify Logical. Simplify symbolic results.
#' @examples
#' A <- Ryacas::ysym(
#'   matrix(c("a", "c", "b", "d"), ncol = 2)
#' )
#' x <- paste0("Determinant(", A, ")")
#' Exe(x, R = FALSE, format = "ysym")
#' Exe(x, R = FALSE, format = "str")
#' Exe(x, R = FALSE, format = "tex")
#' Exe(x, R = TRUE)
#'
#' a <- 1
#' b <- 2
#' c <- 3
#' d <- 4
#' eval(Exe(x, R = TRUE))
#'
#' # `det.yac_symbol` from `Ryacas`
#' Ryacas::det(A)
#'
#' # `det` from `base` R
#'
#' A <- matrix(c(a, c, b, d), ncol = 2)
#' det(A)
#' @export
Exe <- function(x,
                R = FALSE,
                format = "ysym",
                simplify = FALSE) {
  if (simplify) {
    x <- paste0(
      "Simplify(",
      x,
      ")"
    )
  }
  if (R) {
    return(
      Ryacas::yac_expr(x)
    )
  } else {
    if (format == "str") {
      return(Ryacas::yac_str(x))
    } else if (format == "ysym") {
      return(
        Ryacas::ysym(
          Ryacas::yac_str(x)
        )
      )
    } else if (format == "tex") {
      return(
        Ryacas::tex(
          Ryacas::ysym(
            Ryacas::yac_str(x)
          )
        )
      )
    } else {
      stop("Unknown string `format`.")
    }
  }
}
