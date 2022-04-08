# Reproducible Paper Template (:construction: UNDER CONSTRUCTION :construction:)

Main goal: Create a template repository for starting a new paper project implementing good practices for reproducibility.

Author: João Pedro Vieira

Software: Focused on empirical projects that use mostly R for data manipulation. Tested using R version 4.0.2 and RStudio version 1.4.1103 on Windows.

Disclaimer: This project aims to incorporate reproducible workflows gathered from multiple sources based on the author's personal preferences, needs, and limitations. 

Feedback and suggestions are welcome to improve this project. :rocket:

Ideas for implementation are stored on [Issues](https://github.com/jpgmv1998/reproducible_paper_template/issues).

## Features

* R Project (with git - optional) - Allows better use of relative paths, helps with version control connecting RStudio directly to a GitHub project (requires previous setup - see more about [here](https://happygitwithr.com/)).

* R packages management - Use of `groundhog` package to help with package version management and reproducibility (see more about [here](https://groundhogr.com/)).

* [Code and data folders structure](#folders-structure) - suggestion of folder structure to organize all code and data files.

* [File templates](#file-templates) - template files contain the suggested style structure for that type of file.

* [Replication Archive README template](https://github.com/jpgmv1998/reproducible_paper_template/blob/master/_template_README.md) adapted from the [AEA Template](https://social-science-data-editors.github.io/template_README/) - The AEA template README is in a form that follows best practices as defined by a number of data editors at social science journals. 

* [Replication Package example](https://github.com/jpgmv1998/reproducible_paper_example) - Application of this template using real data. It simulates a replication package in a stage ready to be deposited, thus containing only the necessary files to replicate the analysis (code and data folders; README; renv structure; license; and Rproj). Code, data, and README examples may be useful to see how the proposed structure works in "practice". The GitHub repository does not contain the datafiles because of its hard limit of 100Mb for individual files. So a version with all the data is available at [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4579463.svg)](https://doi.org/10.5281/zenodo.4579463)

* Custom function to automatically generate csv files containing the time of processing of each script - [ExportTimeProcessing](https://github.com/jpgmv1998/reproducible_paper_template/blob/master/code/_functions/ExportTimeProcessing.R).

* For each raw dataset:
    - Added `_metadata` template with data description, access, and citation to be referenced in the Data Availability Statement section of the replication README.
    - Incorporated routine to generate codebooks after initial cleaning - adapted from [R guide](https://github.com/skhiggins/R_guide).
    ```r   
    # CODEBOOK GENERATION (VARIABLES DESCRIPTION + SUMMARY STATISTICS)
    sink("data/raw2clean/datasetName_dataSource/documentation/codebook_datasetName.txt") # create text file to be filled with console output

    # if the object is spatial (sf class) drop geoemtry column to simplify the codebook and avoid error in describe
    if (any(class(clean.datasetName) == "sf")) {

      clean.datasetName %>% sf::st_drop_geometry() %>% Hmisc::describe() %>% print()
      clean.datasetName %>% sf::st_drop_geometry() %>% skimr::skim()     %>% print()

    } else {

      clean.datasetName %>% Hmisc::describe() %>% print()
      clean.datasetName %>% skimr::skim()     %>% print()
    }
    sink() # close the sink
    ```

## How to use

* Select use this template on the upper right corner (or click [here](https://github.com/jpgmv1998/reproducible_paper_template/generate)) and follow the instructions to create your own GitHub repository.

* If you want to use version control within the RStudio project with git see this [tutorial](https://happygitwithr.com/) then:
    * Open RStudio > File > New Project... > Version Control > Git > insert the url, that appears when clicking on code in your GitHub repository, on Repository URL.

* When using R always open RStudio using the .Rproj file.

## Files description

- `.gitignore`, a text file that tells Git which files/folders should be ignored (not included in the version control system). When using GitHub repositories it is important to be aware of its [size limits](https://docs.github.com/en/free-pro-team@latest/github/managing-large-files/what-is-my-disk-quota) and ignore large files. Also, there are other types of files that you should ignore, see more [here](https://henriquesd.medium.com/the-gitignore-file-dc293f6c80fb). In this template the default is to ignore some R files including data output, and folders in `data` that normally contain large files (`data/raw2clean/datasetName_dataSource/input`; `data/raw2clean/datasetName_dataSource/output`; `data/projectSpecific`). Instead of adding these folder patterns in this specific file, we add one `.gitignore` file inside each relevant folder. In this way, we can preserve the folder structure, while avoiding committing large files.

- `LICENSE`, a file to allow others to reproduce, distribute, or create derivatives works using this project.

- `README.md` this file, a general overview of the project in markdown format.

- `_template_README.md`, a template file for a replication README adapted from the [AEA Template](https://social-science-data-editors.github.io/template_README/).

- `brainstorming`, a folder to store research ideas, peer feedback, etc. Contains:
  * `_template_research_project.Rmd`, a template (in Rmarkdown format) to organize and structure the first ideas about the project (draft version). Produces `_template_research_project.pdf` as output.

## Folders structure

This section explains how code and data are organized, the structure of folders, and suggestions of patterns for file names. In practice, the files inside the folders are templates, thus they have the prefix `_template_` in their names, and are described in the [File templates](#file-templates) section. As noted before this template is very biased towards the author's preferences, needs, and limitations.

### `code`

All files inside this folder should be in version control and committed regularly when changes are made.

* `raw2clean` - a folder containing:

    * one `datasetName_raw2clean.R` R script for each dataset folder in `data/raw2clean`. The goal of each script is to read the file(s) in the `data/raw2clean/datasetName_dataSource/input` folder, perform simple cleaning tasks, and save the cleaned data in the `data/raw2clean/datasetName_dataSource/output` folder preferably in `.Rdata` format (raster is an exception and should be saved as `.tif` format). 
        
    * `_masterfile_raw2clean.R` - an R script to source all raw2clean R scripts and specify the order when relevant.
    
    * `_timeProcessing_raw2clean.csv` - a csv file containing the time each script took to run.

* `projectSpecific` - a folder containing:
    
    * possibly multiple folders, if the project has more than one base sample for analysis (e.g one sample at the municipality level and the other at the individual level). Each folder should contain:
      
      * `sampleConstruction_projectSpecific_folderName.R` - an R script to create the samples of interest (e.g. panel, cross-section, spatial).
      
      * multiple R scripts with pattern `dataFormat_variableTheme_projectSpecific_folderName.R`, with `dataFormat` being at least one of the following: `spatial`, `panel`, `crossSection`, to extract/create the variables of interest using one or more data files from `data/raw2clean/datasetName_dataSource/output`, and merge with the relevant sample (according to `dataFormat`). If there is only one relevant format exclude the prefix `dataFormat`.
    
      * `dataFormat_forAnalysis_folderName.R` - R script(s) to combine all relevant files in `data/projectSpecific/folderName` into an output file for analysis, with `dataFormat` being at least one of the following: `spatial`, `panel`, `crossSection`. If there is only one relevant format exclude the prefix `dataFormat`.
      
      * `_masterfile_projectSpecific_folderName.R` - an R script to source all `projectSpecifc/folderName` R scripts in the desired sequence.
      
      * `_timeProcessing_projectSpecific_folderName.csv` - a csv file containing the time each script took to run.  
      
* `analysis` - a folder containing some folders like:
  
  * `maps` - to generate maps when using spatial data.
  
  * `stats` - to generate descriptive statistics (tables/graphics)

  * `regs` - to generate regression outputs (tables/graphics).
  

* `_functions` - a folder containing R scripts with custom functions used in multiple scripts across the project like:

  * `ExportTimeProcessing.R` - an R script to store `ExportTimeProcessing` function used to calculate and export the time of processing of each R script.

### `data`

The default of this folder is to ignore all folders that normally contain large files (`data/raw2clean/datasetName_dataSource/input`; `data/raw2clean/datasetName_dataSource/output`; `data/projectSpecific`). However, if your project only has small files respecting [GitHub limits](https://docs.github.com/en/free-pro-team@latest/github/managing-large-files/what-is-my-disk-quota) (in my experience this is a rare case) you can have everything in the version control (which is ideal) just by removing the `.gitignore` files inside the `data` folders and adjusting the `.gitignore` in the root removing `.Rdata` and `.RData` patterns. 

* `raw2clean` - a folder containing:

    * one `data/raw2clean/datasetName_dataSource` folder for each dataset. Each folder has three folders: 
    
        * `documentation` - containing always the `_metadata` text file that describes the data, provides access instructions, and an example of citation following the AEA guideline. It also contains `"codebook_datasetName.txt"` text file with summary statistics and variables description. Additionally can contain other relevant documents.
        
        * `input` - containing the raw data stored in the original format you should never change it, only unzip and extract the files from the downloaded folder when necessary.
        
        * `output` - containing usually a single `.Rdata` file with the cleaned data, but sometimes multiple `.Rdata` may be necessary due to size constraints, or the `.tif` format may be used when the input data is a raster file.
        

* `projectSpecific` - a folder containing:
    
    * possibly multiple folders, if the project has more than one base sample for analysis (e.g one sample at the municipality level and the other at the individual level). Each folder should contain:
    
      * whenever `dataFormat` is used it can represent at least one of the following: `spatial`, `panel`, `crossSection`. If there is only one relevant format exclude the prefix `dataFormat`.
    
      * the output(s) of `sampleConstruction_projectSpecific_folderName.R` with the following name pattern: `dataFormat_sample_folderName.Rdata`.
      
      * the output of each R script with pattern `dataFormat_variableTheme_projectSpecific_folderName.R` with the following name pattern: `dataFormat_variableTheme_folderName.Rdata`.
    
      * the output(s) of `sample_forAnalysis_folderName.R` file with the following name pattern: `dataFormat_forAnalysis_folderName.Rdata`.
      
     
* `analysis` - a folder, that may need more adaptations accordingly to the project, containing some folders like:
  
  * `maps` - to store maps when using spatial data.
  
  * `stats` - to store descriptive statistics (tables/graphics)

  * `regs` - to store regression outputs (tables/graphics).
  
* `_temp` - a folder to store temporary files (e.g. files automatically generated when processing raster data)
  

## File templates 

All files with the prefix `_template_` contain the suggested structure for that type of file. When using this template all these files should be, eventually, replaced or removed from your project. 

### `code`

* `raw2clean` - a folder containing:

    * The template `code/raw2clean/_template_datasetName_raw2clean.R` an R script containing only the general structur of the `datasetName_raw2clean.R` type of file.
        
    * The template `_template_masterfile_raw2clean.R` of the `masterfile_raw2clean.R`.
    
* `projectSpecific` - a folder containing:
      
    * The template folder `folderName` containing:
    
        * The template `_template_sampleConstruction_projectSpecific_folderName.R` of the `sampleConstruction_projectSpecific_folderName.R`.

        * The template `code/projectSpecific/_template_dataFormat_variableTheme_projectSpecific_folderName.R` of the `dataFormat_variableTheme_projectSpecific_folderName.R`.

        * The template `_template_sample_forAnalysis_folderName.R` of the `sample_forAnalysis_folderName.R`.

        * The template `_template_masterfile_projectSpecific_folderName.R` of the `_masterfile_projectSpecific_folderName.R`.

        
* `analysis` - a folder containing some folders like (pending addition of examples and templates):
  
  * `maps` - a folder containing:
  
    *
  
  * `stats` - a folder containing:
  
    *

  * `regs` - a folder containing:
  
    *

* `_functions` - a folder containing R scripts with custom functions used in multiple scripts across the project like:

  * `ExportTimeProcessing.R` - an R script to store ExportTimeProcessing function used to calculate and export the time of processing of each R example script. 
  
### `data`

* `raw2clean` - a folder containing:

  * The template `_template_datasetName_dataSource` folder that contains a skeleton of the `_metadata.txt` file in `documentation` and the folder structure to be used for your own datasets.

* `projectSpecific` - a folder containing:
    
    * An empty template folder `folderName`.
  
## License
The material in this repository is made available under a dual-license setup. See [LICENSE](LICENSE) for details. 
