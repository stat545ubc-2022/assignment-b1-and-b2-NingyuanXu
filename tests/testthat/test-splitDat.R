test_that("Test size of training set in valid cases", {
  expect_equal(nrow(split_dataset(cars, 30, 447)[[1]]), 30)
})
test_that("Test size of hold-out set in valid cases", {
  expect_equal(nrow(split_dataset(cars, 30, 321)[[2]]),
               nrow(cars) - 30)
})
test_that("Test the return types in valid cases", {
  expect_equal(class(split_dataset(cars, 30, 321)), "list")
})
