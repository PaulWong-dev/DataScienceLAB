
scores <- c(33, 24, 54, 94, 16, 89, 60, 6, 77, 61, 13, 44, 26, 24, 73, 73, 90, 39, 90, 54)
pass_status <- scores > 49

count_A <- sum(scores >= 90 & scores <= 100)
count_B <- sum(scores >= 80 & scores <= 89)
count_C <- sum(scores >= 70 & scores <= 79)
count_D <- sum(scores >= 60 & scores <= 69)
count_E <- sum(scores >= 50 & scores <= 59)
count_F <- sum(scores <= 49)

cat("Pass Status for each student (>49):\n")
print(pass_status)

cat("\n--------------------------------\n")
cat("Grade Distribution Summary:\n")
cat("--------------------------------\n")
cat("Grade A (90-100):", count_A, "students\n")
cat("Grade B (80-89) :", count_B, "students\n")
cat("Grade C (70-79) :", count_C, "students\n")
cat("Grade D (60-69) :", count_D, "students\n")
cat("Grade E (50-59) :", count_E, "students\n")
cat("Grade F (<=49)  :", count_F, "students\n")