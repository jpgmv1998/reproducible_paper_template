# Reproducible Paper Template (:construction: UNDER CONSTRUCTION :construction:)

Main goal: Create a template repository for starting a new paper project implementing good practices for reproducibility.

Author: João Pedro Vieira

Software: Focused on empirical projects that use mostly R for data manipulation. Tested using R version 4.0.2 and RStudio version 1.4.1103 on Windows.

Disclaimer: This project aims to incorporate reproducible workflows gathered from multiple sources based on the author's personal preferences, needs, and limitations. 

Feedback and suggestions are welcome to improve this project. :rocket:

Ideas for implementation are stored on [Issues](https://github.com/jpgmv1998/reproducible_paper_template/issues).

## Features

* [Random References](randomReferences.md) - File intended to store links for references that may be useful for empirical work (e.g. R, Econometrics, Git, etc).

* R Project (with git - optional) - Allows better use of relative paths, helps with version control connecting RStudio directly to a GitHub project (requires previous setup - see more about [here](https://happygitwithr.com/)).

* R packages management - Use of `renv` package to help with package version management and reproducibility (see more about [here](https://rstudio.github.io/renv/articles/renv.html)).

* [Code and data folders structure](#folders-structure) - suggestion of folder structure to organize all code and data files.

* [File templates and examples](#file-templates-and-examples) - template files contain the suggested structure for that type of file, and example files are applcations of the templates using real data.

* [Replication Archive README template](https://github.com/jpgmv1998/reproducible_paper_template/blob/master/_template_README.md) adapted from the [AEA Template](https://social-science-data-editors.github.io/template_README/) - The AEA template README is in a form that follows best practices as defined by a number of data editors at social science journals. 

* [Replication Archive README example - PENDING](https://github.com/jpgmv1998/reproducible_paper_template/blob/master/_example_README.md) - Application of the provided README template based on the examples present in this project. 

* Custom function to automatically generate csv files containing the time of processing of each script - [ExportTimeProcessing](https://github.com/jpgmv1998/reproducible_paper_template/blob/master/code/_functions/ExportTimeProcessing.R).

* For each raw dataset:
    - Added `_metadata` template and examples with data description, access, and citation to be referenced in the Data Availability Statement section of the replication README.
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

* If you want to use R packages management see this [vignette](https://rstudio.github.io/renv/articles/renv.html) then:
   * Open RProject and execute `install.packages("renv")` if you do not have it installed yet.
   * If you already substituted all files with prefixes `_example_` and `_template_` with your own scripts, then:
      * Execute `renv::init()` to develop a "local library" of the packages employed in a project. It will create the following files and folders in the project directory: `renv.lock`, `.Rprofile`, and `renv/.` Binaries of the project's packages will be stored in the `renv/library/` subfolder.
      * When working on the project, use `renv::install()` to add any extra package that was not present before, and use `renv::snapshot()` to update your renv-related files. Make sure these are updated when pushing project changes to GitHub, sharing files with others, or preparing the replication package.
   * If you are starting a fresh project and want to substitute the files with prefixes `_example_` and `_template_` while developing the project, then:
      * Execute `renv::init(bare = T)`. It will activate the renv structure to the project adding the same files as mentioned above, but the argument `bare = T` will make it skip the scan step and it will not install any package automatically.
      * When working on the project, use `renv::install()` to add any necessary package to the project library (even if you already have it installed locally or in another project), and use `renv::snapshot()` to update your renv-related files. Make sure these are updated when pushing project changes to GitHub, sharing files with others, or preparing the replication package.

## Files description

- `.gitignore`, a text file that tells Git which files/folders should be ignored (not included in the version control system). When using GitHub repositories it is important to be aware of its [size limits](https://docs.github.com/en/free-pro-team@latest/github/managing-large-files/what-is-my-disk-quota) and ignore large files. Also, there are other types of files that you should ignore, see more [here](https://henriquesd.medium.com/the-gitignore-file-dc293f6c80fb). In this template the default is to ignore some R files including data output, and folders in `data` that normally contain large files (`data/raw2clean/datasetName_dataSource/input`; `data/raw2clean/datasetName_dataSource/output`; `data/projectSpecific`). Instead of adding these folder patterns in this specific file, we add one `.gitignore` file inside each relevant folder. In this way, we can preserve the folder structure, while avoiding committing large files.

- `LICENSE`, a file to allow others to reproduce, distribute, or create derivatives works using this project.

- `README.md` this file, a general overview of the project in markdown format.

- `randomReferences.md`, a file intended to store links for references that may be useful for empirical work (e.g. R, Econometrics, Git, etc) in markdown format.

- `_template_README.md`, a template file for a replication README adapted from the [AEA Template](https://social-science-data-editors.github.io/template_README/).

- `_example_README.md`, an example file for a replication README retrieved from the [AEA Deposit](https://www.openicpsr.org/openicpsr/search/aea/studies).

- `brainstorming`, a folder to store research ideas, peer feedback, etc. Contains:
  * `_template_research_project.Rmd`, a template (in Rmarkdown format) to organize and structure the first ideas about the project (draft version). Produces `_template_research_project.pdf` as output.

## Folders structure

This section explains how code and data are organized, the structure of folders, and suggestions of patterns for file names. In practice, the files inside the folders are examples and templates, thus they have the prefixes `_example_` or `_template_` in their names, and will be described in the [File templates and examples](#file-templates-and-examples) section. As noted before this template is very biased towards the author's preferences, needs, and limitations. For other references see the [Reproducibility section](https://github.com/jpgmv1998/reproducible_paper_template/blob/master/randomReferences.md#reproducibility) in `randomReferences.md`.

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
    
        * `documentation` - containing always the `_metadata` file with information about the download and the dataset, additionally can contain other relevant documents.
        
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
  

## File templates and examples

All files with the prefix `_template_` contain the suggested structure for that type of file, and all files with the prefix `_example_` contain files adapted from its template version using real data. When using this template all these files should be replaced or removed from your project. 

### `code`

* `raw2clean` - a folder containing:

    * The template and four examples of the `datasetName_raw2clean.R`: 
    
      * `code/raw2clean/_template_datasetName_raw2clean.R` - an R script containing only the general structure of this type of file.
      * `code/raw2clean/_example_muniDivision2015_raw2clean.R` - a real example of a raw2clean R script with spatial data as input.
      * `code/raw2clean/_example_biomesDivision_raw2clean.R` - a real example of a raw2clean R script with spatial data as input.
      * `code/raw2clean/_example_priorityMuniAmazon_raw2clean.R` - a real example of a raw2clean R script with tabular data as input (.txt format).
      * `code/raw2clean/_example_prodesDeforestationAmazon_raw2clean.R` - a real example of a raw2clean R script with tabular data as input (.pdf format).
        
    * The template `_template_masterfile_raw2clean.R` and an example `_example_masterfile_raw2clean.R` of the `masterfile_raw2clean.R`.
    
    * An example `_example_timeProcessing_raw2clean.csv` of the `_timeProcessing_raw2clean.csv`.

* `projectSpecific` - a folder containing:
    
    * An example folder `muniLevel` with:
      
      * An example `_example_sampleConstruction_projectSpecific_muniLevel.R` of the `sampleConstruction_projectSpecific_folderName.R`.
      
      * Two examples `code/projectSpecific/_example_panel_priorityMuniAmazon_projectSpecific_muniLevel.R`, and `code/projectSpecific/_example_panel_prodesDeforestationAmazon_projectSpecific_muniLevel.R` of the `dataFormat_variableTheme_projectSpecific_folderName.R`. 
      
      * An example `_example_sample_forAnalysis_muniLevel.R` of the `sample_forAnalysis_folderName.R`.
      
      * An example `_example_masterfile_projectSpecific_muniLevel.R` of the `_masterfile_projectSpecific_folderName.R`.
  
      * An example `_example_timeProcessing_projectSpecific_muniLevel.csv` of the `_timeProcessing_projectSpecific_folderName.csv`.
      
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

  * `_example_ExportTimeProcessing.R` - an R script to store example_ExportTimeProcessing function used to calculate and export the time of processing of each R example script. Used only to adapt the output name adding the prefix `_example`, in practice you should exclude this function and only use the `ExporTimeProcessing.R` version.

### `data`

* `raw2clean` - a folder containing four folder examples and one template folder:

  * Examples: `example_biomeDivision_ibge`; `example_muniDivision2015_ibge`; `example_priorityMuniAmazon_mma`; `example_prodesDeforestationAmazon_inpe`. 
  
  * For each example folder, you should follow the download instructions in `documentation/_metadata.txt` and save the data in the `input` folder. The `output` folder will be automatically populated when running the `_example_masterfile_raw2clean.R`.
  
  * The template `_template_datasetName_dataSource` contains a skeleton of the `_metadata.txt` file in `documentation` and the folder structure to be used for your own datasets.

* `projectSpecific` - a folder containing:
    
    * An empty example folder `muniLevel` and an empty template folder `folderName`. The example folder `muniLevel` will be automatically populated when running the `_example_masterfile_projectSpecific_muniLevel.R` script with:
      
      *  Three examples `_example_spatial_sample_muniLevel.Rdata`, `_example_panel_sample_muniLevel.Rdata`, and `_example_crossSection_sample_muniLevel.Rdata` of the `dataFormat_sample_folderName.Rdata`.
      
      *  Two examples `_example_panel_prodesDeforestationAmazonMuni_muniLevel.Rdata`, and `_example_panel_priorityMuniAmazon_muniLevel.Rdata` of the `dataFormat_variableTheme_folderName.Rdata`.
      
      *  Three examples `_example_panel_forAnalysis_muniLevel.Rdata`, `_example_crossSection_forAnalysis_muniLevel.Rdata`, and `_example_spatial_forAnalysis_muniLevel.Rdata` of the `dataFormat_forAnalysis_folderName.Rdata`.
      
  
## License
The material in this repository is made available under a dual-license setup. See [LICENSE](LICENSE) for details. 
