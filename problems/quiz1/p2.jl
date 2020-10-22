using EngEconomics

# Given
i = 0.08
N = 20
g = 0.05
A1 = 1000
A_13_20 = 2000
m = 12

# Find.
# How much should be invested now so that the interest pays after all this can
# pay off everything?

# First Find ic
ic = i / m
Nc = 20

# First figure out how much in total this guy owes in present money
owe = (A1 * presentWorthConversionFactorGeometric(g, ic, 11) + A_13_20 * seriesPresentAmountFactor(ic, 8) * presentWorthFactor(ic, 11))
payNow = owe * presentWorthFactor(ic, 1)
