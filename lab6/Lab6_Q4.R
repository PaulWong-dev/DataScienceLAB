name <- c("Anastasia", "Dima", "Michael", "Matthew", "Laura", "Kevin", "Jonas")
score <- c(12.5, 9.0, 16.5, 12.0, 9.0, 8.0, 19.0)
attempts <- c(1, 3, 2, 3, 2, 1, 2)
qualify <- c("yes", "no", "yes", "no", "no", "no", "yes")
new_student <- data.frame(
  name = "Emily", 
  score = 14.5, 
  attempts = 1, 
  qualify = "yes"
)

student_data <- data.frame(name, score, attempts)
student_data$qualify <- qualify
student_data <- rbind(student_data, new_student)
student_data$qualify <- as.factor(student_data$qualify)

print("--- Structure ---")
str(student_data)

print("--- Summary ---")
summary(student_data)

print("--- Dimensions (Rows, Columns) ---")
dim(student_data) 
nrow(student_data)
ncol(student_data)