x <- seq(from = 0, to = 20)
print(x^2)

num1 = 0.956786
num2 = 7.8345901
print(round(num1, 2))
print(round(num2, 3))

radius <- readline(prompt = "Radius of a circle: ")
print(pi*(as.numeric(radius)^2))

a=TRUE
b=FALSE

print(a&b)
print(a&!b)
print(a|b)
print(!a|b)
c=c(TRUE, FALSE)
d=c(FALSE, FALSE)
print(c&d)
print(c|d)