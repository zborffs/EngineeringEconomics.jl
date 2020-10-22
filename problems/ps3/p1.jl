using EngEconomics

# Given
# Both
i = 0.08
# Option 1: Get 100,000 -> 120,000 -> 140,000 etc.
n = 30
A = 100000
G = 10000

totalOption1 = G * singlePaymentPresentWorthArithmetic(i, n) + A * seriesPresentAmountFactor(i, n)
totalOption2 = 2500000

if totalOption1 > totalOption2
	println("Don\'t take the money from Gill")
else
	println("Take the money from Gill")
end
