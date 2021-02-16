#' ---
#' title: "Test: Exe"
#' author: "Ivan Jacob Agaloos Pesigan"
#' date: "`r Sys.Date()`"
#' output: rmarkdown::html_vignette
#' vignette: >
#'   %\VignetteIndexEntry{Test: Exe}
#'   %\VignetteEngine{knitr::rmarkdown}
#'   %\VignetteEncoding{UTF-8}
#' ---
#'
#+ include = FALSE
knitr::opts_chunk$set(
  error = TRUE,
  collapse = TRUE,
  comment = "#>",
  out.width = "100%"
)
#'
A <- Ryacas::ysym(
  matrix(c("a", "c", "b", "d"), ncol = 2)
)
expr <- paste0("Determinant(", A, ")")
a <- 1
b <- 2
c <- 3
d <- 4
#
B <- matrix(c(a, c, b, d), ncol = 2)
#+
testthat::test_that("a*d-b*c", {
  testthat::expect_equal(
    "a*d-b*c",
    yacR::Exe(expr, simplify = TRUE)$yacas_cmd,
    yacR::Exe(expr, str = TRUE, ysym = FALSE)
  )
})
testthat::test_that("a d - b c", {
  testthat::expect_equal(
    "a d - b c",
    yacR::Exe(expr, str = TRUE, tex = TRUE)
  )
})
testthat::test_that("det(B)", {
  testthat::expect_equal(
    det(B),
    eval(yacR::Exe(expr, str = FALSE))
  )
})
