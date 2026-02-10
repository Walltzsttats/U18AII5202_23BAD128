# VISHWA A
# 23BAD128
# R LAB – Traffic Accident Data Visualization

# Install & load required packages
required_packages <- c("ggplot2", "dplyr", "readr")

for (pkg in required_packages) {
  if (!require(pkg, character.only = TRUE)) {
    install.packages(pkg, dependencies = TRUE)
    library(pkg, character.only = TRUE)
  }
}

# Upload CSV file
accident_data <- read_csv(file.choose())

# Preview data
head(accident_data)

# Convert Severity to factor
accident_data$Severity <- factor(
  accident_data$Severity,
  levels = c("Low", "Medium", "High")
)

# Data Visualization
ggplot(
  accident_data,
  aes(
    x = Location,
    y = Casualties,
    color = Severity,          # Color → Severity
    size = Vehicles_Involved,  # Size → Vehicles involved
    shape = Accident_Type      # Shape → Accident type
  )
) +
  geom_point(alpha = 0.8) +
  scale_color_manual(
    values = c(
      "Low" = "yellow",
      "Medium" = "orange",
      "High" = "red"
    )
  ) +
  scale_size_continuous(range = c(3, 12)) +
  labs(
    title = "City Traffic Accident Risk Analysis",
    subtitle = "Color = Severity | Size = Vehicles | Shape = Accident Type",
    x = "Location",
    y = "Number of Casualties"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(face = "bold"),
    legend.position = "right"
  )
