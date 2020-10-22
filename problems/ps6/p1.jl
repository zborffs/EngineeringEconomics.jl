using EngEconomics, Roots, Plots

# Given
aPW = 56740
aLife = 5
aInit = -180000
MARR = 0.10
# Equal cash flows at the end of each year

# Find
aAnnual = (aPW - aInit) / seriesPresentAmountFactor(MARR, aLife)

IRR_eq(x) = aInit + aAnnual * seriesPresentAmountFactor(x, aLife)

xVec = collect(0:0.01:1.0)
yVec = zeros(size(xVec))
plot(xVec, IRR_eq.(xVec))
plot!(xVec, yVec)
irr = find_zero(IRR_eq, 0.12)
