#' Split a dataset into training and holdout
#'
#' @details split a dataset into training and holdout sets
#' where the training set will contain 'ntrain' of examples
#' 'ntrain' must be smaller or equal to the total size of 'data'
#'
#' @param data is a data frame or tbl for the dataset
#' @param ntrain will be numeric as the size of the training set
#' @param seed will be the numeric to generate randomness
#'
#' @return a list containing both training and holdout sets
#' @export
#'
#' @examples
#' split_dataset(cars, 30, 447)
split_dataset <- function(data, ntrain, seed) {
  stopifnot(is.numeric(ntrain))
  stopifnot(is.numeric(seed))
  stopifnot(ntrain <= nrow(data))
  set.seed(seed) # set randomness
  itrain = sample(nrow(data), ntrain)
  train = data[itrain, ]
  holdout = data[-itrain, ]
  list(train, holdout)
}
