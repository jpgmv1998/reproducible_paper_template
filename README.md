# Reproducible Paper Template (UNDER CONSTRUCTION)

Main goal: Create a template repository for starting a new paper project implementing good practices for reproducibility.

Author: João Pedro Vieira

Software: Focused on empirical projects that use mostly R for data manipulation.

Disclaimer: This project is based on the author's personal preferences, needs, and limitations.

Requirements: Tested using R version 4.0.2 and RStudio version 1.3.1073 (but may work on other versions).


## Features

* [Random References](https://github.com/jpgmv1998/reproducible_paper_template/blob/master/randomReferences.md) - File intended to store links for references that may be useful for empirical work (e.g. R, Econometrics, Git, etc).

* R Project: Allows better use of relative paths, helps with version control connecting directly to a GitHub project (requires previous setup - see more about [here](https://happygitwithr.com/)).

* R packages management: Use of `renv` package to help with package version management and reproducibility (see more about [here](https://rstudio.github.io/renv/articles/renv.html)).

Ideas for future implementation are stored on [Issues](https://github.com/jpgmv1998/reproducible_paper_template/issues).

## How to use

* Select use this template on the upper right corner (or click [here](https://github.com/jpgmv1998/reproducible_paper_template/generate)) and follow the instructions to create your own GitHub repository.

* If you want to use version control within the Rstudio project with git see this [tutorial](https://happygitwithr.com/) then:
    * Open RStudio > File > New Project... > Version Control > Git > insert the url, that appears when clicking on code in your GitHub repository, on Repository URL.

* When using R always open RStudio using the .Rproj file (double-click).

* If you want to use R packages management see this [vignette](https://rstudio.github.io/renv/articles/renv.html) then:
   * Open RProject > execute `install.packages("renv")` if you don't have it yet > execute `renv::init()` > work normally in the project and following the [vignette](https://rstudio.github.io/renv/articles/renv.html) instructions.

## Files description

- `.gitignore`, a text file that tells Git which files/folders should be ignored (not included in the version control system). In this template we mainly want to ignore data files from the raw2clean and projectSpecific folders, in order to avoid exceeding GitHub size limits, see more [here](https://docs.github.com/en/free-pro-team@latest/github/managing-large-files/what-is-my-disk-quota). Instead of adding these folders patterns in this specific files we add one `.gitignore` file in each folder inside `data` whose contents should be ignored. In this way we are able to preserve all the folders structure.

- `LICENSE`, a file to allow others to reproduce, distribute, or create derivatives works using this project.

- `README.md` this file, a general overview of the project in markdown format.

- `randomReferences.md`, a file intended to store links for references that may be useful for empirical work (e.g. R, Econometrics, Git, etc) in markdown format.

## Folders structure

This section explains how code and data should be organized, the structure of folders, and suggestions of patterns for file names. In practice, the files inside the folders are examples and templates, thus they have the prefixes `_example_` or `_template_` in their names, and will be described in the [Script templates and examples](#script-templates-and-examples) section. As noted before this template is very biased towards the author`s personal preferences, needs, and limitations. 

### `Code`

All files inside this folder should be in version control and committed regularly when changes are made.

* `raw2clean` - a folder containing:

    * one `datasetName_raw2clean.R` R script for each dataset folder in `data/raw2clean`. The goal of each script is to read the file(s) in the `data/raw2clean/datasetName_dataSource/input` folder,  perform simple cleaning tasks, and save the cleaned data in the `data/raw2clean/datasetName_dataSource/output` folder preferably in `.Rdata` format (raster is an exception and should be saved as `.tif` format). 
        
    * `_masterfile_raw2clean.R` - an R script to source all raw2clean R scripts and specify the order when relevant.
    
    * `timeProcessing_raw2clean.csv` - a csv file containing the time each script took to run.

* `projectSpecific` - a folder containing:
    
    * possibly multiple subfolders, if the project has more than one base sample for analysis (e.g one sample at the municipality level and the other at the individual level). Each subfolder should contain:
      
      * `sampleConstruction_projectSpecific_subfolderName.R` - an R script to create the samples of interest (e.g. panel, cross-section, spatial).
      
      * multiple R scripts with pattern `variableTheme_projectSpecific_subfolderName.R` to extract/create the variables of interest using one or more data files from `data/raw2clean/datasetName_dataSource/output`, and merge with the relevant sample.
    
      * `sampleAnalysis_subfolderName.R` - an R script to combine all relevant files in `data/projectSpecific/subfolderName` into a single `sampleAnalysis_subfolderName.Rdata` file. 
      
      * `_masterfile_projectSpecific_subfolderName.R` - an R script to source all projectSpecifc/subfolderName R scripts in the desired sequence.
      
      * `timeProcessing_projectSpecific_subfolderName.csv` - a csv file containing the time each script took to run.  
      
* `analysis` - a folder containing some subfolders like:
  
  * `maps` - to generate maps when using spatial data.
  
  * `stats` - to generate descriptive statistics (tables/graphics)

  * `regs` - to generate regression outputs (tables/graphics).
  

* `_functions` - a folder containing R scripts with custom functions used in multiple scripts across the project like:

  * `ExportTimeProcessing.R` - an R script to store ExportTimeProcessing function used to calculate and export the time of processing of each R script.

### `Data`


## Script templates and examples


### `Code`

All files inside this folder should be in version control and committed regularly when changes are made.

* `raw2clean` - a folder containing:

    * one `datasetName_raw2clean.R` R script for each dataset folder in `data/raw2clean`. The goal of each script is to read the file(s) in the `data/raw2clean/datasetName_dataSource/input` folder,  perform simple cleaning tasks, and save the cleaned data in the `data/raw2clean/datasetName_dataSource/output` folder preferably in `.Rdata` format. This template contains one template script and three example scripts: 
    
      * `code/raw2clean/_template_datasetName_raw2clean.R` - an R script containing only the general structure of this type of file.
      * `code/raw2clean/_example_muniDivision2015_raw2clean.R` - a real example of a raw2clean R script with spatial data as input.
      * `code/raw2clean/_example_priorityMuniAmazon_raw2clean.R` - a real example of a raw2clean R script with tabular data as input (.txt format).
      * `code/raw2clean/_example_prodesDeforestationAmazon_raw2clean.R` - a real example of a raw2clean R script with tabular data as input (.pdf format).
        
    * `masterfile_raw2clean.R` - an R script to source all raw2clean R scripts in the desired sequence. This template contains the template version `_template_masterfile_raw2clean.R` and one example version `_example_masterfile_raw2clean.R`.
    
    * `timeProcessing_raw2clean.csv` - a csv file containing the time each script took to run. This template contains the example version `_example_timeProcessing_raw2clean.csv`.

* `projectSpecific` - a folder containing:
    
    * possibly multiple subfolders, if the project has more than one base sample for analysis (e.g one sample at the municipality level and the other at the individual level). Each subfolder should contain:
      
      * `sampleConstruction_projectSpecific_subfolderName.R` - an R script to create the samples of interest (e.g. panel, cross-section, spatial). This template contains the template version `_template_sampleConstruction_projectSpecific_subfolderName.R` and one example `_example_sampleConstruction_projectSpecific_muniLevel.R`.
      
      * multiple R scripts with pattern `variableTheme_projectSpecific_subfolderName.R` to extract/create the variables of interest using one or more data files from `data/raw2clean/datasetName_dataSource/output`, and merge with the relevant sample. This template contains one template script and two example scripts: 
    
        * `code/raw2clean/_template_variableTheme_projectSpecific_subfolderName.R` - an R script containing only the general structure of this type of file.
        * `code/raw2clean/_example_priorityMuniAmazon_projectSpecific_muniLevel.R` - a real example of a projectSpecific R script.
        * `code/raw2clean/_example_prodesDeforestationAmazon_projectSpecific_muniLevel.R` - a real example of a projectSpecific R script.
      
      * `sampleAnalysis_subfolderName.R` - an R script to combine all relevant files in `data/projectSpecific/subfolderName` into a single `sampleAnalysis_subfolderName.Rdata` file.  This template contains the template version `_template_sampleAnalysis_subfolderName.R` and one example `_example_sampleAnalysis_muniLevel.R`.
      
      * `masterfile_projectSpecific_subfolderName.R` - an R script to source all projectSpecifc/subfolderName R scripts in the desired sequence. This template contains the template version `_template_projectSpecific_subfolderName.R` and one example version `_exampleprojectSpecific_muniLevel.R`.
  
      * `timeProcessing_projectSpecific_subfolderName.csv` - a csv file containing the time each script took to run.  This template contains the example version `_example_timeProcessing_projectSpecific_muniLevel.csv`.
        
* `analysis` - a folder containing some subfolders like (pending addition of examples and templates):
  
  * `maps` - to generate maps when using spatial data.
  
  * `stats` - to generate descriptive statistics (tables/graphics)

  * `regs` - to generate regression outputs (tables/graphics).
  

* `_functions` - a folder containing R scripts with custom functions used in multiple scripts across the project like:

  * `ExportTimeProcessing.R` - an R script to store ExportTimeProcessing function used to calculate and export the time of processing of each R script.

### `Data`

All files with the prefix `_template_` contains the suggested structure for that type of file, and all files with the prefix `_example_` contain scripts adapted from its template version to process real data. When using this template all these files should be replaced (adjusting the file name using the pattern without the prefix) or removed from your project.

## License
The material in this repository is made available under the [MIT license](http://opensource.org/licenses/mit-license.php). 
