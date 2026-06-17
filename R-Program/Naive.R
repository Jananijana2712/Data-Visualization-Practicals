# Load necessary libraries
library(readxl)

# Step 1: Load dataset
file_path <- "MetroPT3.xlsx"  # Replace with your actual file path
dataset <- read_excel(file_path)

# Step 2: Select numeric columns for outlier detection (e.g., numeric features like TP2, TP3, etc.)
numeric_columns <- dataset[, c("TP2", "TP3", "H1", "DV_pressure", "Oil_temperature", "Motor_current", 
                               "DV_eletric", "Towers", "MPG", "LPS", "Pressure_switch", "Oil_level", 
                               "Caudal_impulses")]

# Step 3: Function to detect outliers using IQR
detect_outliers_iqr <- function(data_column) {
  Q1 <- quantile(data_column, 0.25)
  Q3 <- quantile(data_column, 0.75)
  IQR_value <- Q3 - Q1
  lower_bound <- Q1 - 1.5 * IQR_value
  upper_bound <- Q3 + 1.5 * IQR_value
  outliers <- which(data_column < lower_bound | data_column > upper_bound)
  return(outliers)
}

# Detecting outliers for each numeric column using IQR
iqr_outliers <- lapply(numeric_columns, detect_outliers_iqr)

# Print outliers detected by IQR for each column
for (col_name in names(iqr_outliers)) {
  cat("Outliers in", col_name, ":", iqr_outliers[[col_name]], "\n")
}

# Step 4: Function to detect outliers using Z-score
detect_outliers_zscore <- function(data_column, threshold = 3) {
  z_scores <- scale(data_column)  # Standardize the column
  outliers <- which(abs(z_scores) > threshold)
  return(outliers)
}

# Detecting outliers for each numeric column using Z-score
zscore_outliers <- lapply(numeric_columns, detect_outliers_zscore)

# Print outliers detected by Z-score for each column
for (col_name in names(zscore_outliers)) {
  cat("Outliers in", col_name, "using Z-score:", zscore_outliers[[col_name]], "\n")
}

