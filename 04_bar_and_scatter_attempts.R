library("data.table")
library("dplyr")
library("ggpubr")
library("ggplot2")

View(`2021toxinsdata`)

# Data Cleaning 

`2021toxinsdata` <- `2021toxinsdata`[,-c(2:3, 10:16, 18:19, 21:33, 35:38, 46)]


`2021toxinsdata`[,c(88)][is.na(`2021toxinsdata`[,c(88)])] <- 0

`2021toxinsdata`[is.na(`2021toxinsdata`)] <- "Not specified"

`2021toxinsdata` <- rename(`2021toxinsdata`, c("year" = 1, "facility.name" = 2, "street.address"= 3, "city"=4, 
                                               "county"=5, "state"=6, "zip"=7, "stand.co.name" = 8, "industry.sector" = 9, 
                                               "chemical" = 10, "clean.air.act" = 11, "classification" = 12, "metal" = 13,
                                               "metal.category" = 14, "carcinogen" = 15, "pbt" = 16, "pfas" = 17, 
                                               "unit.of.measure" = 18, "production.ratio" = 90))

`2021toxinsdata`[`2021toxinsdata`=='YES'] <- 1
`2021toxinsdata`[`2021toxinsdata`=='NO'] <- 0

# Analysis 
# Function to create a ggplot2 bar graph
create_bar_graph <- function(data, x, x_title, y, y_title, main_title, strata, strata_labs, theme) {
  # Create the bar graph
  ggplot(data, aes(x = reorder(x, -y), y = y)) +
    geom_bar(stat = "identity", fill = "dark green") +
    facet_wrap(~strata, labeller = labeller(strata = strata_labs)) +
    xlab(x_title) +
    ylab(y_title) +
    ylim(0, 100) +
    ggtitle(main_title) +
    theme(plot.title = element_text(hjust = 0.5), axis.text = element_text(size = 5)
}

# Function to create a ggplot2 scatter plot
create_scatter_plot <- function(data, x, x_title, y, y_title, main_title, strata, strata_labs,  theme) {
  # Create the scatter plot
  ggplot(data, aes(x = x, y = y)) +
    geom_point() +
    facet_wrap(~strata, strata = strata_labs) +
    xlab(x_title) +
    ylab(y_title) +
    ggtitle(main_title) +
    theme(plot.title = element_text(hjust = 0.5), axis.text = element_text(size = 5))
}

# Stratified by carcinogen 
carcinogen_labs <- c("Non-carcinogen", "Carcinogen")
names(carcinogen_labs) <- c(0, 1)

create_bar_graph(`2021toxinsdata`, state, "State", production.ratio, "Production Ratio", "Production Ratio by State by Carcinogen Status", carcinogen, carcinogen_labs, theme_bw())
create_scatter_plot(`2021toxinsdata`, state, "State", production.ratio, "Production Ratio", "Production Ratio by State by Carcinogen Status", carcinogen, carcinogen_labs, theme_bw())

# Stratified by metal
metal_labs <- c("Non-metal", "Metal")
names(metal_labs) <- c(0, 1)

create_bar_graph(`2021toxinsdata`, state, "State", production.ratio, "Production Ratio", "Production Ratio by State by Metal Status", metal, metal_labs, theme_bw())
create_scatter_plot(`2021toxinsdata`, state, "State", production.ratio, "Production Ratio", "Production Ratio by State by Metal Status", metal, metal_labs, theme_bw())

# Stratified by pbt
pbt_labs <- c("Non-PBT", "PBT")
names(pbt_labs) <- c(0, 1)

create_bar_graph(`2021toxinsdata`, state, "State", production.ratio, "Production Ratio", "Production Ratio by State by PBT Status", pbt, pbt_labs, theme_bw())
create_scatter_plot(`2021toxinsdata`, state, "State", production.ratio, "Production Ratio", "Production Ratio by State by PBT Status", pbt, pbt_labs, theme_bw())
