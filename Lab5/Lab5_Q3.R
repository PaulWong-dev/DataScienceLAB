cat("Check whether an n digits number is Armstrong or not:\n")
cat("-----------------------------------------------------------\n")

num_str <- readline(prompt="Input an integer: ")
num <- as.integer(num_str)
n <- nchar(num_str)
sum <- 0
temp <- num

while (temp > 0) {
  digit <- temp %% 10
  sum <- sum + (digit ^ n)
  temp <- temp %/% 10
}

if (sum == num) {
  cat(num, "is an Armstrong number.\n")
} else {
  cat(num, "is not an Armstrong number.\n")
}