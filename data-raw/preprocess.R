# This file preprocesses the data: Combine the two groups' data files,
# and save the resulting object as a .csv and an R data file.

file_type <- ".csv"
file_path <- list.files("data-raw/", full.names = T, pattern = file_type)
read_many <- function(files) {
  # Function to combine many files to one data object
  flist <- lapply(files, read.csv)
  data_obj <- do.call(rbind, flist)
  return(data_obj)
}

# Produce clean data by combining the two raw data files
# The name of this object should be meaningful
exampleData <- read_many(file_path)

# Write the cleaned data to a .csv file
write.csv(exampleData, file = "data-raw/clean_data.csv", row.names = F)

# Save the cleaned data in the required R package location
devtools::use_data(exampleData)
