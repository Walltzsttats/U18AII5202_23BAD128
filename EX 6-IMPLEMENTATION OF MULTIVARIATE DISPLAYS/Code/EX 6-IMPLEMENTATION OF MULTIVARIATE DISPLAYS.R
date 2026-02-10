# ================================
# VISHWA A _ 23BAD128
# ================================

# Load libraries
library(ggplot2)
library(GGally)
library(dplyr)

# Upload CSV file
df <- read.csv(file.choose())

# Rename columns
colnames(df) <- c(
  "Order_ID",
  "Region",
  "Product_Category",
  "Sales",
  "Profit",
  "Discount",
  "Customer_Segment"
)

student_name <- "Vishwa A (23BAD128)"

# ================================
# 1. Parallel Coordinates Plot
# ================================
windows()
ggparcoord(
  data = df,
  columns = c(4, 5, 6),
  groupColumn = "Customer_Segment",
  scale = "uniminmax"
) +
  labs(
    title = student_name,
    subtitle = "Parallel Coordinates: Sales, Profit, Discount by Segment"
  ) +
  theme_minimal()

# ================================
# 2. Bubble Chart (Sales vs Profit)
# ================================
windows()
ggplot(df, aes(x = Sales, y = Profit, size = Discount, color = Region)) +
  geom_point(alpha = 0.6) +
  scale_size(range = c(3, 10)) +
  labs(
    title = student_name,
    subtitle = "Bubble Chart: Sales vs Profit (Size = Discount)",
    x = "Sales",
    y = "Profit"
  ) +
  theme_minimal()

# ================================
# 3. Trellis Display by Region
# ================================
windows()
ggplot(df, aes(x = Sales, y = Profit, color = Customer_Segment)) +
  geom_point(size = 2) +
  geom_smooth(method = "lm", se = FALSE) +
  facet_wrap(~ Region) +
  labs(
    title = student_name,
    subtitle = "Trellis Display: Performance by Region",
    x = "Sales",
    y = "Profit"
  ) +
  theme_bw()
