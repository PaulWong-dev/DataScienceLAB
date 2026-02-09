age <- c(55, 57, 56, 52, 51, 59, 58, 53, 59, 55, 60, 60, 60, 60, 52, 55, 56, 51, 60, 
         52, 54, 56, 52, 57, 54, 56, 58, 53, 53, 50, 55, 51, 57, 60, 57, 55, 51, 50, 57, 58)

age_factor <- factor(age)

cat("Levels of factor (Unique Ages):\n")
print(levels(age_factor))

staff_count_table <- as.data.frame(table(age))
colnames(staff_count_table) <- c("Staff Age", "Total number of staff")

cat("\nTable 1: Staff Count by Age\n")
print(staff_count_table, row.names = FALSE)

age_groups <- cut(age, breaks = seq(50, 60, by = 2), include.lowest = TRUE)

range_table <- as.data.frame(table(age_groups))
colnames(range_table) <- c("Age Range", "Total number of staff")

levels(range_table$`Age Range`) <- c("50-52", "52-54", "54-56", "56-58", "58-60")

cat("\nTable 2: Staff Count by Age Range\n")
print(range_table, row.names = FALSE)

cat("\nConclusion/Insight:\n")
cat("1. The highest number of staff (6 people) are currently at the age of 60.\n")
cat("2. Looking at the ranges, the '50-52' group has the highest density (10 staff), followed by '54-56' (9 staff).\n")
cat("3. Overall, the workforce is heavily skewed towards older demographics, with a significant cluster at the maximum retirement age.\n")