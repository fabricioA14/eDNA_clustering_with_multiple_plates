# Load the necessary package

library(data.table)

# File paths

files <- list(
  # Define the path for the PL03 plate
  "PL03" = "mapping_file_PL03_Leray.txt",
  # Define the path for the PL06 plate
  "PL06" = "mapping_file_PL06_Leray.txt",
  # Define the path for the PL12 plate
  "PL12" = "mapping_file_PL12_Leray.txt",
  # Define the path for the PL15 plate
  "PL15" = "mapping_file_PL15_Leray.txt",
  # Define the path for the PL21 plate
  "PL21" = "mapping_file_PL21_Leray.txt"
)

# Function to read and add plate number column
read_and_add_plate <- function(file, plate) {
  # Read the file without a header and specify tab as the separator
  df <- fread(file, header = FALSE, sep = "\t")
  # Add a new column with the plate number
  df <- cbind(Plate = plate, df)
  # Return the modified dataframe
  return(df)
}

# Read and merge the datasets with plate numbers

dfs <- lapply(names(files), function(plate) read_and_add_plate(files[[plate]], plate))

# Combine all dataframes into one

merged_df <- rbindlist(dfs)

# Select the third column

third_column <- merged_df[[3]]

# Check for duplicated values

duplicated_indices <- which(duplicated(third_column) | duplicated(third_column, fromLast = TRUE))

# Extract rows with duplicated values

duplicated_rows <- merged_df[duplicated_indices, ]

# Define specific values to modify (duplicated sample names)

specific_values <- c("PG19C085_A", "PCR1_NC_A", "PCR2_NC_A", "PCR3_NC_A",
                     "PG19C085_B", "PCR1_NC_B", "PCR2_NC_B", "PCR3_NC_B",
                     "PG19C085_C", "PCR1_NC_C", "PCR2_NC_C", "PCR3_NC_C")

# Add an underscore to the end of specific values in the second column for the PL15 plate (needed only for this plate in this case)

merged_df[Plate == "PL15" & V2 %in% specific_values, V2 := paste0(V2, "_")]

# Select the third column again after modification

third_column <- merged_df[[3]]

# Check for duplicated values again after modification
# The main goal here is to create a dataset with no duplicated rows.
# This means that the name modifications ensure the presence of only unique sample names in the dataset.

duplicated_indices <- which(duplicated(third_column) | duplicated(third_column, fromLast = TRUE))

# Extract rows with duplicated values again after modification
# The main goal here is to create a dataset with no duplicated rows.
# This means that the name modifications ensure the presence of only unique sample names in the dataset.

duplicated_rows <- merged_df[duplicated_indices, ]
