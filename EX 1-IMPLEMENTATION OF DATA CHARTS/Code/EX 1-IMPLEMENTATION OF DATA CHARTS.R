# STUDENT DETAILS
cat("STUDENT NAME: VISHWA A\n")
cat("ROLL NO: 238AD128\n")
cat("EXPERIMENT: Academic Performance Visualization\n\n")

# Load CSV file
cat("Select the CSV file and click OPEN\n")
data <- read.csv(file.choose(), stringsAsFactors = FALSE)
cat("Dataset loaded successfully\n\n")

# SHOW DATA (CONFIRMATION)
print(head(data))
cat("\n")

# PREPROCESSING
# Convert column names to valid format
names(data) <- make.names(names(data))

# Take first 3 numeric columns as marks
num_cols <- which(sapply(data, is.numeric))

# Calculate Average Marks
data$Average_Marks <- rowMeans(data[, num_cols[1:3]])
cat("OUTPUT: Data preprocessing completed\n")
cat("Average Marks calculated\n\n")

# BAR GRAPH – SUBJECT-WISE AVERAGE
subject_avg <- colMeans(data[, num_cols[1:3]])
cat("OUTPUT: Bar graph displayed\n")

barplot(
  subject_avg,
  col = "skyblue",
  main = "Subject-wise Average Marks",
  ylab = "Average Marks",
  xlab = "Subject"
)

# LINE CHART – PERFORMANCE TREND
test_avg <- colMeans(data[, num_cols[1:2]])
cat("OUTPUT: Line chart displayed\n")

plot(
  test_avg,
  type = "o",
  col = "blue",
  xaxt = "n",
  xlab = "Tests",
  ylab = "Average Marks",
  main = "Performance Trend Across Tests"
)

axis(1, at = 1:2, labels = c("Test 1", "Test 2"))

# PIE CHART – GRADE DISTRIBUTION
grade_col <- names(data)[grep("grade", names(data), ignore.case = TRUE)][1]
grade_table <- table(data[[grade_col]])

cat("OUTPUT: Pie chart displayed\n")

pie(
  grade_table,
  main = "Grade Distribution",
  col = rainbow(length(grade_table))
)
