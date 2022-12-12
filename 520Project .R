library("data.table")
library("dplyr")
library("ggpubr")
library("ggplot2")

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
# state_toxinsdata <- `2021toxinsdata` %>% group_by(X8..ST)
# View(state_toxinsdata)

ggplot(`2021toxinsdata`, aes(x = state, y = production.ratio)) +
  geom_bar(stat = "identity", fill = "dark green") +
  xlab("State") +
  ylab("Production Ratio") + 
  ggtitle("Production Ratio by State") +
  theme_minimal() + 
  theme(plot.title = element_text(hjust = 0.5), axis.text = element_text(size = 5))


carcinogen_labs <- c("Non-carcinogen", "Carcinogen")
names(carcinogen_labs) <- c(0, 1)

ggplot(`2021toxinsdata`, aes(x = state, y = production.ratio)) +
  facet_wrap(~carcinogen, labeller = labeller(carcinogen = carcinogen_labs)) +
  geom_bar(stat = "identity", fill = "dark green") +
  xlab("State") +
  ylab("Production Ratio") + 
  ggtitle("Production Ratio by State by Carcinogen Status") +
  #scale_y_continuous(name = "Production Ratio", breaks = seq(0, 3, .01)) +
  theme_minimal() + 
  theme(plot.title = element_text(hjust = 0.5), axis.text = element_text(size = 5))

metal_labs <- c("Non-metal", "Metal")
names(metal_labs) <- c(0, 1)

ggplot(`2021toxinsdata`, aes(x = state, y = production.ratio)) +
  facet_wrap(~metal, labeller = labeller(metal = metal_labs)) +
  geom_bar(stat = "identity", fill = "dark green") +
  xlab("State") +
  ylab("Production Ratio") + 
  ggtitle("Production Ratio by State by Metal Status") +
  theme_minimal() + 
  theme(plot.title = element_text(hjust = 0.5), axis.text = element_text(size = 5))

pbt_labs <- c("Non-PBT", "PBT")
names(pbt_labs) <- c(0, 1)

ggplot(`2021toxinsdata`, aes(x = state, y = production.ratio)) +
  facet_wrap(~pbt, labeller = labeller(pbt = pbt_labs)) +
  geom_bar(stat = "identity", fill = "dark green") +
  xlab("State") +
  ylab("Production Ratio") + 
  ggtitle("Production Ratio by State by PBT Status") +
  theme_minimal() + 
  theme(plot.title = element_text(hjust = 0.5), axis.text = element_text(size = 5))

ggplot(`2021toxinsdata`, aes(x = state, y = production.ratio)) +
  facet_grid(carcinogen~pbt, labeller = labeller(carcinogen = carcinogen_labs, pbt = pbt_labs)) +
  geom_bar(stat = "identity", fill = "dark green") +
  xlab("State") +
  ylab("Production Ratio") + 
  ggtitle("Production Ratio by State by Carcinogen and PBT Status") +
  theme_minimal() + 
  theme(plot.title = element_text(hjust = 0.5), axis.text = element_text(size = 5))
