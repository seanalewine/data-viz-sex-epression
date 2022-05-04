#Author Sean Alewine
##Before running this script you must install the 'tidyverse' package

##You may save your graph by clicking the "Export" button 
##above the oanel to the right where your graph is rendered

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
  
  ##Initiates the graph. To learn how to customize your plot, refer to this webpage:
  ## https://r-graph-gallery.com/violin.html
  ggplot(aes(
        x = Location, 
        y = BCF, 
        fill = Sex)) +
  ##Basic theme appropriate for scientific publication  
  theme_classic() +
  
  ##Creates the violin plot
  geom_violin(width=1.4, position=position_dodge(1)) +
  
  #Visualizes each data point on top of the violin plot
  geom_dotplot(binaxis='y', stackdir='center',
               position=position_dodge(1)) +
  
  #Visualizes a box plot
  geom_boxplot(width=.7, 
               color=c("blue","red","blue","red"), 
               alpha=.3, 
               position=position_dodge(1)) +
  
  ##Custom labels for x/y axis and title
  labs(
    x = "Location", 
    y = "Average BCF/Area",
    title = "Dimorphism of TH Expression in Mouse A1 and A2 Nuclei") +
  
  ##Centers the title. For left-aligned, remove the following line of code.
  theme(plot.title = element_text(hjust = 0.5)) +
  
  ##Sets the bar color using hex color codes
  scale_fill_manual(values = c("#aaaaaa", "#dddddd") )
