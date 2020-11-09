using EngEconomics, Roots, Plots

# Given
aInit = -9000
aAnnual = 5600
aScrap = 1000
aLife = 2

bInit = -5700
bAnnual = 2100
bScrap = 2700
bLife = 3

cInit = -4800
cAnnual = 1200
cScrap = 0
# cLife = infinity

MARR = 0.05

# Find
aAW = aInit * capitalRecoveryFactor(MARR, aLife) + aAnnual + aScrap * sinkingFundFactor(MARR, aLife)
bAW = bInit * capitalRecoveryFactor(MARR, bLife) + bAnnual + bScrap * sinkingFundFactor(MARR, bLife)
cAW = cInit * MARR + cAnnual
