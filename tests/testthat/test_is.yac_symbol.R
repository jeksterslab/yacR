#' ---
#' title: "Test: is.yac_symbol"
#' author: "Ivan Jacob Agaloos Pesigan"
#' date: "`r Sys.Date()`"
#' output: rmarkdown::html_vignette
#' vignette: >
#'   %\VignetteIndexEntry{Test: is.yac_symbol}
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
testthat::test_that("TRUE", {
  testthat::expect_true(
    yacR::is.yac_symbol(Ryacas::ysym(1:5))
  )
})
testthat::test_that("FALSE", {
  testthat::expect_false(
    yacR::is.yac_symbol(1:5)
  )
})
