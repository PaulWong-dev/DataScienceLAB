#HELLO

weight <- 75
height <- 1.75
bmi <- weight / (height ^ 2)
cat("Calculated BMI:", round(bmi, 1), "\n\n")

cat("Underweight:", bmi <= 18.4, "\n")
cat("Normal:", bmi >= 18.5 & bmi <= 24.9, "\n")
cat("Overweight:", bmi >= 25.0 & bmi <= 39.9, "\n")
cat("Obese:", bmi >= 40.0, "\n")
