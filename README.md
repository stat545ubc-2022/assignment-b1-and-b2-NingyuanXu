
<!-- README.md is generated from README.Rmd. Please edit that file -->

# splitDat

<!-- badges: start -->
<!-- badges: end -->

The goal of splitDat is to split the dataset into training and holdout
sets, with the size of training set specified. This way we can use the
training set to train the alogrithm and then use the holdout set to test
the performance of the algorithm.

## Installation

You can install the development version of splitDat from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("stat545ubc-2022/assignment-b1-and-b2-NingyuanXu")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(splitDat)
split_dataset(cars, 30, 447)
#> [[1]]
#>    speed dist
#> 47    24   92
#> 24    15   20
#> 19    13   46
#> 7     10   18
#> 32    18   42
#> 11    11   28
#> 30    17   40
#> 5      8   16
#> 31    17   50
#> 3      7    4
#> 50    25   85
#> 25    15   26
#> 1      4    2
#> 16    13   26
#> 40    20   48
#> 45    23   54
#> 14    12   24
#> 38    19   68
#> 37    19   46
#> 4      7   22
#> 18    13   34
#> 29    17   32
#> 44    22   66
#> 9     10   34
#> 49    24  120
#> 22    14   60
#> 48    24   93
#> 27    16   32
#> 12    12   14
#> 46    24   70
#> 
#> [[2]]
#>    speed dist
#> 2      4   10
#> 6      9   10
#> 8     10   26
#> 10    11   17
#> 13    12   20
#> 15    12   28
#> 17    13   34
#> 20    14   26
#> 21    14   36
#> 23    14   80
#> 26    15   54
#> 28    16   40
#> 33    18   56
#> 34    18   76
#> 35    18   84
#> 36    19   36
#> 39    20   32
#> 41    20   52
#> 42    20   56
#> 43    20   64
```
