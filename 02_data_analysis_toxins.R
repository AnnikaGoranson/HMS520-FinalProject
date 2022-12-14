## HMS 520 Final Project, Autumn 2022
## EPA Toxics Release Inventory data
## Authors: Annika Goranson, Caroline Kasman, Jessica Klusty
## Updated: December 15, 2022

# Analysis 
ggplot(`2021toxinsdata`, aes(x = state, y = production.ratio)) +
  geom_bar(stat = "identity", fill = "dark green") +
  xlab("State") +
  ylab("Production Ratio") + 
  ggtitle("Production Ratio by State") +
  theme_bw() + 
  theme(plot.title = element_text(hjust = 0.5), axis.text = element_text(size = 5))

# Stratified by carcinogen 
carcinogen_labs <- c("Non-carcinogen", "Carcinogen")
names(carcinogen_labs) <- c(0, 1)

ggplot(`2021toxinsdata`, aes(x = state, y = production.ratio)) +
  facet_wrap(~carcinogen, labeller = labeller(carcinogen = carcinogen_labs)) +
  geom_bar(stat = "identity", fill = "dark green") +
  xlab("State") +
  ylab("Production Ratio") + 
  ggtitle("Production Ratio by State by Carcinogen Status") +
  #scale_y_discrete(name = "Production Ratio", breaks = breaks_width(10)) +
  theme_bw() + 
  theme(plot.title = element_text(hjust = 0.5), axis.text = element_text(size = 5)) 

ggplot(`2021toxinsdata`, aes(x = state, y = production.ratio)) +
  geom_point(size = 0.1) +
  facet_wrap(~carcinogen, labeller = labeller(carcinogen = carcinogen_labs)) +
  xlab("State") +
  ylab("Production Ratio") + 
  ggtitle("Production Ratio by State by PBT Status") +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5), axis.text = element_text(size = 5))

# Stratified by metal
metal_labs <- c("Non-metal", "Metal")
names(metal_labs) <- c(0, 1)

ggplot(`2021toxinsdata`, aes(x = state, y = production.ratio)) +
  facet_wrap(~metal, labeller = labeller(metal = metal_labs)) +
  geom_bar(stat = "identity", fill = "dark green") +
  xlab("State") +
  ylab("Production Ratio") + 
  ggtitle("Production Ratio by State by Metal Status") +
  theme_bw() + 
  theme(plot.title = element_text(hjust = 0.5), axis.text = element_text(size = 5))

ggplot(`2021toxinsdata`, aes(x = state, y = production.ratio)) +
  geom_point(size = 0.1) +
  facet_wrap(~metal, labeller = labeller(metal = metal_labs)) +
  xlab("State") +
  ylab("Production Ratio") + 
  ggtitle("Production Ratio by State by PBT Status") +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5), axis.text = element_text(size = 5))

# Stratified by pbt
pbt_labs <- c("Non-PBT", "PBT")
names(pbt_labs) <- c(0, 1)

ggplot(`2021toxinsdata`, aes(x = state, y = production.ratio)) +
  facet_wrap(~pbt, labeller = labeller(pbt = pbt_labs)) +
  geom_bar(stat = "identity", fill = "dark green") +
  xlab("State") +
  ylab("Production Ratio") + 
  ggtitle("Production Ratio by State by PBT Status") +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5), axis.text = element_text(size = 5))

ggplot(`2021toxinsdata`, aes(x = state, y = production.ratio)) +
  geom_point(size = 0.1) +
  facet_wrap(~pbt, labeller = labeller(pbt = pbt_labs)) +
  xlab("State") +
  ylab("Production Ratio") + 
  ggtitle("Production Ratio by State by PBT Status") +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5), axis.text = element_text(size = 5))

# Carcinogen and PBT 
ggplot(`2021toxinsdata`, aes(x = state, y = production.ratio)) +
  facet_grid(carcinogen~pbt, labeller = labeller(carcinogen = carcinogen_labs, pbt = pbt_labs)) +
  geom_bar(stat = "identity", fill = "dark green") +
  xlab("State") +
  ylab("Production Ratio") + 
  ggtitle("Production Ratio by State by Carcinogen and PBT Status") +
  theme_bw() + 
  theme(plot.title = element_text(hjust = 0.5), axis.text = element_text(size = 5))

ggplot(`2021toxinsdata`, aes(x = state, y = production.ratio)) +
  geom_point(size = 0.1) +
  facet_wrap(carcinogen~pbt, labeller = labeller(carcinogen = carcinogen_labs, pbt = pbt_labs)) +
  xlab("State") +
  ylab("Production Ratio") + 
  ggtitle("Production Ratio by State by PBT Status") +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5), axis.text = element_text(size = 5))

