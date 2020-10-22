using EngEconomics

# Given
aInit = 680
bInit = 1100
aAnnualSavings = 245
bAnnualSavings = 440
aAnnualMaintenance = 35
aAnnualMaintenanceg = 10
bAnnualMaintenance = 60
aServiceLife = 4
bServiceLife = 6
aScrapValue = 100
bScrapValue = 250

# Find
# a.) Use PW Method to determine which is better
MARR = 0.1
years = 12 # Just knew b/c it's the least common multiple of 4 and 6s
aPeriods = years / aServiceLife
bPeriods = years / bServiceLife

# Product A
aMultiplicand = 1 + presentWorthFactor(MARR, aServiceLife) + presentWorthFactor(MARR, 2 * aServiceLife)
aInitPW = -aInit * aMultiplicand
aAnnualSavingsPW = aAnnualSavings *
		seriesPresentAmountFactor(MARR, years)
aAnnualMaintenancePW = -aAnnualMaintenance *
		aAnnualMaintenanceg * sinkingFundPaymentArithmetic(MARR, aServiceLife) *
		aMultiplicand
aScrapValuePW = aScrapValue *
		(presentWorthFactor(MARR, aServiceLife) +
		presentWorthFactor(MARR, 2 * aServiceLife) +
		presentWorthFactor(MARR, 3 * aServiceLife))
aPW = aInitPW + aAnnualSavingsPW + aAnnualMaintenancePW + aScrapValuePW

# Product B


if aPW > bPW
	println("CR1000 is better")
else
	println("CRX is better")
end
