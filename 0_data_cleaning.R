## HMS 520 Final Project, Autumn 2022
## EPA Toxics Release Inventory data
## Authors: Annika Goranson, Caroline Kasman, Jessica Klusty
## Updated: December 2, 2022


# load packages
library(ggplot2)
library(dplyr)
library(data.table)
library(usmap)


## load data sets -----------------------------------------------------------

# overall source site: https://www.epa.gov/toxics-release-inventory-tri-program/tri-basic-data-files-calendar-years-1987-present
# 2021 data: 
tri21 <- read.csv("tri2021.csv", header = TRUE)
# 1987 data:
tri87 <- read.csv("tri1987.csv", header = TRUE)

