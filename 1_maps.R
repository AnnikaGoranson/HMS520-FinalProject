## HMS 520 Final Project, Autumn 2022
## EPA Toxics Release Inventory data
## Authors: Annika Goranson, Caroline Kasman, Jessica Klusty
## Updated: December 2, 2022


## number of incidents by state ---------------------------------------------

# determine number of incidents by state for each year
inc_st21 <- as.data.frame(table(tri21$X8..ST))
colnames(inc_st21) <- c("state", "freq")
inc_st87 <- as.data.frame(table(tri87$X8..ST))
colnames(inc_st87) <- c("state", "freq")

# 2021 map
plot_usmap(data = inc_st21, values = "freq") +
  scale_fill_continuous(low = "white", high = "dark green", name = "Incidents",
                        limits = c(0, 8500), label = scales::comma) + 
  theme(legend.position = "right") +
  ggtitle("TRI Incidents in 2021")

# 1987 map
plot_usmap(data = inc_st87, values = "freq") +
  scale_fill_continuous(low = "white", high = "dark green", name = "Incidents",
                        limits = c(0, 8500), label = scales::comma) + 
  theme(legend.position = "right") +
  ggtitle("TRI Incidents in 1987")


## significant difference between number of incidents in 1987 vs 2021?
# combine data sets
inc_st_both <- merge(
  inc_st87,
  inc_st21,
  by = c("state"),
  suffix = c("_87", "_21"),
  all.x = TRUE
)
# set up a paired t-test for differences
t.test(inc_st_both$freq_87, inc_st_both$freq_21, paired = TRUE)


## number of carcinogenic incidents by state --------------------------------

