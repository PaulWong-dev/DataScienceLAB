string1 <- readline(prompt = "Enter string 1: ")
string2 <- readline(prompt = "Enter string 2: ")

result <- tolower(string1) == tolower(string2)

cat("This program compare 2 strings. Both inputs are similar:", result, "\n")