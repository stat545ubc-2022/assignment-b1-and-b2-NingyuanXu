library(datateachr)
test_that("Test size of training set in valid cases", {
  expect_equal(nrow(split_dataset(cancer_sample, 300, 447)[[1]]), 300)
})
test_that("Test size of hold-out set in valid cases", {
  expect_equal(nrow(split_dataset(cancer_sample, 300, 321)[[2]]),
               nrow(cancer_sample) - 300)
})
test_that("Test the return types in valid cases", {
  expect_equal(class(split_dataset(cancer_sample, 300, 321)), "list")
})
