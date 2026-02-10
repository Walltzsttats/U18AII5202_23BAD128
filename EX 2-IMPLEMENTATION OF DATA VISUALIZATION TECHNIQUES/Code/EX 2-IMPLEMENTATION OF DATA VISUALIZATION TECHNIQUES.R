# STUDENT DETAILS
cat("STUDENT NAME: VISHWA A\n")
cat("ROLL NO: 238A0128\n")
cat("EXPERIMENT: Advanced Data Visualization\n\n")

# Load required library
if (!require(ggplot2)) {
  install.packages("ggplot2")
}
library(ggplot2)
cat("Library loaded successfully\n\n")

# Import dataset
cat("Select the e-commerce transaction CSV file\n")
data <- read.csv(file.choose(), stringsAsFactors = FALSE)
cat("Dataset imported successfully\n\n")

# Show column names (for confirmation)
names(data) <- make.names(names(data))
print(names(data))
cat("\n")

# BASIC DATA PREPROCESSING
# Identify numeric columns
num_cols <- which(sapply(data, is.numeric))

# Assume first numeric column is Transaction Amount
transaction_col <- num_cols[1]
cat("OUTPUT: Data preprocessing completed\n")
cat("Transaction amount column identified\n\n")

# HISTOGRAM – TRANSACTION AMOUNTS
cat("OUTPUT: Histogram of transaction amounts displayed\n")
ggplot(data, aes(x = data[[transaction_col]])) +
  geom_histogram(fill = "steelblue", bins = 20) +
  labs(
    title = "Distribution of Transaction Amounts",
    x = "Transaction Amount",
    y = "Frequency"
  )

# BOXPLOT – OUTLIER DETECTION
cat("OUTPUT: Boxplot displayed for outlier detection\n")
ggplot(data, aes(y = data[[transaction_col]])) +
  geom_boxplot(fill = "orange") +
  labs(
    title = "Outlier Detection Using Boxplot",
    y = "Transaction Amount"
  )

# CREATE MONTH COLUMN (FROM DATE)
date_col <- names(data)[grep("date", names(data), ignore.case = TRUE)][1]

data$Month <- format(as.Date(data[[date_col]]), "%b")
cat("OUTPUT: Month column created from date\n\n")

# IDENTIFY SALES & CATEGORY COLUMNS
sales_col <- names(data)[grep("sale|amount|value", names(data), ignore.case = TRUE)][1]

category_col <- names(data)[which(!sapply(data, is.numeric))[1]]

# HEATMAP – MONTHLY SALES INTENSITY
cat("OUTPUT: Heatmap displayed for monthly sales intensity\n")
ggplot(data, aes(
  x = Month,
  y = data[[category_col]],
  fill = data[[sales_col]]
)) +
  geom_tile() +
  labs(
    title = "Monthly Sales Intensity Heatmap",
    x = "Month",
    y = "Category"
  )
