# Load raw data from .csv file
exampleData <- read.csv("data-raw/simulated-data.csv")
# Apply preprocessing...
# Save the cleaned data in the required R package location
usethis::use_data(exampleData)
