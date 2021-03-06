#' ---
#' title: "Test: as.tex"
#' author: "Ivan Jacob Agaloos Pesigan"
#' date: "`r Sys.Date()`"
#' output: rmarkdown::html_vignette
#' vignette: >
#'   %\VignetteIndexEntry{Test: as.tex}
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
testthat::test_that("\\left( \\begin{array}{cc} 1 & 6 \\\\ 2 & 7 \\\\ 3 & 8 \\\\ 4 & 9 \\\\ 5 & 10 \\end{array} \\right)", {
  testthat::expect_equal(
    "\\left( \\begin{array}{cc} 1 & 6 \\\\ 2 & 7 \\\\ 3 & 8 \\\\ 4 & 9 \\\\ 5 & 10 \\end{array} \\right)",
    yacR::as.tex(matrix(1:10, ncol = 2))
  )
})
