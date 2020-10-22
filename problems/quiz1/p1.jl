using Roots

# Given
i = 0.09
# compounded annually
# double the amount
log(2) / log(1 + i)

f(x) = 2 - (1 + i)^x
find_zero(f, 1)
