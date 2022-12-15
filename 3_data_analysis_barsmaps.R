## HMS 520 Final Project, Autumn 2022
## EPA Toxics Release Inventory data
## Authors: Annika Goranson, Caroline Kasman, Jessica Klusty
## Updated: December 11, 2022
install.packages("usmap")

# load packages
library(ggplot2)
library(dplyr)
library(data.table)
library(usmap)


## Caroline analysis 

tri21<- tri21 %>% rename (onsite_release_total=X62..ON.SITE.RELEASE.TOTAL)
tri87<- tri87 %>% rename (onsite_release_total=X62..ON.SITE.RELEASE.TOTAL)

#https://datacarpentry.org/dc_zurich/R-ecology/04-dplyr.html

################################## highest chemicals 
#### for US overall
#rm(trimin)
tri_tox87<-tri87 %>%
  group_by(chemical) %>%
  summarize(mean_release = (mean(onsite_release_total, na.rm = TRUE)))

tri_tox87<- tri_tox87 %>% arrange(desc(mean_release)) %>%
  slice(1:10)
  
#highest toxins in US in 1987 using ON-SITE RELEASE TOTAL
tri_tox87 %>% 
  arrange(desc(mean_release)) %>%
  slice(1:10) %>%
ggplot(., aes(x = reorder(chemical, -mean_release), y = mean_release )) +
  geom_bar(stat = "identity", fill = "light green") +
  xlab("Chemical") +
  ylab("On-Site Release Total (Total Lb)") + 
  ggtitle("Top 10 Chemicals in US by On-Site Release - 1987") +
  theme_minimal() + 
  theme(plot.title = element_text(hjust = 0.5), axis.text = element_text(size = 10))+ 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
         panel.background = element_blank(), axis.line = element_line(colour = "black"))+ 
  theme(axis.text.x = element_text(angle = 90))


#highest toxins in US in 2021 using ON-SITE RELEASE TOTAL
tri_tox21<-tri21 %>%
  group_by(chemical) %>%
  summarize(mean_release = (mean(onsite_release_total, na.rm = TRUE)))

tri_tox21<- tri_tox21 %>% arrange(desc(mean_release)) %>%
  slice(1:10)

#highest toxins in US in 1987 using ON-SITE RELEASE TOTAL
tri_tox21 %>% 
  arrange(desc(mean_release)) %>%
  slice(1:10) %>%
  ggplot(., aes(x = reorder(chemical, -mean_release), y = mean_release )) +
  geom_bar(stat = "identity", fill = "dark green") +
  xlab("Chemical") +
  ylab("On-Site Release Total (Total Lb)") + 
  ggtitle("Top 10 Chemicals in US by On-Site Release - 2021") +
  theme_minimal() + 
  theme(plot.title = element_text(hjust = 0.5), axis.text = element_text(size = 10))+ 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"))+ 
  theme(axis.text.x = element_text(angle = 90))



#### for Seattle spec
#rm(trimin)
Seattletri_tox87<-tri87 %>% filter(city=="SEATTLE") %>%
  group_by(chemical) %>%
  summarize(mean_release = (mean(onsite_release_total, na.rm = TRUE)))

Seattletri_tox87<- Seattletri_tox87 %>% arrange(desc(mean_release)) %>%
  slice(1:10)

#highest toxins in Seattle in 1987 using ON-SITE RELEASE TOTAL
Seattletri_tox87 %>% 
  arrange(desc(mean_release)) %>%
  slice(1:10) %>%
  ggplot(., aes(x = reorder(chemical, -mean_release), y = mean_release )) +
  geom_bar(stat = "identity", fill = "light green") +
  xlab("Chemical") +
  ylab("On-Site Release Total (Total Lb)") + 
  ggtitle("Top 10 Chemicals in Seattle by On-Site Release - 1987") +
  theme_minimal() + 
  theme(plot.title = element_text(hjust = 0.5), axis.text = element_text(size = 10))+ 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"))+ 
  theme(axis.text.x = element_text(angle = 90))


#highest toxins in Seattle in 2021 using ON-SITE RELEASE TOTAL
Seattletri_tox21<-tri21 %>%
  group_by(chemical) %>%
  summarize(mean_release = (mean(onsite_release_total, na.rm = TRUE)))

Seattletri_tox21<- Seattletri_tox21 %>% arrange(desc(mean_release)) %>%
  slice(1:10)

#highest toxins in Seattle in 1987 using ON-SITE RELEASE TOTAL
Seattletri_tox21 %>% 
  arrange(desc(mean_release)) %>%
  slice(1:10) %>%
  ggplot(., aes(x = reorder(chemical, -mean_release), y = mean_release )) +
  geom_bar(stat = "identity", fill = "dark green") +
  xlab("Chemical") +
  ylab("On-Site Release Total (Total Lb)") + 
  ggtitle("Top 10 Chemicals in Seattle by On-Site Release - 2021") +
  theme_minimal() + 
  theme(plot.title = element_text(hjust = 0.5), axis.text = element_text(size = 10))+ 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"))+ 
  theme(axis.text.x = element_text(angle = 90))


################################## highest industries
#### for US overall
#rm(trimin)
indtri_tox87<-tri87 %>%
  group_by(industry.sector) %>%
  summarize(mean_release = (mean(onsite_release_total, na.rm = TRUE)))

indtri_tox87<- indtri_tox87 %>% arrange(desc(mean_release)) %>%
  slice(1:10)

#highest toxins in US in 1987 using ON-SITE RELEASE TOTAL
indtri_tox87 %>% 
  arrange(desc(mean_release)) %>%
  slice(1:10) %>%
  ggplot(., aes(x = reorder(industry.sector, -mean_release), y = mean_release )) +
  geom_bar(stat = "identity", fill = "light green") +
  xlab("Industry") +
  ylab("On-Site Release Total (Total Lb)") + 
  ggtitle("Top 10 Industries in US by On-Site Release - 1987") +
  theme_minimal() + 
  theme(plot.title = element_text(hjust = 0.5), axis.text = element_text(size = 10))+ 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"))+ 
  theme(axis.text.x = element_text(angle = 90))


#highest toxins in US in 2021 using ON-SITE RELEASE TOTAL
indtri_tox21<-tri21 %>%
  group_by(industry.sector) %>%
  summarize(mean_release = (mean(onsite_release_total, na.rm = TRUE)))

indtri_tox21<- indtri_tox21 %>% arrange(desc(mean_release)) %>%
  slice(1:10)

#highest toxins in US in 1987 using ON-SITE RELEASE TOTAL
indtri_tox21 %>% 
  arrange(desc(mean_release)) %>%
  slice(1:10) %>%
  ggplot(., aes(x = reorder(industry.sector, -mean_release), y = mean_release )) +
  geom_bar(stat = "identity", fill = "dark green") +
  xlab("Industry") +
  ylab("On-Site Release Total (Total Lb)") + 
  ggtitle("Top 10 Industries in US by On-Site Release - 2021") +
  theme_minimal() + 
  theme(plot.title = element_text(hjust = 0.5), axis.text = element_text(size = 10))+ 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"))+ 
  theme(axis.text.x = element_text(angle = 90))


#### for Seattle spec
#rm(trimin)
indSeattletri_tox87<-tri87 %>% filter(city=="SEATTLE") %>%
  group_by(industry.sector) %>%
  summarize(mean_release = (mean(onsite_release_total, na.rm = TRUE)))

indSeattletri_tox87<- indSeattletri_tox87 %>% arrange(desc(mean_release)) %>%
  slice(1:10)

#highest toxins in Seattle in 1987 using ON-SITE RELEASE TOTAL
indSeattletri_tox87 %>% 
  arrange(desc(mean_release)) %>%
  slice(1:10) %>%
  ggplot(., aes(x = reorder(industry.sector, -mean_release), y = mean_release )) +
  geom_bar(stat = "identity", fill = "light green") +
  xlab("Industry") +
  ylab("On-Site Release Total (Total Lb)") + 
  ggtitle("Top 10 Industries in Seattle by On-Site Release - 1987") +
  theme_minimal() + 
  theme(plot.title = element_text(hjust = 0.5), axis.text = element_text(size = 10))+ 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"))+ 
  theme(axis.text.x = element_text(angle = 90))


#highest toxins in Seattle in 2021 using ON-SITE RELEASE TOTAL
indSeattletri_tox21<-tri21 %>% filter(city=="SEATTLE") %>%
  group_by(industry.sector) %>%
  summarize(mean_release = (mean(onsite_release_total, na.rm = TRUE)))

indSeattletri_tox21<- indSeattletri_tox21 %>% arrange(desc(mean_release)) %>%
  slice(1:10)

#highest toxins in US in 1987 using ON-SITE RELEASE TOTAL
indSeattletri_tox21 %>% 
  arrange(desc(mean_release)) %>%
  slice(1:10) %>%
  ggplot(., aes(x = reorder(industry.sector, -mean_release), y = mean_release )) +
  geom_bar(stat = "identity", fill = "dark green") +
  xlab("Industry") +
  ylab("On-Site Release Total (Total Lb)") + 
  ggtitle("Top 10 Industries in Seattle by On-Site Release - 2021") +
  theme_minimal() + 
  theme(plot.title = element_text(hjust = 0.5), axis.text = element_text(size = 10))+ 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"))+ 
  theme(axis.text.x = element_text(angle = 90))

################################### pollution in WA counties specifically
# https://jtr13.github.io/cc19/different-ways-of-plotting-u-s-map-in-r.html
# library(ggplot2)
# #install.packages(c("maps","mapsdata"))
# library(maps)
# library(mapdata)
# 
# 
# 
# 
# plot_usmap(data = countypov, values = "pct_pov_2014",include='WA',regions = "counties") + 
#   labs(title = "U.S. counties") + 
#   theme(panel.background=element_blank())
# 
# 
# plot_usmap(data = countypov, values = "pct_pov_2014", include = c("CT", "ME", "MA", "NH", "VT"), color = "blue") + 
#   scale_fill_continuous(low = "white", high = "blue", name = "Poverty Percentage Estimates", label = scales::comma) + 
#   labs(title = "New England Region", subtitle = "Poverty Percentage Estimates for New England Counties in 2014") +
#   theme(legend.position = "right")


#https://urban-institute.medium.com/how-to-create-state-and-county-maps-easily-in-r-577d29300bb2
devtools::install_github("UrbanInstitute/urbnmapr")

library(tidyverse)
library(urbnmapr)

ggplot() + 
  geom_polygon(data = urbnmapr::states, mapping = aes(x = long, y = lat, group = group),
               fill = "grey", color = "white") +
  coord_map(projection = "albers", lat0 = 39, lat1 = 45)

################ 1987
#filtering dataset
WAtri_tox87<-tri87 %>% filter(state=="WA") %>%
  group_by(county) %>%
  summarize(mean_release = (mean(onsite_release_total, na.rm = TRUE)))

indSeattletri_tox87<- indSeattletri_tox87 %>% arrange(desc(mean_release)) %>%
  slice(1:10)

#creating column in counties dataset to help to join to counties dataset
# View(countydata)
View(counties)

#upper case
counties_up<-counties %>% filter(state_name=="Washington") %>%
                                   mutate_if(is.character, str_to_upper)

#shortening name to match up
# https://community.rstudio.com/t/tidyr-separate-at-first-whitespace/26269
counties_up<- counties_up %>% mutate(county_name = str_replace(county_name, "\\s", "|")) %>% 
  separate(county_name, into = c("county", "rest"), sep = "\\|")

# joining dataset
county_datajoined87 <- left_join(WAtri_tox87, counties_up, by = "county") 

# ORIGINAL VERSION
county_datajoined87 %>%
  ggplot(aes(long, lat, group = group, fill = mean_release)) +
  geom_polygon(color = NA) +
  coord_map(projection = "albers", lat0 = 39, lat1 = 45) +
  labs(fill = "Median Household Income")

# install.packages("ggthemes")
# library(ggthemes)
# my updates
county_datajoined87 %>%
  ggplot(aes(long, lat, group = group, fill = mean_release)) +
  geom_polygon(color = "black") +
  coord_map(projection = "albers", lat0 = 39, lat1 = 45) +
  labs(fill = "On-Site Release Total (Total Lb)")+
  scale_fill_continuous(low = "white", high = "dark green") + 
  #theme_map()
  theme( axis.text.x = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks = element_blank(),
        axis.title.y=element_blank(),
        axis.title.x=element_blank(),
        panel.background = element_rect(fill = "grey"),
        panel.grid.major = element_line(color = "grey")) + 
  ggtitle("On-Site Pollution by WA State County - 1987") 
  #theme(rect = element_blank())
  
############# 2021
#filtering dataset
WAtri_tox21<-tri21 %>% filter(state=="WA") %>%
  group_by(county) %>%
  summarize(mean_release = (mean(onsite_release_total, na.rm = TRUE)))

indSeattletri_tox21<- indSeattletri_tox21 %>% arrange(desc(mean_release)) %>%
  slice(1:10)

# joining dataset
county_datajoined21 <- left_join(WAtri_tox21, counties_up, by = "county") 

# ORIGINAL VERSION
# county_datajoined21 %>%
#   ggplot(aes(long, lat, group = group, fill = mean_release)) +
#   geom_polygon(color = NA) +
#   coord_map(projection = "albers", lat0 = 39, lat1 = 45) +
#   labs(fill = "Median Household Income")

# install.packages("ggthemes")
# library(ggthemes)
# my updates
county_datajoined21 %>%
  ggplot(aes(long, lat, group = group, fill = mean_release)) +
  geom_polygon(color = "black") +
  coord_map(projection = "albers", lat0 = 39, lat1 = 45) +
  labs(fill = "On-Site Release Total (Total Lb)")+
  scale_fill_continuous(low = "white", high = "dark green") + 
  #theme_map()
  theme( axis.text.x = element_blank(),
         axis.text.y = element_blank(),
         axis.ticks = element_blank(),
         axis.title.y=element_blank(),
         axis.title.x=element_blank(),
         panel.background = element_rect(fill = "grey"),
         panel.grid.major = element_line(color = "grey")) + 
  ggtitle("On-Site Pollution by WA State County - 2021") 
#theme(rect = element_blank())

########################################## top 10 industries in Clallam in 1987 and then Benton in 2021

#highest toxins in Clallam in 1987 using ON-SITE RELEASE TOTAL

Clallam<-tri87 %>% filter(county=="CLALLAM") %>%
  group_by(industry.sector) %>%
  summarize(mean_release = (mean(onsite_release_total, na.rm = TRUE)))

Clallam<- Clallam %>% arrange(desc(mean_release)) %>%
  slice(1:10)

Clallam %>% 
  arrange(desc(mean_release)) %>%
  slice(1:10) %>%
  ggplot(., aes(x = reorder(industry.sector, -mean_release), y = mean_release )) +
  geom_bar(stat = "identity", fill = "dark green") +
  xlab("Industry") +
  ylab("On-Site Release Total (Total Lb)") + 
  ggtitle("Top 10 Industries in Clallam County by On-Site Release - 1987") +
  theme_minimal() + 
  theme(plot.title = element_text(hjust = 0.5), axis.text = element_text(size = 10))+ 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"))+ 
  theme(axis.text.x = element_text(angle = 90))


#highest toxins in Benton in 2021 using ON-SITE RELEASE TOTAL
Benton<-tri21 %>% filter(county=="BENTON") %>%
  group_by(industry.sector) %>%
  summarize(mean_release = (mean(onsite_release_total, na.rm = TRUE)))

Benton<- Benton %>% arrange(desc(mean_release)) %>%
  slice(1:10)

Benton %>% 
  arrange(desc(mean_release)) %>%
  slice(1:10) %>%
  ggplot(., aes(x = reorder(industry.sector, -mean_release), y = mean_release )) +
  geom_bar(stat = "identity", fill = "dark green") +
  xlab("Industry") +
  ylab("On-Site Release Total (Total Lb)") + 
  ggtitle("Top 10 Industries in Benton County by On-Site Release - 2021") +
  theme_minimal() + 
  theme(plot.title = element_text(hjust = 0.5), axis.text = element_text(size = 10))+ 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"))+ 
  theme(axis.text.x = element_text(angle = 90))
