#' ---
#' title: "Test: as.yac_symbol.mat"
#' author: "Ivan Jacob Agaloos Pesigan"
#' date: "`r Sys.Date()`"
#' output: rmarkdown::html_vignette
#' vignette: >
#'   %\VignetteIndexEntry{Test: as.yac_symbol.mat}
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
x <- 1:5
y <- matrix(1:10, ncol = 2)
#'
testthat::test_that("vector", {
  testthat::expect_equal(
    Ryacas::as_r(yacR::as.ysym.mat(x)),
    as.matrix(x)
  )
})
testthat::test_that("matrix", {
  testthat::expect_equal(
    Ryacas::as_r(yacR::as.ysym.mat(y)),
    y
  )
})
