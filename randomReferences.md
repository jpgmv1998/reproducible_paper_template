# Random (hopefully useful) References

 File intended to store references that may be useful for empirical work focused on data science tools (emphasis in R). 
 
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
- [Public Available Resources](#public-available-resources)
- [Git](#git)
- [Reproducibility](#reproducibility)
  

## R 

### References

#### General

[R for Data Science Book](https://r4ds.had.co.nz/) - Book with a practicum of skills for data science in R.

[Advanced R Book](https://adv-r.hadley.nz/) - Book designed primarily for R users who want to improve their programming skills and understanding of the language.

[Data Visualization with R](https://rkabacoff.github.io/datavis/) - This book helps you create the most popular visualizations - from quick and dirty plots to publication-ready graphs. The text relies heavily on the ggplot2 package for graphics, but other approaches are covered as well.

[R Markdown: The Definitive Guide](https://bookdown.org/yihui/rmarkdown) - Book for R Markdown references.

[R Markdown Cookbook](https://bookdown.org/yihui/rmarkdown-cookbook/) - This book is designed to provide a range of examples on how to extend the functionality of your R Markdown documents. As a cookbook, this guide is recommended to new and intermediate R Markdown users who desire to enhance the efficiency of using R Markdown and also explore the power of R Markdown.

[Academic Publications with R Markdown](https://danovando.github.io/publications-with-rmarkdown/presentations/pubs-with-rmarkdown#1) - slide presentation about using R markdown to write academic papers

[R: Uma Introdução Para Economistas](https://danmrc.github.io/R-para-Economistas/) - introduction to R for economists (reference in portuguese)

[Parallel Computing with R](https://arxiv.org/abs/1912.11144) - a comprehensive overview of all things R parallel (working paper)

[Databases using dplyr](https://db.rstudio.com/dplyr) - RStudio's tutorial

[R interface for Apache Spark](https://spark.rstudio.com/) - RStudio's tutorial

#### Spatial Data

[Spatial Data Science](https://keen-swartz-3146c4.netlify.app/) - The book aims at data scientists who want to get a grip on using spatial data in their analysis. To exemplify how to do things, it uses R.

[Geocomputation with R](https://geocompr.robinlovelace.net/) - geographic data analysis, visualization, and modeling.

[R as GIS for Economists](https://tmieno2.github.io/R-as-GIS-for-Economists/) - This book aims particularly at spatial data processing for econometric projects, where spatial variables become part of econometric analysis. 

[Spatio-Temporal Statistics with R](https://spacetimewithr.org/) - Book about spatial statistics topics

### R Packages

#### Data Frame Manipulation
[Tidyverse](https://www.tidyverse.org/) - a collection of packages that share an underlying design philosophy, grammar, and data structures. Used for data cleaning, wrangling, visualization, and more. 

[data.table](https://rdatatable.gitlab.io/data.table/) - package for data manipulation. Fast, memory efficient, concise, stable, dependency-free. Recommended for large data.

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

[broom](https://broom.tidymodels.org/) - helps to convert regression outputs into “tidy” data frames.

[estimatr](https://declaredesign.org/r/estimatr/articles/getting-started.html) - dedicated to providing fast estimators that take into consideration designs often used by social scientists.

[fixest](https://cran.r-project.org/web/packages/fixest/vignettes/fixest_walkthrough.html) - provides a family of functions to perform estimations with multiple fixed-effects. This package is currently (Feb. 2020) the fastest software available to perform fixed-effects estimations.

[lfe](https://cran.r-project.org/web/packages/lfe/lfe.pdf) - Useful for estimating linear models with multiple group fixed effects. Offers near-identical functionality to the popular Stata library, reghdfe.

[drdid](https://pedrohcgs.github.io/DRDID/reference/drdid.html) - used to compute the locally efficient doubly robust estimators for the ATT in difference-in-differences (DiD) setups.

[did](https://rdrr.io/cran/did/f/README.md) - contains tools for computing average treatment effect parameters in Difference in Differences models with more than two periods, with variation in treatment timing across individuals, and where the DID assumption possibly holds conditional on covariates.

[gsynth](https://yiqingxu.org/software/gsynth/gsynth_examples.html) - R package for [Generalized Synthetic Control Method: for Causal Inference with Interactive Fixed Effect Models](https://papers.ssrn.com/sol3/papers.cfm?abstract_id=2584200).

[scul](https://hollina.github.io/scul/index.html) - This repository contains the R package scul that is used in [Hollingsworth and Wing (2020) “Tactics for design and inference in synthetic control studies: An applied example using high-dimensional data.”](https://doi.org/10.31235/osf.io/fc9xt).

[mfx](https://cran.r-project.org/web/packages/mfx/vignettes/mfxarticle.pdf) - provides functions that estimate a number of popular generalized linear models, returning marginal effects as output.

[margins](https://cran.r-project.org/web/packages/margins/vignettes/Introduction.html) - margins is an effort to port Stata’s (closed source) margins command to R as an S3 generic method for calculating the marginal effects (or “partial effects”) of covariates included in model objects (like those of classes “lm” and “glm”).

#### Other

[furrr](https://davisvaughan.github.io/furrr/) - combine purrr’s family of mapping functions with the future’s parallel processing capabilities.

[ralger](https://github.com/feddelegrand7/ralger) - The goal of ralger is to facilitate web scraping in R.

## Econometrics

[Introduction to Econometrics with R](https://www.econometrics-with-r.org/index.html) -  Interactive learning material that blends R code with the contents of the well-received textbook Introduction to Econometrics by Stock and Watson (2015).

[Library of Statistical Techniques (LOST)](lost-stats.github.io/) - Publicly-editable website to make it easy to execute statistical techniques in statistical software.

## Public Available Resources

[Data Science for Economists- Grant R. McDermott](https://github.com/uo-ec607/lectures) - Introduction to the modern data science toolkit (focused on R) graduate course.

[Ph.D. Econometrics (III) taught with R - Ed Rubin](https://github.com/edrubin/EC607S20) - Econometrics with R graduate course.

[RA Manual - Gentzkow & Shapiro Lab](https://github.com/gslab-econ/ra-manual/wiki) - Manual intended to introduce their workflow for new Research Assistants 

[Applied Economics with R - Hans H. Sievertsen](https://hhsievertsen.github.io/applied_econ_with_r/) - The tutorial is structured as a complete research project starting with loading the raw data and ending with a chart comparing the estimates across approaches.

## Git

[Happy Git with R](https://happygitwithr.com/) - Instructions to integrate Git(Hub) with R and RStudio.

[Oh Shit, Git!](https://ohshitgit.com/) - Tips for common git mistakes.
 
[Git Large File Storage](https://git-lfs.github.com/) - An open-source Git extension for versioning large files.
 
## Reproducibility 

See links section on [README](https://github.com/jpgmv1998/reproducible_paper_template#links)

