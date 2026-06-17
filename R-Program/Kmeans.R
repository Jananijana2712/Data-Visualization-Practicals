# Load necessary libraries
library(ggplot2)
library(cluster)
library(readxl)

# Step 1: Load dataset
file_path <- "MetroPT3.xlsx"  # Replace with your actual file path
metropt3_data <- read_excel(file_path)

# Step 2: Select relevant columns for clustering (excluding 'Id' and 'timestamp')
metropt3_features <- metropt3_data[, c("TP2", "TP3", "H1", "DV_pressure", 
                                       "Reservoirs", "Oil_temperature", 
                                       "Motor_current", "COMP", "DV_eletric", 
                                       "Towers", "MPG", "LPS", 
                                       "Pressure_switch", "Oil_level", 
                                       "Caudal_impulses")]

# Step 3: Handle missing data (if any)
metropt3_features <- na.omit(metropt3_features)

# Step 4: Normalize the data for clustering
metropt3_features_scaled <- scale(metropt3_features)

# Step 5: Calculate WCSS for k values from 3 to 10
wcss <- function(k) {
  kmeans(metropt3_features_scaled, k, nstart = 25)$tot.withinss
}
wcss_values <- sapply(3:10, wcss)

# Step 6: Plot the Elbow Method to find the optimal number of clusters
plot(3:10, wcss_values, type = "b", pch = 19, frame = FALSE, 
     xlab = "Number of Clusters (k)", 
     ylab = "Within-Cluster Sum of Squares (WCSS)", 
     main = "Elbow Method for Optimal K")

# Step 7: Perform K-means clustering with the chosen number of clusters
set.seed(123)
optimal_k <- 10  # Change based on the elbow plot
kmeans_result <- kmeans(metropt3_features_scaled, centers = optimal_k, nstart = 25)

# Step 8: Add cluster assignments to the original data
metropt3_data$Cluster <- as.factor(kmeans_result$cluster)

# Step 9: Perform PCA to reduce dimensions for visualization
metropt3_pca <- prcomp(metropt3_features_scaled)
metropt3_data$PCA1 <- metropt3_pca$x[, 1]
metropt3_data$PCA2 <- metropt3_pca$x[, 2]

# Step 10: Visualize the clusters with a legend
ggplot(metropt3_data, aes(x = PCA1, y = PCA2, color = Cluster)) +
  geom_point(size = 3) +
  labs(title = "K-Means Clustering with PCA (k = Optimal Clusters)", 
       x = "PCA Component 1", 
       y = "PCA Component 2", 
       color = "Cluster") +  # This ensures a proper legend title
  theme_minimal() +
  theme(legend.position = "right")  # Legend on the right (default)
