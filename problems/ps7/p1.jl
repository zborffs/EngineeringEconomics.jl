using Roots, EngEconomics
n = 10

f(i) = (-3 + seriesPresentAmountFactor(i, n)) * ((4000 - 1000 * sinkingFundFactor(i, n)) / (1 - 3 * capitalRecoveryFactor(i, n))) + 1000 * presentWorthFactor(i, n) - 20000

i = find_zero(f, 0.05)


A = (4000 - 1000 * sinkingFundFactor(i, n)) / (1 - 3 * capitalRecoveryFactor(i, n))
P = 3 * A

g(x) = -P + A * seriesPresentAmountFactor(x, n) + 1000 * presentWorthFactor(x, n)
i_star = find_zero(g, 0.01)
