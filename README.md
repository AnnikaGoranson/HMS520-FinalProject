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

### Problem-Solving
To see code where we tried to problem-solve and refactor our code but unfortunately ran into some road blocks, please look at 04_Bar_and_Scatter_Attempts.R and 05_Refactor_Visualization_Function_Attempts.R in our code library. We have documented this code in case we would like to refer to it in the future to find a solution. 
