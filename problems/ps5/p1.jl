using EngEconomics, Roots

# Given
aInit = -1500000
aAnnual = 900000 - 600000
aScrap = 100000
aLife = 5

bInit = -2000000
bAnnual = 1100000 - 800000
bScrap = 200000
bLife = 10

MARR = 0.08

# Find Annual Worth
aAW = aInit * capitalRecoveryFactor(MARR, aLife) + aAnnual + aScrap * sinkingFundFactor(MARR, aLife)
bAW = bInit * capitalRecoveryFactor(MARR, bLife) + bAnnual + bScrap * sinkingFundFactor(MARR, bLife)

if aAW >= 0 && bAW >= 0
	println("Both")
elseif aAW >= 0
	println("A")
elseif bAW >= 0
	println("B")
else
	println("Neither")
end

# Find Present Worth
aPW = aInit + aAnnual * seriesPresentAmountFactor(MARR, aLife) + aScrap * presentWorthFactor(MARR, aLife)
bPW = bInit + bAnnual * seriesPresentAmountFactor(MARR, bLife) + bScrap * presentWorthFactor(MARR, bLife)

if aPW >= 0 && bPW >= 0
	println("Both")
elseif aPW >= 0
	println("A")
elseif bPW >= 0
	println("B")
else
	println("Neither")
end

# Payback Period
# - FirstCost / AnnualSavings
aPP = -aInit / aAnnual
bPP = -bInit / bAnnual
minPP = 3

if aPP <= minPP && bPP <= minPP
	println("Both")
elseif aPP <= minPP
	println("A")
elseif bPP <= minPP
	println("B")
else
	println("Neither")
end
