using EngEconomics, Roots

# Given
aInit = -200000
aAnnual = 30000
aScrap = 45000
aLife = 20

bInit = -180000
bAnnual = 24000
bScrap = 20000
bLife = 15

MARR = 0.09

# Find Annual Worth Analysis
aAW = aInit * capitalRecoveryFactor(MARR, aLife) + aAnnual + aScrap * sinkingFundFactor(MARR, aLife)

bAW = bInit * capitalRecoveryFactor(MARR, bLife) + bAnnual + bScrap * sinkingFundFactor(MARR, bLife)

if aAW > bAW
	println("A")
else
	println("B")
end
