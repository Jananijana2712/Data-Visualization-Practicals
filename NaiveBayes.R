library(e1071)
library(pROC)
library(caret)
library(readxl)
library(caTools)

file_path <- "MetroPT3.xlsx"  # Replace with your actual file path
dataset <- read_excel(file_path)

str(dataset)
head(dataset)

dataset$COMP <- as.factor(dataset$COMP)

set.seed(123)  # For reproducibility
split <- sample.split(dataset$COMP, SplitRatio = 0.9)  # 70% training, 30% testing
train_data <- subset(dataset, split == TRUE)
test_data <- subset(dataset, split == FALSE)

nb_model <- naiveBayes(COMP ~ TP2 + TP3 + H1 + DV_pressure + Oil_temperature + Motor_current + DV_eletric + Towers + MPG + LPS + Pressure_switch + Oil_level + Caudal_impulses, data = train_data) 
                       

predicted_classes <- predict(nb_model, test_data)
predicted_probabilities <- predict(nb_model, test_data, type = "raw")[,2]

actual_classes <- test_data$COMP
accuracy <- mean(predicted_classes == actual_classes)

print(paste("Accuracy:", round(accuracy * 100, 2), "%"))

conf_matrix <- table(Predicted = predicted_classes, Actual = test_data$COMP)

# True Positives, True Negatives, False Positives, False Negatives
TP <- conf_matrix[2, 2]
TN <- conf_matrix[1, 1]
FP <- conf_matrix[2, 1]
FN <- conf_matrix[1, 2]

# Step 7: Calculate Sensitivity, Specificity, and F1-Score
sensitivity <- TP / (TP + FN)  # Sensitivity (Recall)
specificity <- TN / (TN + FP)  # Specificity
precision <- TP / (TP + FP)    # Precision
f1_score <- (2 * precision * sensitivity) / (precision + sensitivity)  # F1-Score

# Print the results
print(paste("True Positive (TP):", TP))
print(paste("True Negative (TN):", TN))
print(paste("False Positive (FP):", FP))
print(paste("False Negative (FN):", FN))
print(paste("Sensitivity (Recall):", round(sensitivity, 4)))
print(paste("Specificity:", round(specificity, 4)))
print(paste("F1-Score:", round(f1_score, 4)))

# Step 8: Plot ROC Curve and Calculate AUC
roc_curve <- roc(test_data$COMP, predicted_probabilities)
plot(roc_curve, col = "green", main = "Naive Bayes ROC Curve")
auc_value <- auc(roc_curve)
print(paste("AUC:", round(auc_value, 4)))
