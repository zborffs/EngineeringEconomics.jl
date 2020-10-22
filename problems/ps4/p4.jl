using EngEconomics

# Given
aInit = 1700
bInit = 2100
cInit = 3750
aAnnualBenefit = 1000
bAnnualBenefit = 1000
cAnnualBenefit = 1000
aLife = 2
bLife = 3
cLife = 6
i = 0.08

# Find: Present Worth Value of each Item then pick the best option
# Start by determining the number of periods for each product
years = 6
aPeriods = years / aLife
bPeriods = years / bLife
cPeriods = years / cLife

# Next, determine the present worth of product A
aInitPW = -aInit * (1 + presentWorthFactor(i, aLife) + presentWorthFactor(i, 2 * aLife))
aAnnualBenefitPW = (aAnnualBenefit * seriesPresentAmountFactor(i, aLife)) * (1 + presentWorthFactor(i, aLife) + presentWorthFactor(i, 2 * aLife))
aPW = aInitPW + aAnnualBenefitPW

# Determine PW of Product B
bInitPW = -bInit * (1 + presentWorthFactor(i, bLife))
bAnnualBenefitPW = (bAnnualBenefit * seriesPresentAmountFactor(i, bLife)) * (1 + presentWorthFactor(i, bLife))
bPW = bInitPW + bAnnualBenefitPW

# Determine PW of Product C
cInitPW = -cInit * (1)
cAnnualBenefitPW = (cAnnualBenefit * seriesPresentAmountFactor(i, cLife)) * (1)
cPW = cInitPW + cAnnualBenefitPW

# Compare Alternatives, pick the greatest one
maxPW = max(aPW, bPW, cPW)

if maxPW == aPW
	println("Pick A")
elseif maxPW == bPW
	println("Pick B")
else
	println("Pick C")
end
