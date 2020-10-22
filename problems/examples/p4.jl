using Roots, EngEconomics

# Given
A1 = 9000
N1 = 4
N2 = 5
i = 0.05

# Find
A2 = A1 * N1 * capitalRecoveryFactor(i, N2)
NPWi(x) = A1 + A1 * seriesPresentAmountFactor(x, N1 - 1) - A2 * seriesPresentAmountFactor(x, N2) * presentWorthFactor(x, 4)
find_zero(NPWi, 0.05)
