## HMS 520 Final Project, Autumn 2022
## EPA Toxics Release Inventory data
## Authors: Annika Goranson, Caroline Kasman, Jessica Klusty
## Updated: December 11, 2022

## Code to demonstrate attempts at further refactoring bar chart visualization functions
## From Caroline Kasman

## another way to load data sets (more useful if more than 2 datasets) -----------------------------------------------------------

## to make it easier to load data
years <- c(2021, 1987)

#makes a list of "tri" variables that can be attached to 2021 to 1987
tri <- lapply(years, function(x) read.csv(paste0("tri", x, ".csv"), header = TRUE))

# assigning names to the variables in list
# will later have to reference as tri$`2021` or tri[[“2021”]]
names(tri)<-years

## using in function
chemviz <- function(tri_dataset,viz_title,bar_color) {
  tri_dataset<-tri_dataset %>%
    group_by(chemical) %>%
    summarize(mean_release = (mean(onsite_release_total, na.rm = TRUE))) %>% 
    arrange(desc(mean_release)) %>%
    slice(1:10) 
  
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

chemviz(tri[["1987"]],"Top 10 Chemicals in US by On-Site Release - 1987","light green")
chemviz(filter(tri[["1987"]],city=="Seattle"),"Top 10 Chemicals in US by On-Site Release - 1987","light green")

## trying to add ability to customize group_by variable into function -----------------------------------------------------------

## attempt 1
chemviz <- function(tri_dataset,aggregating_variable,viz_title,bar_color) {
  tri_dataset<-tri_dataset %>%
    group_by(aggregating_variable) %>%
    summarize(mean_release = (mean(onsite_release_total, na.rm = TRUE))) %>% 
    arrange(desc(mean_release)) %>%
    slice(1:10) 
  
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

chemviz(tri[["1987"]],tri[["1987"]]$chemical,"Top 10 Chemicals in US by On-Site Release - 1987","light green")
chemviz(tri[["2021"]],"Top 10 Chemicals in US by On-Site Release - 2021","dark green","chemical")

## attempt 2
chemviz <- function(tri_dataset,aggregating_variable,viz_title,bar_color) {
  tri_dataset<-tri_dataset %>%
    group_by(!!aggregating_variable) %>%
    summarize(mean_release = (mean(onsite_release_total, na.rm = TRUE))) %>% 
    arrange(desc(mean_release)) %>%
    slice(1:10) 
  
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

## attempt 3
chemviz <- function(tri_dataset,!!aggregating_variable,viz_title,bar_color) {
  tri_dataset<-tri_dataset %>%
    group_by(!!aggregating_variable) %>%
    summarize(mean_release = (mean(onsite_release_total, na.rm = TRUE))) %>% 
    arrange(desc(mean_release)) %>%
    slice(1:10) 
  
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

## attempt 4
chemviz <- function(tri_dataset,aggregating_variable,viz_title,bar_color) {
  tri_dataset<-tri_dataset %>%
    group_by(tri_dataset$aggregating_variable) %>%
    summarize(mean_release = (mean(onsite_release_total, na.rm = TRUE))) %>% 
    arrange(desc(mean_release)) %>%
    slice(1:10) 
  
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
## multiple attempts: trying different combinations to see if it runs
chemviz(tri[["1987"]],"chemical","Top 10 Chemicals in US by On-Site Release - 1987","light green")
chemviz(tri[["1987"]],chemical,"Top 10 Chemicals in US by On-Site Release - 1987","light green")
chemviz(tri[["1987"]],tri[["1987"]]$chemical,"Top 10 Chemicals in US by On-Site Release - 1987","light green")
chemviz(tri87,tri87$chemical,"Top 10 Chemicals in US by On-Site Release - 1987","light green")
chemviz(tri87,"chemical","Top 10 Chemicals in US by On-Site Release - 1987","light green")
chemviz(tri87,tri87[[chemical]],"Top 10 Chemicals in US by On-Site Release - 1987","light green")
chemviz(tri87,tri87[chemical],"Top 10 Chemicals in US by On-Site Release - 1987","light green")



