using EngEconomics, Roots

# Given
# A = Landfill
# B = Ship
aInit = -1000000
aFinal = -100000
aLife = 30
aAnnual_Last20 = 30000
aAnnual_First10 = -20000 - aAnnual_Last20


bAnnual = -130000

MARR = 0.11

# Determine Annual Worth Method
aAW = (aInit + aAnnual_First10 * capitalRecoveryFactor(MARR, 10)) * capitalRecoveryFactor(MARR, aLife) +  aAnnual_Last20 + aLife * sinkingFundFactor(MARR, aLife)
bAW = bAnnual

if aAW >= bAW
	println("A")
else
	println("B")
end
