#Install the coronavirus package
devtools::install_github("RamiKrispin/coronavirus")

library(tidyverse)
library(lubridate)

#Update the dataset with most recent version, method 1
#Note: method not retrieving new data as of 03/28/2021.
library(coronavirus)
update_dataset()

#Method 2: Import updated csv directly
library(readr)
coronavirus_df <- read_csv("https://raw.githubusercontent.com/RamiKrispin/coronavirus/master/csv/coronavirus.csv", 
                           col_types = cols(date = col_date(format = "%Y-%m-%d"), 
                                            cases = col_number()))
summary(coronavirus_df)
str(coronavirus_df)