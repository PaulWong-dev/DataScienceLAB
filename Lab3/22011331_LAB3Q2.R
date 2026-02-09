student_scores <- list(
  Robert = 59,
  Hemsworth = 71,
  Scarlett = 83,
  Evans = 68,
  Pratt = 65,
  Larson = 57,
  Holland = 62,
  Paul = 92,
  Simu = 92,
  Renner = 59
)
scores_vector <- unlist(student_scores)
highest_val <- max(scores_vector)
lowest_val <- min(scores_vector)
average_val <- mean(scores_vector)
student_highest <- names(scores_vector)[scores_vector == highest_val]
student_lowest <- names(scores_vector)[scores_vector == lowest_val]
cat("Highest Score:", highest_val, "\n")
cat("Lowest Score:", lowest_val, "\n")
cat("Average Score:", round(average_val, 2), "\n") 
cat("Student with highest score:", paste(student_highest, collapse = ", "), "\n")
cat("Student with lowest score:", paste(student_lowest, collapse = ", "), "\n")