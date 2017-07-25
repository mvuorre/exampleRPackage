
<!-- README.md is generated from README.Rmd. Please edit that file -->
exampleDataPackage
==================

This is an example on how to create a data product by creating an R data package.

Example
-------

Anyone can obtain the data by downloading the .csv files from `data-raw/`, or easily from within R:

``` r
# install.packages("devtools")
devtools::install_github("mvuorre/exampleDataPackage")
```

Then, to make the example data available in an R session:

``` r
library(exampleDataPackage)
head(exampleData)
#>   group     score
#> 1     a  97.18260
#> 2     a  86.87440
#> 3     a 107.95184
#> 4     a 102.70070
#> 5     a  97.22694
#> 6     a  94.33976
```

How the package was created
===========================

First, use R Studio to create a new R Package. Delete `man/hello.Rd` and `R/hello.R`.

Then:

``` r
library(devtools)
use_readme_rmd()
```

Make changes to `README.Rmd`, then click Knit.

``` r
use_data_raw()
```

Put data files (in this case simulate) to `data-raw/`. Write `preprocess.r` in same folder, which outputs cleaned data .csv, and uses `devtools::use_data()` to create R data object in `data/`. Create `R/data.R` that describes the data (i.e. is its metadata):

``` r
#' Scores of Group A and Group B.
#'
#' A data set with the scores of two groups, Group A and Group B.
#'
#' @format A data frame with 53940 rows and 10 variables:
#' \describe{
#'   \item{group}{Participant's group, A or B.}
#'   \item{score}{The participant's score in hypothetical task Z.}
#' }
#' @source \url{https://www.github.com/mvuorre/exampleDataPackage}
"exampleData"
```

-   Delete NAMESPACE if present
-   Run `devtools::document()`

Edit DESCRIPTION:

-   add Depends: R (&gt;= 3.1.0)

Run `devtools::use_mit_license()` (or gpl3...).

Then go to R Studio's **Build** tab, and click "Build & Reload". If everything went well, this should build the R package you have just created, and loads it into your current R workspace. You can then use your data simply by calling the name of the data object:

``` r
head(exampleData)
#>   group     score
#> 1     a  97.18260
#> 2     a  86.87440
#> 3     a 107.95184
#> 4     a 102.70070
#> 5     a  97.22694
#> 6     a  94.33976
```

Of course, if you just wanted to use your own data right now, there is little point in doing the extra work described here. However, the true benefits become apparent when you want to come back to the data in a few months time. It will be available to you with the above command, with full documentation. Furthermore, the data product is now easily shared with others, as described next.

How to share the data product
=============================

The easiest way to share the data product is to create the R package as a Git repository (see our tutorial on Git + GitHub: <https://github.com/mvuorre/reproguide-curate>). Once the R package's source code is pushed to GitHub, authorized users (by default, anyone) can browse it on GitHub and manually download any files they'd like (e.g. the raw data files.) Importantly, they can obtain the data very easily from within R by installing the R package you have just created:

``` r
devtools::install_github("mvuorre/exampleDataPackage")
#> Downloading GitHub repo mvuorre/exampleDataPackage@master
#> from URL https://api.github.com/repos/mvuorre/exampleDataPackage/zipball/master
#> Installation failed: Not Found (404)
```

The above command, when executed in R, downloads and installs the `exampleDataPackage` from GitHub user `mvuorre`.

Advanced topics
===============

Documenting analysis as vignette
--------------------------------

It is also helpful to share the full analysis code in which the data was used. This is naturally written as an R script, which can easily be turned into an *R package vignette*. To initiate a vignette, use

``` r
devtools::use_vignette("Example-Analysis")
```

This creates a vignette template, into which you can write normal R Markdown code. See `vignettes/Example-Analysis.Rmd` for an example.

Creating a website for the R data package
-----------------------------------------

You can even create a website for the data package. For this, you need the [pkgdown](https://hadley.github.io/pkgdown/) R package:

``` r
# install.packages("devtools")
devtools::install_github("hadley/pkgdown")
```

You will need to change

    output:
      md_document:
        variant: markdown_github

to

    output: rmarkdown::github_document

at the top of the `README.Rmd` file.

To create the website, simply run:

``` r
pkgdown::build_site()
```

The website is now available at `docs/index.html`. To make the website available to others, you will want to host it somewhere in the internet. The easiest option, again, is to host it on GitHub. Assuming you have created the package in a local Git repository and have synced the repository to GitHub, this is easy. Push all the current changes to GitHub, and then go to the package's GitHub website, click "Settings", and scroll down to "GitHub Pages". There, click on the "Source" pull-down menu that currently says "None", and choose the "master branch /docs folder". Save the changes. After a little while, the page will be visible at <https://username.github.io/packagename>. For example, `exampleDataPackage`'s website is at <https://mvuorre.github.io/exampleDataPackage>.

Thank you for reading.
