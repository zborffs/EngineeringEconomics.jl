using Roots, EngEconomics

f(x) = 100 + 75 * sinkingFundPaymentArithmetic(x, 4) - 700 * capitalRecoveryFactor(x, 4)

find_zero(f, 5)
