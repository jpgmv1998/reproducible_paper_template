# Random (hopefully useful) References

 File intended to store references that may be useful for empirical work, focused on data science tools. 
 
# Table of Contents

- [R](#r)
  - [References](#references)
    - [General](#general)
    - [Spatial Data](#spatial-data)
  - [R Packages](#r-packages)
    - [Data Frame Manipulation](#data-frame-manipulation)
    - [Spatial Data Manipulation](#spatial-data-manipulation)
    - [Regression Analysis and Output Presentation](#regression-analysis-and-output-presentation)
    - [Other](#other)
- [Econometrics](#econometrics)
- [Statistics](#statistics)
- [Public Available Courses](#public-available-courses)
- [Git](#git)
- [Reproducibility](#reproducibility)
  

## R 

### References

#### General

[R for Data Science Book](https://r4ds.had.co.nz/) - Book with a practicum of skills for data science in R.

[Advanced R Book](https://adv-r.hadley.nz/) - Book designed primarily for R users who want to improve their programming skills and understanding of the language.

[R Markdown: The Definitive Guide](https://bookdown.org/yihui/rmarkdown) - Book for R Markdown references.

[R: Uma Introdução Para Economistas](https://danmrc.github.io/R-para-Economistas/) - introduction to R for economists (portuguese reference)

[Parallel Computing with R](https://arxiv.org/abs/1912.11144) - comprehensive overview of all things R parallel (working paper)

[Databases using dplyr](https://db.rstudio.com/dplyr) - RStudio's tutorial

[R interface for Apache Spark](https://spark.rstudio.com/) - RStudio's tutorial

#### Spatial Data

[Spatial Data Science](https://keen-swartz-3146c4.netlify.app/) - The book aims at data scientists who want to get a grip on using spatial data in their analysis. To exemplify how to do things, it uses R.

[Geocomputation with R](https://geocompr.robinlovelace.net/) - geographic data analysis, visualization and modeling.

[R as GIS for Economists](https://tmieno2.github.io/R-as-GIS-for-Economists/) - This book aims particularly at spatial data processing for econometric projects, where spatial variables become part of an econometric analysis. 

[Spatio-Temporal Statistics with R](https://spacetimewithr.org/) - Book about spatial statistics topics

### R Packages

#### Data Frame Manipulation
[Tidyverse](https://www.tidyverse.org/) - collection of packages share an underlying design philosophy, grammar, and data structures. Used for data cleaning, wrangling, visualization, and more. 

[data.table](https://rdatatable.gitlab.io/data.table/) - package for data manipulation. Fast, memory efficient, concise, stable, dependency free. Recommended for large data.

[dtplyr](https://dtplyr.tidyverse.org/) - dtplyr provides a data.table backend for dplyr. The goal of dtplyr is to allow you to write dplyr code that is automatically translated to the equivalent, but usually much faster, data.table code.

[tidyfast](https://tysonbarrett.com/tidyfast/) - provide fast and efficient alternatives to some tidyr (and a few dplyr) functions using data.table under the hood.

[dbplyr](https://dbplyr.tidyverse.org/) - dbplyr is the database backend for dplyr. It allows you to use remote database tables as if they are in-memory data frames by automatically converting dplyr code into SQL.

[sparklyr](https://spark.rstudio.com/) - Spark is a unified analytics engine for large-scale data processing. Spark can scale in ways that R simply can’t.

#### Spatial Data Manipulation

[sf](https://r-spatial.github.io/sf/) - spatial manipulation (vector-based)

[raster](https://cran.r-project.org/web/packages/raster/raster.pdf) - spatial manipulation (raster-based)

[leaflet](https://rstudio.github.io/leaflet/) - plot interactive maps

#### Regression Analysis and Output Presentation

[model summary](https://vincentarelbundock.github.io/modelsummary/) - modelsummary creates tables and plots to summarize statistical models and data in R.

[vtable](https://nickch-k.github.io/vtable/) - The vtable package is designed to help you quickly and efficiently look at and document your data. It is also very good at producing the type of “out of the box” summary tables that economists like.

[broom](https://broom.tidymodels.org/) - helps converting regression outputs into “tidy” data frames.

[estimatr](https://declaredesign.org/r/estimatr/articles/getting-started.html) - dedicated to providing fast estimators that take into consideration designs often used by social scientists.

[fixest](https://cran.r-project.org/web/packages/fixest/vignettes/fixest_walkthrough.html) - provides family of functions to perform estimations with multiple fixed-effects. This package is currently (Feb. 2020) the fastest software available to perform fixed-effects estimations.

[lfe](https://cran.r-project.org/web/packages/lfe/lfe.pdf) - Useful for estimating linear models with multiple group fixed effects. Offers near-identical functionality to the popular Stata library, reghdfe.

[drdid](https://pedrohcgs.github.io/DRDID/reference/drdid.html) - used to compute the locally efficient doubly robust estimators for the ATT in difference-in-differences (DiD) setups.

[did](https://rdrr.io/cran/did/f/README.md) - contains tools for computing average treatment effect parameters in Difference in Differences models with more than two periods, with variation in treatment timing across individuals, and where the DID assumption possibly holds conditional on covariates.

[gsynth](https://yiqingxu.org/software/gsynth/gsynth_examples.html) - R package for [Generalized Synthetic Control Method: for Causal Inference with Interactive Fixed Effect Models](https://papers.ssrn.com/sol3/papers.cfm?abstract_id=2584200).

[scul](https://hollina.github.io/scul/index.html) - This repository contains the R package scul that is used in [Hollingsworth and Wing (2020) “Tactics for design and inference in synthetic control studies: An applied example using high-dimensional data.”](https://doi.org/10.31235/osf.io/fc9xt).

[mfx](https://cran.r-project.org/web/packages/mfx/vignettes/mfxarticle.pdf) - provides functions that estimate a number of popular generalized linear models, returning marginal effects as output.

[margins](https://cran.r-project.org/web/packages/margins/vignettes/Introduction.html) - margins is an effort to port Stata’s (closed source) margins command to R as an S3 generic method for calculating the marginal effects (or “partial effects”) of covariates included in model objects (like those of classes “lm” and “glm”).

#### Other
[furrr](https://davisvaughan.github.io/furrr/) - combine purrr’s family of mapping functions with future’s parallel processing capabilities.


## Econometrics

[Introduction to Econometrics with R](https://www.econometrics-with-r.org/index.html) -  Interactive learning material that blends R code with the contents of the well-received textbook Introduction to Econometrics by Stock and Watson (2015).

## Statistics

[Library of Statistical Techniques (LOST)](lost-stats.github.io/) - Publicly-editable website with the goal of making it easy to execute statistical techniques in statistical software.

## Public Available Resources

[Data Science for Economists- Grant R. McDermott](https://github.com/uo-ec607/lectures) - Introduction to the modern data science toolkit (focused on R) graduate course.

[PhD Econometrics (III) taught with R - Ed Rubin](https://github.com/edrubin/EC607S20) - Econometrics with R graduate course.

[RA Manual - Gentzkow & Shapiro Lab](https://github.com/gslab-econ/ra-manual/wiki) - Manual intended to introduce their workflow for new Research Assistants 

## Git

[Happy Git with R](https://happygitwithr.com/) - Instructions to integrate Git(Hub) with R and RStudio.

[Oh Shit, Git!](https://ohshitgit.com/) - Tips for common git mistakes.
 
[Git Large File Storage](https://git-lfs.github.com/) - An open source Git extension for versioning large files.
 
## Reproducibility 

See links section on [README](https://github.com/jpgmv1998/reproducible_paper_template#links)

