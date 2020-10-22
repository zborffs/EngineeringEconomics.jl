using EngEconomics

# Given
# 12 months
# month1 - 15000 cost
# g = 5% per month
# grant is received in 6 monthy installments starting at month 2
# i = 12%

n = 1
m = 12
i = 0.12
nc = n * m
ic = i / m
Ac = 15000
g = 0.05
F = Ac * presentWorthConversionFactorGeometric(g, ic, nc) * compoundAmountFactor(ic, nc)
Ag = F * capitalRecoveryFactor(ic, 6)
