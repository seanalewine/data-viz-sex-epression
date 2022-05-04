# Data Visualization of Sex Expression Differences in Two Distinct Populations

This example code allows you to represent comparative data of two distinct populations on one graph using R-Studio

## Initial Setup
1. Install base R Language: https://archive.linux.duke.edu/cran/ .
2. Install R-Code: https://www.rstudio.com/products/rstudio/download/#download .
3. Format experimental data using the included `test.csv` file as an example.

## Using the Scripts
1. Export desired script from Github & experiment data set as a `.csv` file
2. Open R Code
3. In the bottom left window select 'Terminal'
4. Run the following command `install.packages("tidyverse")`. It may take awhile.
5. File > Open File...
6. Select the script from your download location.
7. Ensure that you have modified the `read_csv()` function in the script to import your experiment data from the correct location.

## Customizing the Graph
GGPlot 2 allows nearly endless options for data expression
Code examples exist at these websites:
* The basics: https://r-graph-gallery.com/index.html
* A ton of different visualization options: https://r-statistics.co/Top50-Ggplot2-Visualizations-MasterList-R-Code.html#4.%20Distribution 


## Examples
#### Bar Graph.R
![Bar Graph Example](https://github.com/seanalewine/data-viz-sex-epression/blob/main/images/Bar%20Graph.png?raw=true)
#### Violin+boxplot+dotplot.R
![Violin Plot Example](https://github.com/seanalewine/data-viz-sex-epression/blob/main/images/Violin%20Plot.png?raw=true)
