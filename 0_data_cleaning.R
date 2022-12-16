## HMS 520 Final Project, Autumn 2022
## EPA Toxics Release Inventory data
## Authors: Annika Goranson, Caroline Kasman, Jessica Klusty
## Updated: December 11, 2022

# devtools::install_github("UrbanInstitute/urbnmapr") #if needed to install

# load packages
library(ggplot2)
library(dplyr)
library(data.table)
library(usmap)
library(tidyverse)
library(ggpubr)
library(scales)
library(urbnmapr) # pulling counties GIS dataset from urbanmapr -- https://urban-institute.medium.com/how-to-create-state-and-county-maps-easily-in-r-577d29300bb2

## loading datasets -----------------------------------------------------------

# overall source site for TRI (Toxic Release Inventory) data - each dataset is for one year
# https://www.epa.gov/toxics-release-inventory-tri-program/tri-basic-data-files-calendar-years-1987-present
# 2021 data: 
tri21 <- read.csv("tri2021.csv", header = TRUE)
# 1987 data:
tri87 <- read.csv("tri1987.csv", header = TRUE)

# cancer mortality data from 2020
# https://www.cdc.gov/nchs/pressroom/sosmap/cancer_mortality/cancer.htm
cancer_mort20 <- read.csv("cancer_mortality_2020.csv", header = TRUE)


## cleaning datasets ---------------------------------------------------------------

# create function to clean the multiple tri data sets 
# provide: TRI data set from EPA website, unedited
clean_tri <- function(tri) {
  
  # remove unnecessary columns (keeping others for potential future analyses)
        tri <- tri[,-c(2:3, 10:16, 18:19, 21:33, 35:38, 46)]
        
        # remove NAs
        tri[,c(88)][is.na(tri[,c(88)])] <- 0
        tri[is.na(tri)] <- "Not specified"
        
        # rename columns currently of use - using column indices
        tri <- rename(tri, c("year" = 1, 
                             "facility.name" = 2, 
                             "street.address"= 3, 
                             "city"=4, 
                             "county"=5, 
                             "state"=6, "zip"=7, 
                             "stand.co.name" = 8, 
                             "industry.sector" = 9, 
                             "chemical" = 10, 
                             "clean.air.act" = 11, 
                             "classification" = 12, 
                             "metal" = 13, 
                             "metal.category" = 14, 
                             "carcinogen" = 15, 
                             "pbt" = 16, 
                             "pfas" = 17, 
                             "unit.of.measure" = 18,
                             "onsite_release_total" = 62,
                             "production.ratio" = 90
                             )
                      )
        # assign "yes" and "no" to numerical values
        tri[tri =='YES'] <- 1
        tri[tri =='NO'] <- 0
        
        return(tri)
}

# cleaning tri datasets
tri21 <- clean_tri(tri21)        
tri87 <- clean_tri(tri87)

# using ` to be able to reference variable name starting with number for Annika's data visualizations
`2021toxinsdata` <- tri21

## pull just 2020 data from cancer mortality data
cancer_mort20 <- rename_with(cancer_mort20, tolower)
cancer_mort20 <- filter(cancer_mort20, year == 2020)

## cleaning counties GIS dataset (from urbanmapr package)
# filtering to WA level, changing county name format to match tri dataset (all uppercase, remove "county" after county name)
WA_counties<-counties %>% filter(state_name=="Washington") %>%
  mutate_if(is.character, str_to_upper) %>% mutate(county_name = str_replace(county_name, "\\s", "|")) %>% 
  separate(county_name, into = c("county", "rest"), sep = "\\|")

 
