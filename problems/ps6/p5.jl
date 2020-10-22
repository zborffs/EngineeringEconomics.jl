using EngEconomics, Roots, Plots

# Given
# Job1 = a
# Job2 = b
# Job3 = c
aInit = 100000
aAnnual = -75000
aFinal = 200000

bInit = 150000
bAnnual = -100000
bFinal = 230000

cInit = 175000
cAnnual = -150000
cFinal = 300000

MARR = 0.1
N = 3

# Find Best alternative from IRR analysis
# Step 1: Sort from smallest to biggest initial
# - X, c, b, a (where X is do nothing)
ΔCX_Init = cInit
ΔCX_Annual = cAnnual
ΔCX_Final = cFinal
ΔCX_IRR_eq(x) = ΔCX_Init * compoundAmountFactor(MARR, N) + ΔCX_Annual * uniformSeriesCompoundAmoundFactor(x, N) + ΔCX_Final

xVec = collect(0:0.01:1)
yVec = zeros(size(xVec))
plot(xVec, ΔCX_IRR_eq.(xVec))
plot!(xVec, yVec)

ΔCX_IRR = find_zero(ΔCX_IRR_eq, MARR)

if ΔCX_IRR >= MARR
	println("C")
else
	println("Do Nothing")
end

# BC
ΔBC_Init = bInit - cInit
ΔBC_Annual = bAnnual - cAnnual
ΔBC_Final = bFinal - cFinal
ΔBC_IRR_eq(x) = ΔBC_Init * compoundAmountFactor(x, N) + ΔBC_Annual * uniformSeriesCompoundAmoundFactor(MARR, N) + ΔBC_Final

plot(xVec, ΔBC_IRR_eq.(xVec))
plot!(xVec, yVec)

ΔBC_IRR = find_zero(ΔBC_IRR_eq, MARR)

if ΔBC_IRR >= MARR
	println("B")
else
	println("C")
end

# AB
ΔAB_Init = aInit - bInit
ΔAB_Annual1 = aAnnual - bAnnual
ΔAB_Final = aFinal - bFinal
ΔAB_IRR_eq(x) = ΔAB_Init * compoundAmountFactor(x, N) + ΔAB_Annual1 * uniformSeriesCompoundAmoundFactor(MARR, N) + ΔAB_Final

plot(xVec, ΔAB_IRR_eq.(xVec))
plot!(xVec, yVec)

ΔAB_IRR = find_zero(ΔAB_IRR_eq, MARR)

if ΔAB_IRR >= MARR
	println("A")
else
	println("B")
end

# If non-uniform cash flows, then use ERR
# - ERR means that if it's not an investment use the MARR rather than x
# - what this really means is, if \Delta_Job1_Job2_THINGY is negative, use x, because this is an investment so we use x
# - if \Delta_[]_[] is positive, then it is NOT an investment, so we ought to use MARR rather than x
