using EngEconomics

costA = 15000
omA = 55
benefitA = 450
costB = 10000
omB = 35
benefitB = 200
n = 30
i = 0.05

# Consider do nothing option and pick best from b/c analysis
# 1.) Rank options by smallest initial cost to biggest initial cost
#     (1) B
#     (2) A
# 2.) Compare 1 and 2
ΔEUAB_21 = (benefitB - benefitA) - (omB - omA)
ΔEUAC_21 = (costB - costA) * capitalRecoveryFactor(i, n)

ΔBCRatio_21 = ΔEUAB_21 / ΔEUAC_21

if ΔBCRatio_21 >= 1
	println("Pick the one with the bigger initial cost, i.e. B")
else
	println("Pick the one with the smaller initial cost, i.e. Do Nothing")
end

disbenefitA = 400
disbenefitB = 500

ΔEUAB_21 = (benefitB - benefitA) - (omB - omA) - (disbenefitB - disbenefitA)
ΔEUAC_21 = (costB - costA) * capitalRecoveryFactor(i, n)

ΔBCRatio_21 = ΔEUAB_21 / ΔEUAC_21

if ΔBCRatio_21 >= 1
	println("Pick the one with the bigger initial cost, i.e. B")
else
	println("Pick the one with the smaller initial cost, i.e. Do Nothing")
end
