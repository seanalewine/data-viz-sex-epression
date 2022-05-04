#Author Sean Alewine
##Before running this script you must install the 'tidyverse' package

## Run the following command in terminal:
## install.packages("tidyverse")

##Loads relevant libraries from tidyverse package
library(readr)
library(ggplot2)
library(dplyr)

##Import Data from CSV
##Data is grouped into arrays by column
##The first row of each column is the name of that array.
##This step passes a set of arrays into the variable 'data'
data <- read_csv("Downloads//test.csv")

##The %>% operator allows functions to work with arrays stored within the 'data' variable
data %>%
  
  ##Groups data by the first array, then subdivides within that by the second array
  ##Example: Comparing the data by 'sex' but grouped by 'Location'
  ##If only controlling for one group, ie sex, replace with 'group_by(Sex) >%>
  group_by(Location, Sex) %>%
  
  ##Creates summary statistics of the dependent variable for each group that was created by the previous command
  ##For example, an 'm' will be generated for each location and sex sub-grouping.
  summarize(m = mean(BCF),
            s = sd(BCF),
            c = length(BCF)) %>%
  
  ##Initiates the graph. To learn how to customize your plot, refer to this webpage:
  ## https://r-graph-gallery.com/barplot.html
  ggplot(aes(x = Location, 
             y = m, 
             group = Sex, 
             fill = Sex)) +
  
  ##Basic theme appropriate for scientific publication
  theme_classic() +
  ##Creates error bars, the following example places error bars at one standard deviation
  ##To view negative error bar on graph, move this section after geom_bar()
  geom_errorbar(aes(ymin = m-s, ymax = m+s), 
                position = position_dodge(.9), 
                size = .5, 
                width = .5) +
  
  ##Creates the bar graph
  geom_bar(stat = "identity", position = "dodge") +
 
  ##Overlays the N on each bar. To remove, delete the following four lines of code.
  geom_text(aes(label = c), 
            vjust = 2, 
            position = position_dodge(.9)) +
  
  ##Custom labels for x/y axis and title
  labs(x = "Location", 
       y = "Average BCF/Area", 
       title = "Dimorphism of TH Expression in Mouse A1 and A2 Nuclei") +
  
  ##Centers the title. For left-aligned, remove the following line of code.
  theme(plot.title = element_text(hjust = 0.5)) +
  
  ##Sets the bar color using hex color codes
  scale_fill_manual(values = c("#aaaaaa", "#dddddd") )
