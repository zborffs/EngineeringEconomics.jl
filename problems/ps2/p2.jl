using Roots

# Given
P = 170000
F = 813000
n = 15

# find i
i = (F / P)^(1/n) - 1

@assert isapprox(F, P * (1 + i)^n; atol=0.01)
