using EngEconomics, Roots, Plots

# Given
aInit = -350
aAnnual = -90
aLife = 10

bInit = -120
bAnnual = -100
bLife = 4

MARR = 0.05

# Find IRR
ΔInit_eq(x) = aInit * (1 + presentWorthFactor(x, aLife)) - bInit * (1 + presentWorthFactor(x, bLife) + presentWorthFactor(x, 2 * bLife) + presentWorthFactor(x, 3 * bLife) + presentWorthFactor(x, 4 * bLife))
ΔAnnual_eq(x) = aAnnual - bAnnual
IRR_eq(x) = ΔInit_eq(x) + ΔAnnual_eq(x) * seriesPresentAmountFactor(x, 20)
xVec = collect(0:0.01:1)
yVec = zeros(size(xVec))
plot(xVec, IRR_eq.(xVec))
plot!(xVec, yVec)

find_zero(IRR_eq, MARR)
