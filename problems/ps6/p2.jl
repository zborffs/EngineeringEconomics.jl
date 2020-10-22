using EngEconomics, Roots, Plots

# Given
aInit = -200000
aAnnual = 20000
aAnnualG = -5000
aLife = 5

MARR = 0.12

# Find IRR
IRR_eq(x) = aInit - 40000 * seriesPresentAmountFactor(x, 6) +  40000 / x + (20000 - 5000 * sinkingFundPaymentArithmetic(x, 5)) * seriesPresentAmountFactor(x, 5)
xVec = collect(0:0.01:1)
yVec = zeros(size(xVec))
plot(xVec, IRR_eq.(xVec))
plot!(xVec, yVec)

find_zero(IRR_eq, MARR)
