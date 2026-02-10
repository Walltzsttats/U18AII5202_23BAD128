# VISHWA A
# 23BAD128
# R LAB – Patient Health Data Analysis

# Install and load required packages
if (!require(GGally)) {
  install.packages("GGally", dependencies = TRUE)
}
if (!require(ggplot2)) {
  install.packages("ggplot2", dependencies = TRUE)
}

library(GGally)
library(ggplot2)

# Set seed for reproducibility
set.seed(123)

# Create patient data
patient_data <- data.frame(
  Age = sample(20:80, 100, replace = TRUE),
  BMI = rnorm(100, mean = 27, sd = 4),
  Glucose = rnorm(100, mean = 110, sd = 15),
  BloodPressure = rnorm(100, mean = 120, sd = 10)
)

# Create Age Group
patient_data$AgeGroup <- cut(
  patient_data$Age,
  breaks = c(0, 35, 55, 100),
  labels = c("Young", "Middle-aged", "Older")
)

# Pairwise plot using ggpairs
ggpairs(
  patient_data,
  columns = c("Age", "BMI", "Glucose", "BloodPressure"),
  aes(color = AgeGroup, alpha = 0.7)
)

# Correlation matrix
cor_matrix <- cor(
  patient_data[, c("Age", "BMI", "Glucose", "BloodPressure")]
)

# Print correlation matrix
print(cor_matrix)
