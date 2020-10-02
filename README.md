# Reproducible Paper Template (UNDER CONSTRUCTION)

Main goal: Create a template repository for starting a new paper project implementing good practices for reproducibility

Software: Focused on empirical projects that use mostly R for data manipulation

Disclaimer: This project is based on the author personal preferences, needs and limitations

Requirements: Tested using R version 4.0.2 and RStudio version 1.3.1073 (but may work on other versions)

## Features

* [Random References](https://github.com/jpgmv1998/reproducible_paper_template/blob/master/randomReferences.md) - File intended to store links for references that may be useful for empirical work (e.g. R, Econometrics, Git, and Statistics refereces).

* R Project: Allows better use of relative paths, helps with version control connecting directly to a GitHub project (requires previous setup - see more about [here](https://happygitwithr.com/))

* R packages management: Use of `renv` package to help with package version management and reproducibility (see more about [here](https://rstudio.github.io/renv/articles/renv.html)) 

Ideas for future implementation are stored on [Issues](https://github.com/jpgmv1998/reproducible_paper_template/issues)

## How to use

* Select use this template on the upper right corner (or click [here](https://github.com/jpgmv1998/reproducible_paper_template/generate)) and follow the instructions to create your own GitHub repository

* If you want to use version control within the Rstudio project with git see this [tutorial](https://happygitwithr.com/) then:
    * Open RStudio > File > New Project... > Version Control > Git > insert the url, that appears when clicking on code in your GitHub repository, on Repository URL:

* When using R always open RStudio using the .Rproj file (double-click)


## Folders Structure

## Files description

## Links

List of links and references for those interested in learning more about reproducibility:

* https://web.stanford.edu/~gentzkow/research/CodeAndData.pdf - Code and Data for the Social Sciences: A Practitioner’s Guide by Matthew Gentzkow and Jesse
M. Shapiro (2014)

* https://doi.org/10.7287/peerj.preprints.3192v2 - Paper about uses of R to produce research compendia

* https://aeadataeditor.github.io/aea-de-guidance/ - AEA Data Editor Unofficial Guidance on how to create data and code replicable supplements

* https://guides.github.com/activities/citable-code/ - Guide on how to archive GitHub repository and assign a DOI with Zenodo

* https://rpubs.com/glennwithtwons/reproducible-r-toolbox - RPubs post about reproducibility with R

* https://www.projecttier.org/about/about-project-tier/ - Project dedicated to developing methods and tools for enhancing research transparency



## License
The material in this repository is made available under the [MIT license](http://opensource.org/licenses/mit-license.php). 
