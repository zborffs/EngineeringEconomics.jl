using EngEconomics

# Given
aInit = 2000
aLife = 2
aSalvage = 0
aAnnualSavings = 1200
bInit = 4000
bLife = 3
bSalvage = 3000
bAnnualSavingA = 2000
bAnnualSavingsG = -200
cInit = 5000
cLife = 6
cSalvage = 1000
cAnnualSavingsA = 1400
cAnnualSavingsg = 0.05
i = 0.07

# Find
years = 6
aPeriods = years / aLife
bPeriods = years / bLife
cPeriods = years / cLife

# Device A
aInitPW = -aInit * (1 + presentWorthFactor(i, aLife) + presentWorthFactor(i, 2 * aLife))
aAnnualBenefitPW = (aAnnualBenefit * seriesPresentAmountFactor(i, aLife)) * (1 + presentWorthFactor(i, aLife) + presentWorthFactor(i, 2 * aLife))
aSalvagePW = 0
aPW = aInitPW + aAnnualBenefitPW + aSalvagePW

bInitPW = -bInit * (1 + presentWorthFactor(i, bLife))
bAnnualBenefitPW = (bAnnualSavings * seriesPresentAmountFactor(i, bLife) + bAnnualSavingsG * singlePaymentPresentWorthArithmetic(i, bLife)) * (1 + presentWorthFactor(i, bLife))
bSalvagePW = bSalvage * (presentWorthFactor(i, bLife) + presentWorthFactor(i, 2 * bLife))
bPW = bInitPW + bAnnualBenefitPW + bSalvagePW

cInitPW = -cInit
cAnnualBenefitPW = (cAnnualSavingsA * presentWorthConversionFactorGeometric(cAnnualSavingsg, i, cLife))
cSalvagePW = cSalvage * presentWorthFactor(i, cLife)
cPW = cInitPW + cAnnualBenefitPW + cSalvagePW

newBSalvage = (cPW - bInitPW + bAnnualBenefitPW) / (presentWorthFactor(i, bLife) + presentWorthFactor(i, 2 * bLife))
