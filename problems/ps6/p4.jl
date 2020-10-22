using EngEconomics, Roots, Plots

# Given
aString = "Buy Machine"
aInit = -65000
aAnnual = 0
aScrap = 10000
aLife = 6

bString = "Contract with a Packaging Supplier"
bInit = 0
bAnnual = -15000
bScrap = 0
bLife = 6

cString = "Buy Used Machine"
cInit = -30000
cAnnual = -3000
cAnnualG = -2500
cScrap = 0
cLife = 6

allInstall = -6000
allRev = 20000

MARR = 0.10
N = 6

# Determine IRR
# Step 1: Rank from lowest to highest initial
# - B, C, A
# Step 2: Start with C-B Comparison; if IRR > MARR, then choose C, otherwise B
ΔCB_Init = cInit - bInit
ΔCB_Scrap = cScrap - bScrap
ΔCB_Annual_eq(x) = cAnnual + cAnnualG * sinkingFundPaymentArithmetic(x, N) - bAnnual
ΔCB_IRR_eq(x) = ΔCB_Init + ΔCB_Scrap * presentWorthFactor(x, N) + ΔCB_Annual_eq(x) * seriesPresentAmountFactor(x, N)
xVec = collect(0:0.01:1)
yVec = zeros(size(xVec))
plot(xVec, ΔCB_IRR_eq.(xVec))
plot!(xVec, yVec)

ΔCB_IRR_val = find_zero(ΔCB_IRR_eq, MARR)

if ΔCB_IRR_val >= MARR
	println("Choose C")
else
	println("Choose B")
end

# Now do the A-B analysis; if IRR > MARR, choose A, otherwise B
ΔAB_Init = aInit - bInit
ΔAB_Scrap = aScrap - bScrap
ΔAB_Annual_eq(x) = aAnnual - bAnnual
ΔAB_IRR_eq(x) = ΔAB_Init + ΔAB_Scrap * presentWorthFactor(x, N) + ΔAB_Annual_eq(x) * seriesPresentAmountFactor(x, N)
xVec = collect(0:0.01:1)
yVec = zeros(size(xVec))
plot(xVec, ΔAB_IRR_eq.(xVec))
plot!(xVec, yVec)

find_zero(ΔAB_IRR_eq, MARR)
