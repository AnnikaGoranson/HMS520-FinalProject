# HMS 520 Final Project, Autumn 2022
### Authors: Caroline, Jessica, and Annika
 
Link to main data set: https://www.epa.gov/toxics-release-inventory-tri-program/tri-basic-data-files-calendar-years-1987-present

### Project type
We have chosen project option 3. Analyzing a dataset that uses data wrangling and modeling tools in R.

### Goal
Our overall modeling goal is to examine EPA Toxic Release Inventory (TRI) data on toxic chemicals in 2021. In addition, our coding goals are to practice collaborating in GitHub
and learn more about the properly implementing the tidyverse style guide (https://style.tidyverse.org/).

### Details and timeline
Over the next week, we will look at the types of classifications of each chemical and estimates of total quantity released in each report. We will see if there is any 
differentiation by state in these values. We hope to produce a map of chemical releases and various helpful visualizations to display the results of our analysis.

* Managing data: The data has 70 different types of toxins, and most incidents only involve 1-5. We will need to address the best way to aggregate the data for the analysis we want to do. 
* Chemical names: Chemical names reported for each incident are reported with potentially non-standardized names (e.g., "lead" and "lead compound" are different, as are "zinc (fume or dust)" and "zinc compound"). There are also variations on codes for these names that may need to be matched to another database.
* Bar charts and scatterplots in R: We will use the ggplot2 library.
* Mapping states in R: We will implement the usmap library and the plot_usmap function in the ggplot2 library (https://cran.r-project.org/web/packages/usmap/vignettes/mapping.html). 
* Mapping counties in R: We will use the urbanmapr library to pull county GIS data to then map with the ggplot2 library(https://github.com/UrbanInstitute/urbnmapr). Reference on how it to use it:(https://urban-institute.medium.com/how-to-create-state-and-county-maps-easily-in-r-577d29300bb2).
* Time trends: The incidents in the data set are only reported by year, so we will not be able to determine trend times at a more granular level than year.

### Presentation
Please see the below link for our presentation of our U.S. TRI analysis:
https://docs.google.com/presentation/d/1oOjmbojh_AoIYqbR6wfgBuyNc26gADULE-wIaQeoGuk/edit#slide=id.p
* Note: Some of Annika's visualizations have been updated since the presetnation, which is reflected in the 02_data_analysis_toxins.R script.

### Code Guide
#### Main Code
To see our main code, please look at the following scripts:
* 0_data_cleaning.R : By all of us, loads all necessary packages across all of the scripts and perform initial data cleaning of our main datasets and supplementary datasets.
* 01_data_analysis_mapscancer.R: By Jessica, creates U.S. map of incidents, tests for differences over time, and between carcinogenic incidents and cancer rates.
* 02_data_analysis_toxins.R: By Annika, creates bar charts and scatterplots of toxins.
* 03_data_analysis_chemindustry.R: By Caroline, creates visualizations of chemicals and industries as bar charts and county-level maps in WA state.

#### Supplementary Code
To see our additional code where we tried to problem-solve and refactor our code but unfortunately ran into some road blocks, please look at to following scripts. We have documented this code for your reference to see our effort and in case we would like to refer to it in the future to find a solution:
* 04_bar_and_scatter_attempts.R: By Annika, attempts at functions that would plot the data in both scatter and box plots, with customizable themes, and the data would be displayed for each state in descending order. The scales were not applying to the visualizations despite multiple attempts.
* 05_refactor_viz_attempts.R: By Caroline, attempts at refactoring functions to create visualizations that input in a column name as a variable, which was not working despite multiple attempts.
