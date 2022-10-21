STAT 545B Assignment B1
================

``` r
# Load the libraries
library(datateachr)
library(testthat)
```

``` r
#' Title: split_dataset
#' @details split a dataset into training and holdout sets
#' where the training set will contain 'ntrain' of examples
#' 'ntrain' must be smaller or equal to the total size of 'data'
#' @param 'data' is a data frame or tbl for the dataset
#' 'ntrain' will be numeric, 'seed' will be the numeric
#' @return a list containing both training and holdout sets 

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
```

I am choosing data and ntrain as the names of parameters because data
stands for the data set, whereas ntrain stands for the size of the split
training set. Also, ‘ntrain’ must be smaller or equal to the total data
size. The third parameter, ‘seed,’ is just a number we use to set seed
for the function to establish some randomness in sampling the data.

``` r
# Examples of usage; use head to avoid printing too many rows
head(split_dataset(cancer_sample, 300, 447)[[1]]) # good
```

    ##          ID diagnosis radius_mean texture_mean perimeter_mean area_mean
    ## 559  925277         B       14.59        22.68          96.39     657.1
    ## 339  897880         B       10.05        17.53          64.41     310.8
    ## 327   89524         B       14.11        12.88          90.03     616.5
    ## 203  878796         M       23.29        26.67         158.90    1685.0
    ## 378 9013579         B       13.46        28.21          85.89     562.1
    ## 197  875938         M       13.77        22.29          90.63     588.9
    ##     smoothness_mean compactness_mean concavity_mean concave_points_mean
    ## 559         0.08473          0.13300        0.10290             0.03736
    ## 339         0.10070          0.07326        0.02511             0.01775
    ## 327         0.09309          0.05306        0.01765             0.02733
    ## 203         0.11410          0.20840        0.35230             0.16200
    ## 378         0.07517          0.04726        0.01271             0.01117
    ## 197         0.12000          0.12670        0.13850             0.06526
    ##     symmetry_mean fractal_dimension_mean radius_se texture_se perimeter_se
    ## 559        0.1454                0.06147    0.2254      1.108        2.224
    ## 339        0.1890                0.06331    0.2619      2.015        1.778
    ## 327        0.1373                0.05700    0.2571      1.081        1.558
    ## 203        0.2200                0.06229    0.5539      1.560        4.667
    ## 378        0.1421                0.05763    0.1689      1.150        1.400
    ## 197        0.1834                0.06877    0.6191      2.112        4.906
    ##     area_se smoothness_se compactness_se concavity_se concave_points_se
    ## 559   19.54      0.004242        0.04639     0.065780          0.016060
    ## 339   16.85      0.007803        0.01449     0.016900          0.008043
    ## 327   23.92      0.006692        0.01132     0.005717          0.006627
    ## 203   83.16      0.009327        0.05121     0.089580          0.024650
    ## 378   14.91      0.004942        0.01203     0.007508          0.005179
    ## 197   49.70      0.013800        0.03348     0.046650          0.020600
    ##     symmetry_se fractal_dimension_se radius_worst texture_worst perimeter_worst
    ## 559     0.01638             0.004406        15.48         27.27          105.90
    ## 339     0.02100             0.002778        11.16         26.84           71.98
    ## 327     0.01416             0.002476        15.53         18.00           98.40
    ## 203     0.02175             0.005195        25.12         32.68          177.00
    ## 378     0.01442             0.001684        14.69         35.63           97.11
    ## 197     0.02689             0.004306        16.39         34.01          111.60
    ##     area_worst smoothness_worst compactness_worst concavity_worst
    ## 559      733.5           0.1026            0.3171         0.36620
    ## 339      384.0           0.1402            0.1402         0.10550
    ## 327      749.9           0.1281            0.1109         0.05307
    ## 203     1986.0           0.1536            0.4167         0.78920
    ## 378      680.6           0.1108            0.1457         0.07934
    ## 197      806.9           0.1737            0.3122         0.38090
    ##     concave_points_worst symmetry_worst fractal_dimension_worst
    ## 559              0.11050         0.2258                 0.08004
    ## 339              0.06499         0.2894                 0.07664
    ## 327              0.05890         0.2100                 0.07083
    ## 203              0.27330         0.3198                 0.08762
    ## 378              0.05781         0.2694                 0.07061
    ## 197              0.16730         0.3080                 0.09333

``` r
# Bad usage, ntrain larger than size of data
split_dataset(cancer_sample, 3000, 123) # bad
```

    ## Error in split_dataset(cancer_sample, 3000, 123): ntrain <= nrow(data) is not TRUE

``` r
# Bad usage, wrong input data type
split_dataset(cancer_sample, 'c', 142) # bad
```

    ## Error in split_dataset(cancer_sample, "c", 142): is.numeric(ntrain) is not TRUE

I propose two valid and invalid examples in the above examples. The
first good case splits cancer_sample dataset into training and holdout
sets and returns the (head of) training set, where the training set has
300 samples. The first invalid example is because ntrain is larger than
the total size of the dataset. The second is invalid because the second
parameter is not numeric. The seed is a numeric variable (random number)
to generate randomness.

``` r
# Test the function
test_that("Test size of training set in valid cases", {
  expect_equal(nrow(split_dataset(cancer_sample, 300, 447)[[1]]), 300)
})
```

    ## Test passed 😸

``` r
test_that("Test size of hold-out set in valid cases", {
  expect_equal(nrow(split_dataset(cancer_sample, 300, 321)[[2]]), 
               nrow(cancer_sample) - 300)
})
```

    ## Test passed 🥳

``` r
test_that("Test the return types in valid cases", {
  expect_equal(class(split_dataset(cancer_sample, 300, 321)), "list")
})
```

    ## Test passed 🥳

I write three tests: the first two tests the size of training and
holdout sets after splitting the data. The third test tests the return
type of the function.
