using EngEconomics

function benefitCostRatio(EUAB, EUAC)
	if EUAB / EUAC >= 1.0
		println("Acceptable")
	end

	return EUAB / EUAC
end

P = 2000000
A1 = 100000
A2 = 820000
A3 = 400000
n = 20
i = 0.08

costs = P * capitalRecoveryFactor(i, n)
benefits = A2
disbenefits = A3
O_AND_M_Costs = A1

EUAB = benefits - disbenefits - O_AND_M_Costs
EUAC = costs

bcRatio = benefitCostRatio(EUAB, EUAC)
