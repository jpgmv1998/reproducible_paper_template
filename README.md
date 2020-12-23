# Reproducible Paper Template (UNDER CONSTRUCTION)

Main goal: Create a template repository for starting a new paper project implementing good practices for reproducibility

Author: João Pedro Vieira

Software: Focused on empirical projects that use mostly R for data manipulation

Disclaimer: This project is based on the author personal preferences, needs, and limitations

Requirements: Tested using R version 4.0.2 and RStudio version 1.3.1073 (but may work on other versions)


## Features

* [Random References](https://github.com/jpgmv1998/reproducible_paper_template/blob/master/randomReferences.md) - File intended to store links for references that may be useful for empirical work (e.g. R, Econometrics, Git, etc).

* R Project: Allows better use of relative paths, helps with version control connecting directly to a GitHub project (requires previous setup - see more about [here](https://happygitwithr.com/))

* R packages management: Use of `renv` package to help with package version management and reproducibility (see more about [here](https://rstudio.github.io/renv/articles/renv.html)) 

Ideas for future implementation are stored on [Issues](https://github.com/jpgmv1998/reproducible_paper_template/issues)

## How to use

* Select use this template on the upper right corner (or click [here](https://github.com/jpgmv1998/reproducible_paper_template/generate)) and follow the instructions to create your own GitHub repository

* If you want to use version control within the Rstudio project with git see this [tutorial](https://happygitwithr.com/) then:
    * Open RStudio > File > New Project... > Version Control > Git > insert the url, that appears when clicking on code in your GitHub repository, on Repository URL.

* When using R always open RStudio using the .Rproj file (double-click)

* If you want to use R packages management see this [vignette](https://rstudio.github.io/renv/articles/renv.html) then:
   * Open RProject > execute `install.packages("renv")` if you don't have it yet > execute `renv::init()` > work normally in the project and following the [vignette](https://rstudio.github.io/renv/articles/renv.html) instructions

## Files description


## Folders Structure




## License
The material in this repository is made available under the [MIT license](http://opensource.org/licenses/mit-license.php). 
