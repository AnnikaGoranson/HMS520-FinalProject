## HMS 520 Final Project, Autumn 2022
## EPA Toxics Release Inventory data
## Authors: Annika Goranson, Caroline Kasman, Jessica Klusty
## Updated: December 11, 2022


## number of incidents by state ---------------------------------------------

## create function to map number of incidents by state
## input: tri = TRI data set from EPA, cleaned in 0_data_cleaning.R
##        scale = optional scale max value, set to 8500 by default
map_incidents <- function(tri, scale = 8500) {
  
  # determine number of incidents by state for each year
  inc_st <- as.data.frame(table(tri$state))
  colnames(inc_st) <- c("state", "freq")
  
  # plot map
  incident_map <- plot_usmap(data = inc_st, values = "freq") +
    scale_fill_continuous(low = "white", high = "dark green", 
                          name = "Incidents", limits = c(0, scale), 
                          label = scales::comma) + 
    theme(legend.position = "right")
  
  return(incident_map)
}

# 2021 map
map_incidents(tri21) + ggtitle("TRI Incidents in 2021")
# 1987 map
map_incidents(tri87) + ggtitle("TRI Incidents in 1987")


## create function to test for significant difference in incidents between years
## input: two TRI data sets from EPA, cleaned in 0_data_cleaning.R,
##        earlier year first
inc_diff <- function(tri_1, tri_2) {
  
  # combine data sets
  inc_st_both <- merge(
    as.data.frame(table(tri_1$state)),
    as.data.frame(table(tri_2$state)),
    by = c("Var1"),
    suffix = c("_1", "_2"),
    all.x = TRUE
  )
  
  # set up a paired t-test for differences
  inc_diff <- t.test(inc_st_both$Freq_1, inc_st_both$Freq_2, paired = TRUE)
  
  return(inc_diff)
  
}

## significant difference between number of incidents in 1987 vs 2021?
inc_diff(tri87, tri21)


## number of carcinogenic incidents by state --------------------------------

# carcinogenic incidents by state in 2021
map_incidents(filter(tri21, carcinogen == 1), scale = 2500) + 
  ggtitle("Carcinogenic TRI Incidents in 2021")
# in 1987
map_incidents(filter(tri87, carcinogen == 1), scale = 2500) + 
  ggtitle("Carcinogenic TRI Incidents in 1987")

## significant difference between number of carcinogenic incidents 
## in 1987 vs 2021?
inc_diff(filter(tri87, carcinogen == 1), filter(tri21, carcinogen == 1))


## map carcinogenic incidents vs cancer mortality rate ----------------------

# map cancer mortality rates by state in 2020
plot_usmap(data = cancer_mort20, values = "rate") +
  scale_fill_continuous(low = "white", high = "dark green", 
                        name = "Mortality rate per 100k", 
                        limits = c(110, 180), label = scales::comma) + 
  theme(legend.position = "right") +
  ggtitle("Cancer mortality rates by state in 2020")
