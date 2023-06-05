# Reproducible Paper Template 

Main goal: Create a template repository for starting a new paper project implementing good practices for reproducibility.

Author: João Pedro Vieira

Software: Focused on empirical projects that use mostly R. Tested using R version 4.3.0 and RStudio 2023.03.0+386 "Cherry Blossom" for Windows.

Disclaimer: This project aims to incorporate reproducible workflows gathered from multiple sources based on the author's personal preferences, needs, and limitations. It was not tested using different R versions or on other OS systems.

Feedback and suggestions are welcome to improve this project. 

Ideas for future implementation are stored on [Issues](https://github.com/jpgmv1998/reproducible_paper_template/issues).

## How to use

* Select "Use this template" in the upper right corner (or click [here](https://github.com/jpgmv1998/reproducible_paper_template/generate)) and follow the instructions to create your GitHub repository using this template.

* If you want to use version control within the RStudio project with git, see this [tutorial](https://happygitwithr.com/) then:
    * Open RStudio > File > New Project... > Version Control > Git > Insert the URL that appears when clicking on code in your GitHub repository on the Repository URL.

* When using R, always open RStudio using the .Rproj file. 

* In Tools > Project Options... > Sweave > select `pdfLaTeX` for Typset LaTeX. To render .tex and .Rmd files as tested in this template. 
  * If you encounter missing package errors when compiling to pdf a useful solution is to run `tinytex::parse_install(here::here("products/paper/_template_main_paper.log"))` in R (substituting the file name and path with the relevant for your case).
  * If there is already a LaTeX distribution installed but rendering .tex and .Rmd files is not working, a possible solution is to install the same tinytex version as used in the template `tinytex::install_tinytex(version = "2023.05")`.

* Eventually...
  * all .gitignore files should be carefully adjusted to avoid commiting unnecessary files (e.g., large data files);
  * the LICENSE.txt should be revised;
  * the `code/setup.R` R file should be adjusted changing the packages of interest and selecting the reference date;
  * all files with the prefix `_template_` should be replaced by your scripts, adjusting the script name and header informations accordingly or deleting from your project;
  * the README.md and README.htlm files should be substituted by a new README file detailing how to replicate the paper, following the _template_README_replicationPackage.md file.
  
* When running `"code/setup.R"` for the first time, I strongly recommend to run it line by line
  * `"groundhog"` might give the following message `"IMPORTANT. R does not have a personal library to save packages to. The default location for it is: 'C:\Users\username\AppData\Local/R/win-library/4.3'. 1) Type 'create' to create that directory 2) Otherwise type 'stop'"`. Answer with `create` in the console to proceed;
  * In some cases Rtools might be necessary (https://groundhogr.com/rtools/);
  * In some cases re-running the script might solve possible installation issues.
  
## Template Features

* R Project (with git - optional) - Allows better use of relative paths, helps with version control connecting RStudio directly to a GitHub project (requires previous [setup](https://happygitwithr.com/)).

* File paths - Use [here](https://cran.r-project.org/web/packages/here/vignettes/here.html) package for easy file referencing by using the top-level directory of a file project to build file paths.

* R packages management - Use of [groundhog](https://groundhogr.com/) package to help with package version management and reproducibility.

* [Folders structure](#folders-structure) - suggestion of folder structure to organize all files.

* File templates - template files contain structured suggestions that can be used to build your files. It includes:

  * [R scripts](https://github.com/jpgmv1998/reproducible_paper_template/tree/master/code) 
  
  * [LaTeX paper](https://github.com/jpgmv1998/reproducible_paper_template/blob/master/products/paper) - adapted from [Template for Empirical Papers - Ricardo Dahis](https://github.com/rdahis/paper_template)
  
  * [R Markdown beamer slides](https://github.com/jpgmv1998/reproducible_paper_template/tree/master/products/slides)

  * [Replication Package README template](https://github.com/jpgmv1998/reproducible_paper_template/blob/master/_template_README_replicationPackage.md) adapted from the [AEA Template](https://social-science-data-editors.github.io/template_README/) - The AEA template README is in a form that follows best practices as defined by a number of data editors at social science journals. 

* [Replication Package example](https://github.com/jpgmv1998/reproducible_paper_example2) - Application of this template using real data. It simulates a replication package in a stage ready to be deposited, thus containing only the necessary files to replicate the analysis (code and data folders; README; license; and Rproj). Code, data, and README examples may be useful to see how the proposed structure works in "practice". The GitHub repository does not contain the data files because of its hard limit of 100Mb for individual files. So a version with all the data is available at [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.7971743.svg)](https://doi.org/10.5281/zenodo.7971743)

* Custom function to automatically generate CSV files containing the time of processing of each script - [ExportTimeProcessing](https://github.com/jpgmv1998/reproducible_paper_template/blob/master/code/_functions/ExportTimeProcessing.R).

* For each raw dataset:
    * Added `_metadata` template with data description, access, and citation to be referenced in the Data Availability Statement section of the replication README.
    * Incorporated routine to generate codebooks after initial cleaning - adapted from [R guide](https://github.com/skhiggins/R_guide).
   

## Folders Structure

* `root`
 
  * `README.md`: this file. A general overview of the project in markdown format. `README.html` is the HTML version of this same file.
 
  * `_template_README_replicationPackage.md`, a template file for a replication README adapted from the [AEA Template](https://social-science-data-editors.github.io/template_README/).
  
  * `.gitignore`, a text file that tells git which files/folders should be ignored (not included in the version control system). When using GitHub repositories, it is essential to be aware of its [size limits](https://docs.github.com/en/free-pro-team@latest/github/managing-large-files/what-is-my-disk-quota) and ignore large files. Also, you should ignore other types of files; see more [here](https://henriquesd.medium.com/the-gitignore-file-dc293f6c80fb). In this template, the default is to ignore some R files, including data output and folders that typically contain large files (most subfolders inside `data` and `references/references_pdf/`. Instead of adding these folder patterns in this specific file, we add one `.gitignore` file inside each relevant folder to ignore all except the gitignore itself. This way, we can preserve the folder structure in GitHub, while avoiding committing large files. In other empty folders that ignoring might be optional, we only include an empty `.gitignore`.
  
  * `LICENSE`, a file to allow others to reproduce, distribute, or create derivative works using this project.
  
* `brainstorming`

  * To store miscellaneous files, such as the initial idea draft. Contain empty `.gitignore`, so all files will be available for version control, update it accordingly.

* `code`

  * All files inside this folder should be in version control and regularly committed when changes are made. All files with the prefix `_template_` should be replaced by your scripts, adjusting the script name accordingly or deleted from your project. 

  * `_template__MASTERFILE.R` - main MASTERFILE R script to run all subfolders master files, including all R scripts.
  
  * `setup.R` - R script for initial R setup. Install/load relevant R packages, configure `groundhog` to select all packages based on a specific date, install `tinytex` to generate PDFs from .tex and .Rmd files, describe additional packages that might be useful, and source personal functions to use across multiple scripts.
  
  * `_functions` - a folder containing R scripts with custom functions used in multiple scripts across the project like:
  
    * `ExportTimeProcessing.R` - an R script to store the `ExportTimeProcessing` function used to calculate and export each R script's processing time to CSV files.
    
  * `raw2clean` - a folder containing:
  
      * one `_template_r2c_datasetName.R` R script for each dataset folder in `data/raw2clean`. The goal of each script is to read the file(s) in the `data/raw2clean/datasetName_dataSource/input` folder, perform simple cleaning tasks, and save the cleaned data in the `data/raw2clean/datasetName_dataSource/output` folder, preferably in `.rds` format. 
          
      * `_template__masterfile_raw2clean.R` - an R script to source all raw2clean R scripts and specify the order when relevant.
      
      * `_timeProcessing_code_raw2clean.csv` - a CSV file containing each script's time to run (not present, but is automatically generated after running `_template__masterfile_raw2clean.R`).
  
  * `projectSpecific` - a folder containing:
  
      * `_template__masterfile_projectSpecific.R` - an R script to source all `projectSpecifc` R scripts in the desired sequence.
  
      * `_timeProcessing_code_projectSpecific.csv` - a CSV file containing the total time of all project-specific scripts (not present, but is automatically generated after running `_template__masterfile_projectSpecific.R`)
      
      * `_template_prepData_variableTheme.R` - R script(s) to manipulate cleaned dataset(s) before generating the sample(s) of interest

      * `_template_unitLevel_sampleConstruction.R` - R script to create the sample(s) of interest (e.g., panel, cross-section, spatial) at a given unit level (e.g., farm, municipality, country).
      
      * `_template_unitLevel_dataFormat_variableTheme.R` - R script(s) to extract/create the variables of interest and merge with the relevant sample (according to `dataFormat`) for a given unit level. If there is only one relevant format, exclude the prefix `dataFormat`.
    
      * `_template_unitLevel_sampleForAnalysis.R` - R script to combine all relevant files in `data/projectSpecific/unitLevel` into the output file(s) for analysis at a given unit level.
      
  * `analysis` - a folder to store scripts that generate stats, figures, and tables with the results of interest:
      
      * `_template__masterfile_analysis.R` - an R script to source all `analysis` R scripts in the desired sequence.
      
      * `_template_reg_name.R` - R script to run regressions and generate results to feed figure(s)/table(s)
      
      * `_template_stats_inText.R` - R script to calculate all statistics cited in the paper
      
      * `_template_fig1_name.R` - R script to generate figure 1
      
      * `_template_figA1_name.R` - R script to generate appendix figure A1
      
      * `_template_tab1_name.R` - R script to generate Table 1
      
      * `_template_tabA1_name.R` - R script to generate appendix table A1

* `data`

  * The default of this folder is to ignore all folders that typically contain large files. The only exceptions are the documentation folders that store `_metadata.txt` files. However, if your project only has small files respecting [GitHub limits](https://docs.github.com/en/free-pro-team@latest/github/managing-large-files/what-is-my-disk-quota) (in my experience, this is a rare case) you can have everything in the version control (which is ideal) just by removing the `.gitignore` files inside the `data` folders and adjusting the `.gitignore` in the root removing `.rds`, `.Rdata` and `.RData` patterns. 

  * `raw2clean` - a folder containing:
  
      * one `data/raw2clean/datasetName_dataSource` folder for each dataset. Each folder has three folders: 
      
          * `documentation` - always containing the `_metadata` text file that describes the data, provides access instructions, and an example of citation following the AEA guideline. It is also filled with `"codebook_datasetName.txt"` text file with summary statistics and variables description after running the raw2clean script. It can also include additional documentation.
          
          * `input` - containing the raw data stored in the original format. You should always keep the raw data the same, only unzip and extract the files from a downloaded folder when necessary.
          
          * `output` - usually a single `.rds` file with the cleaned data.
          
  
  * `projectSpecific` - a folder containing:
      
      * `prepData` - a folder containing prepared data necessary before generating the samples of interest.
      
      * `unitLevel` - a folder containing the sample(s) of interest at a given unit level
       
  * `analysis` - a folder containing:
      
      * `regression`: a folder containing regression outputs to be used as input for figures and tables
    
  * `_temp` - a folder to store temporary files (e.g., files automatically generated when processing raster data)
    
* `results` - contains three folders, `stats`, `figures`, and `tables`, to store the stats, figures, and tables used in the paper and slides.

* `products` - a folder containing:

  * `aux_files` - a folder with .sty and .tex auxiliary files to input in the .tex and .Rmd paper and slides files.
  
  * `paper` - a folder with the LaTeX paper template separated into the main paper and appendix.
  
  * `slides` - a folder with the R Markdown beamer slides template for a presentation and with the preliminary results (only figures and tables)
  
* `references` - a folder containing:
  
  * `references_literature.bib` - a BibTeX file to store all literature references for citation 
  
  * `references_data.bib` - a BibTeX file to store all data references for citation
  
  * `references_software.bib` - a BibTeX file to store all software references for citation 
  
  * `refereces_pdf` - a folder to store all pdfs of the relevant references

* `submission` - a folder containing:
  
  * `conferences` - a folder with one subfolder for each conference of interest to store all relevant materials
  
  * `journals` - a folder with one subfolder for each journal of interest to store all relevant materials

## License
The material in this repository is made available under a dual-license setup. See [LICENSE](LICENSE) for details. 
