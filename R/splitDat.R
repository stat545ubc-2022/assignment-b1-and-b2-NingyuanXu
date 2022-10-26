#' Split a dataset into training and holdout
#'
#' @details split a dataset into training and holdout sets
#' where the training set will contain 'ntrain' of examples
#' 'ntrain' must be smaller or equal to the total size of 'data'
#'
#' @param 'data' is a data frame or tbl for the dataset
#' 'ntrain' will be numeric, 'seed' will be the numeric
#'
#' @return a list containing both training and holdout sets
#' @export
#'
#' @examples
#' split_dataset(datateachr::cancer_sample, 300, 447)
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
