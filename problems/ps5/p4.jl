using EngEconomics, Roots

# Given
MARR = 0.08

aInit = -45000
aAnnual = -10000 + 18000
aScrap = 3000
aLife = 5

bInit = -25000
bAnnual = -4000 + 13000
bScrap = 6000
bLife = 5

cInit = -20000
cAnnual = -1900 + 9000
cScrap = 4600
cLife = 5

# AW
aAW = aInit * capitalRecoveryFactor(MARR, aLife) + aAnnual + aScrap * sinkingFundFactor(MARR, aLife)
bAW = bInit * capitalRecoveryFactor(MARR, bLife) + bAnnual + bScrap * sinkingFundFactor(MARR, bLife)
cAW = cInit * capitalRecoveryFactor(MARR, cLife) + cAnnual + cScrap * sinkingFundFactor(MARR, cLife)
