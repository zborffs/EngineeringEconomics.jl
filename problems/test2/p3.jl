using EngEconomics, Roots, Plots

# Given
aString = "Buy New Forklift"
aInit = -100000
aAnnual = 0
aLife = 5
aScrap = 20000

bString = "Rent Forklift"
bInit = 0
bAnnual = -20000
bLife = 5

cString = "Buy Used Forklift"
cInit = -50000
cSalvage = 0
cLife = 5
cAnnual = -5000
cAnnualG = -1000

allRevenue = 30000

MARR = 0.08

# Find
# - BC
IRR_A_eq(x) = aInit + allRevenue * seriesPresentAmountFactor(x, aLife) + aScrap * presentWorthFactor(x, aLife)
find_zero(IRR_A_eq, MARR)

IRR_B_eq(x) = (bAnnual + allRevenue) * seriesPresentAmountFactor(x, bLife)
find_zero(IRR_B_eq, MARR)

IRR_C_eq(x) = cInit + (allRevenue + cAnnual + cAnnualG * sinkingFundPaymentArithmetic(x, cLife)) * seriesPresentAmountFactor(x, cLife)
find_zero(IRR_C_eq, MARR)


# CB
ΔCB_Init = cInit - bInit
ΔCB_Scrap = cScrap - bScrap
ΔCB_Annual_eq(x) = cAnnual + cAnnualG * sinkingFundPaymentArithmetic(x, cLife) - bAnnual
ΔCB_IRR_eq(x) = ΔCB_Init + ΔCB_Scrap * presentWorthFactor(x, aLife) + ΔCB_Annual_eq(x) * seriesPresentAmountFactor(x, aLife)
xVec = collect(0:0.01:1)
yVec = zeros(size(xVec))
plot(xVec, ΔCB_IRR_eq.(xVec))
plot!(xVec, yVec)

find_zero(ΔCB_IRR_eq, MARR)

# AC
ΔAC_Init = aInit - cInit
ΔAC_Scrap = aScrap - cScrap
ΔAC_Annual_eq(x) = aAnnual - (cAnnual + cAnnualG * sinkingFundPaymentArithmetic(x, cLife))
ΔAC_IRR_eq(x) = ΔAC_Init + ΔAC_Scrap * presentWorthFactor(x, aLife) + ΔAC_Annual_eq(x) * seriesPresentAmountFactor(x, aLife)

plot(xVec, ΔAC_IRR_eq.(xVec))
plot!(xVec, yVec)

find_zero(ΔCB_IRR_eq, MARR)
