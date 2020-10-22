using EngEconomics

# Given
A = 10000
gPrime = 0.01
g = sqrt(1 + gPrime) - 1
n = 2
i = .18
m = 12

ic = i / m
nc = 2 * m

# Find: Amount of profit after 2 years
P = A * presentWorthConversionFactorGeometric(g, ic, nc)
