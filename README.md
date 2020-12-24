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
    * Remember to substitute with your own scripts, move to outside the folder project, or remove all files with prefixes `_example_` and `_template_` before initializing renv management to avoid including unnecessary packages and its dependencies in the project library. 
   * Open RProject > execute `install.packages("renv")` if you don't have it yet > execute `renv::init()` > work normally in the project and following the [vignette](https://rstudio.github.io/renv/articles/renv.html) instructions.

## Files description

- `.gitignore`, a text file that tells Git which files/folders should be ignored (not included in the version control system). When using GitHUb repositories it is important to be aware of its [size limits](https://docs.github.com/en/free-pro-team@latest/github/managing-large-files/what-is-my-disk-quota) and ignore large files. Also, there are other type of files that you should ignore, see more [here](https://henriquesd.medium.com/the-gitignore-file-dc293f6c80fb). In this template the default is to ignore some R files including data output, and subfolders in `data` that normally contain large files (`data/raw2clean/datasetName_dataSource/input`; `data/raw2clean/datasetName_dataSource/output`; `data/projectSpecific`). Instead of adding these folders patterns in this specific file we add one `.gitignore` file inside each relevant folder. In this way we are able to preserve all the folders structure, while avoiding to commit large files.

- `LICENSE`, a file to allow others to reproduce, distribute, or create derivatives works using this project.

- `README.md` this file, a general overview of the project in markdown format.

- `randomReferences.md`, a file intended to store links for references that may be useful for empirical work (e.g. R, Econometrics, Git, etc) in markdown format.

## Folders structure

This section explains how code and data should be organized, the structure of folders, and suggestions of patterns for file names. In practice, the files inside the folders are examples and templates, thus they have the prefixes `_example_` or `_template_` in their names, and will be described in the [Script templates and examples](#script-templates-and-examples) section. As noted before this template is very biased towards the author`s personal preferences, needs, and limitations. 

### `code`

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

### `data`

The default of this folder is to ignore all subfolders that normally contain large files (`data/raw2clean/datasetName_dataSource/input`; `data/raw2clean/datasetName_dataSource/output`; `data/projectSpecific`). However, if your project only has small files respecting [GitHub limits](https://docs.github.com/en/free-pro-team@latest/github/managing-large-files/what-is-my-disk-quota) (in my experience this is a rare case) you can have everything in the version control (which is ideal) just by removing the `.gitignore` files inside the `data` subfolders and adjusting the `.gitignore` in the root removing `.Rdata` and `.RData` patterns. 

* `raw2clean` - a folder containing:

    * one `data/raw2clean/datasetName_dataSource` folder for each dataset. Each folder has three subfolder: 
        * `documentation` - containing always the `_metadata` file with information about the download and the dataset, additionaly can contain other relevant documents
        * `input` - containing the raw data stored in the original format you should never change it, only unzip and extract the files from the downloaded folder when necessary.
        * `output` - containing ususally a single `.Rdata` file with the cleaned data, but sometimes multiple `.Rdata` may be necessary due to size constraints or the `.tif` format may be used when the input data is a raster file.
        

* `projectSpecific` - a folder containing:
    
    * possibly multiple subfolders, if the project has more than one base sample for analysis (e.g one sample at the municipality level and the other at the individual level). Each subfolder should contain:
    
    *
    
    *
    
    *
     
* `analysis` - a folder, that may need more adaptations accordingly to the project, containing some subfolders like:
  
  * `maps` - to store maps when using spatial data.
  
  * `stats` - to store descriptive statistics (tables/graphics)

  * `regs` - to store regression outputs (tables/graphics).
  

## Script templates and examples

All files with the prefix `_template_` contains the suggested structure for that type of file, and all files with the prefix `_example_` contain scripts adapted from its template version to process real data. When using this template all these files should be replaced (adjusting the file name using the pattern without the prefix) or removed from your project. Also, the example scripts may use libraries that you won't use in your project so you should beware adding unnecessary packages to `renv` management, one alternative is to make a copy of the project to test these features.

### `code`

* `raw2clean` - a folder containing:

    * This template contains one template script and four example scripts of the `datasetName_raw2clean.R`: 
    
      * `code/raw2clean/_template_datasetName_raw2clean.R` - an R script containing only the general structure of this type of file.
      * `code/raw2clean/_example_muniDivision2015_raw2clean.R` - a real example of a raw2clean R script with spatial data as input.
      * `code/raw2clean/_example_biomesDivision_raw2clean.R` - a real example of a raw2clean R script with spatial data as input.
      * `code/raw2clean/_example_priorityMuniAmazon_raw2clean.R` - a real example of a raw2clean R script with tabular data as input (.txt format).
      * `code/raw2clean/_example_prodesDeforestationAmazon_raw2clean.R` - a real example of a raw2clean R script with tabular data as input (.pdf format).
        
    * This template contains the template version `_template_masterfile_raw2clean.R` and one example version `_example_masterfile_raw2clean.R` of the `masterfile_raw2clean.R`.
    
    * This template contains the example version `_example_timeProcessing_raw2clean.csv` of the `timeProcessing_raw2clean.csv`.

* `projectSpecific` - a folder containing:
    
    * This template contains the subfolder `muniLevel` with:
      
      *  The template version `_template_sampleConstruction_projectSpecific_subfolderName.R` and one example `_example_sampleConstruction_projectSpecific_muniLevel.R` of the `sampleConstruction_projectSpecific_subfolderName.R`.
      
      * The template script `code/raw2clean/_template_variableTheme_projectSpecific_subfolderName.R` and two example scripts `code/raw2clean/_example_priorityMuniAmazon_projectSpecific_muniLevel.R` and `code/raw2clean/_example_prodesDeforestationAmazon_projectSpecific_muniLevel.R` of the `variableTheme_projectSpecific_subfolderName.R`: 
      
      *  The template version `_template_sampleForAnalysis_typeOfSample_subfolderName.R` and two examples `_example_sampleForAnalysis_spatial_muniLevel.R` and `_example_sampleForAnalysis_panel_muniLevel.R` of the `sampleAnalysis_subfolderName.R`.
      
      * The template version `_template_projectSpecific_subfolderName.R` and one example version `_exampleprojectSpecific_muniLevel.R` of the `_masterfile_projectSpecific_subfolderName.R`.
  
      * The example version `_example_timeProcessing_projectSpecific_muniLevel.csv` of the `timeProcessing_projectSpecific_subfolderName.csv`.
        
* `analysis` - a folder containing some subfolders like (pending addition of examples and templates):
  
  * `maps` with
  
  * `stats` with

  * `regs` with
  

* `_functions` - a folder containing R scripts with custom functions used in multiple scripts across the project like:

  * `ExportTimeProcessing.R` - an R script to store ExportTimeProcessing function used to calculate and export the time of processing of each R script.

### `data`


## License
The material in this repository is made available under the [MIT license](http://opensource.org/licenses/mit-license.php). 
