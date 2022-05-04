##Author: Sean Alewine
##Refer to comments in 'Box Plot.R' for instructions on using this example code.

library(readr)
library(ggplot2)
library(dplyr)

##Import Data from CSV
data <- read_csv("Downloads//negcontrol.csv")

data %>%
  group_by(Location, Control) %>%
  summarize(m = mean(BCF),
            s = sd(BCF),
            c = length(BCF)) %>%
  ggplot(aes(x = Location, 
             y = m, 
             group = Control, 
             fill = Control)) +
  theme_classic() +
  geom_errorbar(aes(ymin = m-s, ymax = m+s), 
                position = position_dodge(.9), 
                size = .5,
                width = .5) +
  geom_bar(stat = "identity", position = "dodge") +
  
  labs(x = "Location", 
       y = "TH Expression") +
  
  theme(plot.title = element_text(
          face="bold", hjust = .5),
          legend.position="bottom") +
  
  scale_fill_manual(values = c("#adadad", "#616161") )
