## HMS 520 Final Project, Autumn 2022
## EPA Toxics Release Inventory data
## Authors: Annika Goranson, Caroline Kasman, Jessica Klusty
## Updated: December 11, 2022


## highest chemicals in US and Seattle ---------------------------------------------

## create function to visualize top 10 chemicals by varying levels of detail (US and Seattle)
## NOTE: from Caroline Kasman; 1987 and 2021 kept as separate viz's, rather than merging datasets and creating facet wrap, as allows to create 2 separate top 10 lists
## NOTE: from Caroline Kasman; I tried to add an additional variable to my function to replace the variable in the group_by so I could specify chemical or industry.sector. However, I would receive an error that the variable did not exist, tried a few things like tri87$chemical, tri87[[chemical]], !!aggregating_variable etc. Peng was not quite sure how to fix it as well. 

chemviz <- function(tri_dataset,viz_title,bar_color) {
  
  # aggregating dataset to get top 10 chemicals by mean onsite release total and then arrange to be from highest to lowest
  tri_dataset<-tri_dataset %>%
    group_by(chemical) %>%
    summarize(mean_release = (mean(onsite_release_total, na.rm = TRUE))) %>% 
    arrange(desc(mean_release)) %>%
    slice(1:10) 
  
  # visualizing this top 10 list as bar chart
  ggplot(tri_dataset, aes(x = reorder(chemical, -mean_release), y = mean_release )) +
    geom_bar(stat = "identity", fill = bar_color) +
    xlab("Chemical") +
    ylab("On-Site Release Total (Total Lb)") + 
    ggtitle(viz_title) +
    theme_minimal() + 
    theme(plot.title = element_text(hjust = 0.5), axis.text = element_text(size = 10))+ 
    theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
          panel.background = element_blank(), axis.line = element_line(colour = "black"))+ 
    theme(axis.text.x = element_text(angle = 90))
}

# US level visualizations
chemviz(tri87,"Top 10 Chemicals in US by On-Site Release - 1987","light green")
chemviz(tri21,"Top 10 Chemicals in US by On-Site Release - 2021","dark green")

# Seattle level visualizations 
chemviz(filter(tri87,city=="SEATTLE"),"Top 10 Chemicals in Seattle by On-Site Release - 1987","light green")
chemviz(filter(tri21,city=="SEATTLE"),"Top 10 Chemicals in Seattle by On-Site Release - 2021","dark green")

## biggest contributing industries in US and Seattle ---------------------------------------------

## create function to visualize top 10 chemicals by varying levels of detail (US and Seattle)
industryviz <- function(tri_dataset,viz_title,bar_color) {
  
  # aggregating dataset to get top 10 chemicals by mean onsite release total and then arrange to be from highest to lowest
  tri_dataset<-tri_dataset %>%
    group_by(industry.sector) %>%
    summarize(mean_release = (mean(onsite_release_total, na.rm = TRUE))) %>% 
    arrange(desc(mean_release)) %>%
    slice(1:10) 
  
  # visualizing this top 10 list as bar chart
  ggplot(tri_dataset, aes(x = reorder(industry.sector, -mean_release), y = mean_release )) +
    geom_bar(stat = "identity", fill = bar_color) +
    xlab("Industry") +
    ylab("On-Site Release Total (Total Lb)") + 
    ggtitle(viz_title) +
    theme_minimal() + 
    theme(plot.title = element_text(hjust = 0.5), axis.text = element_text(size = 10))+ 
    theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
          panel.background = element_blank(), axis.line = element_line(colour = "black"))+ 
    theme(axis.text.x = element_text(angle = 90))
}

# US level visualizations
industryviz(tri87,"Top 10 Industries in US by On-Site Release - 1987","light green")
industryviz(tri21,"Top 10 Industries in US by On-Site Release - 2021","dark green")

# Seattle level visualizations 
industryviz(filter(tri87,city=="SEATTLE"),"Top 10 Industries in Seattle by On-Site Release - 1987","light green")
industryviz(filter(tri21,city=="SEATTLE"),"Top 10 Industries in Seattle by On-Site Release - 2021","dark green")

## map of Washington State counties by site total release pollution ---------------------------------------------

# filtering to WA level, changing county name format to match tri dataset (all uppercase, remove "county" after county name)
WA_counties<-counties %>% filter(state_name=="Washington") %>%
  mutate_if(is.character, str_to_upper) %>% mutate(county_name = str_replace(county_name, "\\s", "|")) %>% 
  separate(county_name, into = c("county", "rest"), sep = "\\|")

## function to make tri data on WA state county level and merge it with county GIS data to map
## NOTE: From Caroline Kasman; could also assign df name inside function using  #assign(x = merged_df_name, value = WA_agg_data, envir = globalenv()) but not necessary for function to perform well
WA_mergeddata <- function(tri_dataset,merged_df_name) {
WA_mergeddata <- function(tri_dataset,viz_title) {
    
    #filter tri data to Washington state level, group on county level, merge with county GIS data
    WA_agg_data<-tri_dataset %>% filter(state=="WA") %>%
    group_by(county) %>%
    summarize(mean_release = (mean(onsite_release_total, na.rm = TRUE))) %>%
    left_join(., WA_counties, by = "county") 
    
    # visualize joined data - grey background to see where missing county data
    WA_agg_data %>%
      ggplot(aes(long, lat, group = group, fill = mean_release)) +
      geom_polygon(color = "black") +
      coord_map(projection = "albers", lat0 = 39, lat1 = 45) +
      labs(fill = "On-Site Release Total (Total Lb)")+
      scale_fill_continuous(low = "white", high = "dark green") + 
      theme( axis.text.x = element_blank(),
             axis.text.y = element_blank(),
             axis.ticks = element_blank(),
             axis.title.y=element_blank(),
             axis.title.x=element_blank(),
             panel.background = element_rect(fill = "grey"),
             panel.grid.major = element_line(color = "grey")) + 
      ggtitle(viz_title) 
}

WA_mergeddata(tri87,"On-Site Pollution by WA State County - 1987")
WA_mergeddata(tri21,"On-Site Pollution by WA State County - 2021")

## Through visual inspection, see that Clallam county has highest in 1987, Benton county in 2021 

## Top 10 contributing industries in 1987 Clallam and 2021 Benton  ---------------------------------------------

industryviz(filter(tri87,county=="CLALLAM"),"Top 10 Industries in Clallam County by On-Site Release - 1987","light green")
industryviz(filter(tri21,county=="BENTON"),"Top 10 Industries in Benton County by On-Site Release - 2021","dark green")



