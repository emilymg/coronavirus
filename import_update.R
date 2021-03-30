#Install the coronavirus package
devtools::install_github("RamiKrispin/coronavirus")


library(tidyverse)
library(lubridate)

#Update the dataset with most recent version
library(coronavirus)
update_dataset()




