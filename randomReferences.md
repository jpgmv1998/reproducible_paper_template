# Random (hopefully useful) References

 File intended to store references that may be useful for empirical work focused on data science tools (emphasis in R). 
 
# Table of Contents

- [R](#r)
  - [References](#references)
    - [General](#general)
    - [Spatial Data](#spatial-data)
    - [R Markdown](#r-markdown)
  - [R Packages](#r-packages)
    - [Package Reproducibility](#package-reproducibility)
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

[R: Uma Introdução Para Economistas](https://danmrc.github.io/R-para-Economistas/) - introduction to R for economists (reference in portuguese)

[Parallel Computing with R](https://arxiv.org/abs/1912.11144) - a comprehensive overview of all things R parallel (working paper)

[Databases using dplyr](https://db.rstudio.com/dplyr) - RStudio's tutorial

[R interface for Apache Spark](https://spark.rstudio.com/) - RStudio's tutorial

#### R Markdown

[R Markdown: The Definitive Guide](https://bookdown.org/yihui/rmarkdown) - Book for R Markdown references.

[R Markdown Cookbook](https://bookdown.org/yihui/rmarkdown-cookbook/) - This book is designed to provide a range of examples on how to extend the functionality of your R Markdown documents. As a cookbook, this guide is recommended to new and intermediate R Markdown users who desire to enhance the efficiency of using R Markdown and also explore the power of R Markdown.

[Academic Publications with R Markdown](https://danovando.github.io/publications-with-rmarkdown/presentations/pubs-with-rmarkdown#1) - slide presentation about using R markdown to write academic papers

#### Spatial Data

[Spatial Data Science](https://keen-swartz-3146c4.netlify.app/) - The book aims at data scientists who want to get a grip on using spatial data in their analysis. To exemplify how to do things, it uses R.

[Geocomputation with R](https://geocompr.robinlovelace.net/) - geographic data analysis, visualization, and modeling.

[R as GIS for Economists](https://tmieno2.github.io/R-as-GIS-for-Economists/) - This book aims particularly at spatial data processing for econometric projects, where spatial variables become part of econometric analysis. 

[Spatio-Temporal Statistics with R](https://spacetimewithr.org/) - Book about spatial statistics topics

[Spatial Data Science with R and “terra”](https://rspatial.org/terra/index.html) - Resources that teach spatial data analysis using the new package "terra" that will substitute the  "raster" package

### R Packages

#### Package Reproducibility

[checkpoint](https://cran.r-project.org/web/packages/checkpoint/vignettes/checkpoint.html#using-checkpoint) - The goal of the checkpoint package is to solve the problem of package reproducibility in R. Since packages get updated on CRAN all the time, it can be difficult to recreate an environment where all your packages are consistent with some earlier state. To solve this issue, checkpoint allows you to install packages locally as they existed on a specific date from the corresponding snapshot (stored on the checkpoint server) and it configures your R session to use only these packages. Together, the checkpoint package and the checkpoint server act as a CRAN time machine so that anyone using checkpoint() can ensure the reproducibility of their scripts or projects at any time.

[renv](https://rstudio.github.io/renv/articles/renv.html) - Underlying the philosophy of renv is that any of your existing workflows should just work as they did before – renv helps manage library paths (and other project-specific state) to help isolate your project’s R dependencies, and the existing tools you’ve used for managing R packages (e.g. install.packages(), remove.packages()) should work as they did before

[groundhog](http://groundhogr.com/) - Reproducible Scripts via Version-Specific Package Loading 

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

[rgee](https://github.com/r-spatial/rgee) - rgee is a binding package for calling Google Earth Engine API from within R. Additionally, several functions have been implemented to make simple the connection with the R spatial ecosystem. The current version of rgee has been built considering the earthengine-api 0.1.235. Note that access to Google Earth Engine is only available to registered users.

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

[econocharts](https://github.com/R-CoderDotCom/econocharts/) - Microeconomics/macroeconomics graphs made with ggplot2. This package allows creating microeconomics or macroeconomics charts in R with simple functions

[furrr](https://davisvaughan.github.io/furrr/) - combine purrr’s family of mapping functions with the future’s parallel processing capabilities.

[ralger](https://github.com/feddelegrand7/ralger) - The goal of ralger is to facilitate web scraping in R.

## Econometrics

[Introduction to Econometrics with R](https://www.econometrics-with-r.org/index.html) -  Interactive learning material that blends R code with the contents of the well-received textbook Introduction to Econometrics by Stock and Watson (2015).

[Library of Statistical Techniques (LOST)](lost-stats.github.io/) - Publicly-editable website to make it easy to execute statistical techniques in statistical software.

[Literature on Recent Advances in Applied Micro Methods](https://christinecai.github.io/PublicGoods/applied_micro_methods.pdf) - List of papers with recent advances in applied micro methods

[Modern Difference in Difference Designs - Workshop Syllabus](https://www.dropbox.com/s/3asu2qgpxnbe6xp/Modern_DiD_II.pdf?dl=0) - This ten-day workshop will begin with the basic DiD design using two-way fixed effects and build up to the state-of-the-art applications. We will then move into advanced extensions like matching, synthetic control, asymmetric/staggered treatments, dynamic treatments, interference, and heterogeneous treatment effects. We will work though DiD designs with practical examples, assumptions, diagnostics, and code in R and Stata (when available).
 
[Ph.D. Econometrics (III) taught with R - Ed Rubin](https://github.com/edrubin/EC607S20) - Econometrics with R graduate course.


## Public Available Resources

[Data Science for Economists- Grant R. McDermott](https://github.com/uo-ec607/lectures) - Introduction to the modern data science toolkit (focused on R) graduate course.

[Template for Overleaf](https://github.com/talgross-bu/Template-for-Overleaf) - A LaTeX Template for Economics Papers.

[R Guide](https://github.com/skhiggins/R_guide) - This guide provides instructions for using R on research projects. Its purpose is to use with collaborators and research assistants to make code consistent, easier to read, transparent, and reproducible.

[World Bank Methodology Posts](https://blogs.worldbank.org/impactevaluations/curated-list-our-postings-technical-topics-your-one-stop-shop-methodology-0) - 
This is a curated list of our technical postings, to serve as a one-stop shop for your technical reading. I’ve focused here on our posts on methodological issues in impact evaluation – we also have a whole lot of posts on how to conduct surveys and measure certain concepts curated here. In lieu of our regular links this week, it is updated up to August 20, 2020

[RA Manual - Gentzkow & Shapiro Lab](https://github.com/gslab-econ/ra-manual/wiki) - Manual intended to introduce their workflow for new Research Assistants 

[Applied Economics with R - Hans H. Sievertsen](https://hhsievertsen.github.io/applied_econ_with_r/) - The tutorial is structured as a complete research project starting with loading the raw data and ending with a chart comparing the estimates across approaches.

## Git

[Happy Git with R](https://happygitwithr.com/) - Instructions to integrate Git(Hub) with R and RStudio.

[Oh Shit, Git!](https://ohshitgit.com/) - Tips for common git mistakes.
 
[Git Large File Storage](https://git-lfs.github.com/) - An open-source Git extension for versioning large files.
 
## Reproducibility 

[Replication tutorial - Lars Vilhuber](https://labordynamicsinstitute.github.io/replication-tutorial-2019/#/12) - Replication and Reproducibility in Social Sciences and Statistics: Overview and Practice (2019).

[Replicability Presentations - Lars Vilhuber](https://github.com/labordynamicsinstitute/replicability-presentation-2020) - In this talk, I describe the context in which the current discussion in the social science is occurring: what are the definitions of replicability and reproducibility, what is failing, and to what extent. I discuss progess over the past 15 years. Finally, I discuss the concrete measures that have been implemented under my guidance at the American Economic Association, and the first preliminary outcomes from those measures. I conclude with some observations on how to integrate reproducibility into the scientific workflow in the social and statistical sciences.
 
[Generic Paper Templare - Lars Vilhuber](https://github.com/labordynamicsinstitute/paper-template) - simple template with some examples of programs for setup of multiple softwares.

[Gentzkow-Shapiro Lab template]https://github.com/gslab-econ/template - The GSLab Template is a minimal working demonstration of the tools and organization used by projects in the GSLab. We use SCons and a few custom builders to execute scripts and track dependencies in a portable and flexible manner.

[Code and Data Guide - Gentzkow & Shapiro](https://web.stanford.edu/~gentzkow/research/CodeAndData.pdf) - Code and Data for the Social Sciences: A Practitioner’s Guide by Matthew Gentzkow and Jesse M. Shapiro (2014).

[Research Compendia](https://doi.org/10.7287/peerj.preprints.3192v2) - Paper about uses of R to produce research compendia.

[Unofficial guidance replication supplements - AEA Data Editor](https://aeadataeditor.github.io/aea-de-guidance/) - AEA Data Editor Unofficial Guidance on how to create data and code replicable supplements.

[Archive GitHub repo with Zenodo](https://guides.github.com/activities/citable-code/) - Guide on how to archive GitHub repository and assign a DOI with Zenodo.

[Reproducible R toolbox](https://rpubs.com/glennwithtwons/reproducible-r-toolbox) - RPubs post about reproducibility with R.

[Project TIER](https://www.projecttier.org/about/about-project-tier/) - Project dedicated to developing methods and tools for enhancing research transparency.
