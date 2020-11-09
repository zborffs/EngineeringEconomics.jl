using EngEconomics, Roots, Plots, ColorSchemes
plotly()

# Given
# - Finedetail = A, Simplicity = B
strA = "Finedetail"
strB = "Simplicity"
lifeA = 7
lifeB = 10
PA = 200000 # Initial Cost of A - [$]
PB = 350000 # Initial Cost of B - [$]
MA = 10000 # Maintenance Cost of A - [$/yr]
UMA = 0.05 # Maintenance Cost of A - [$/units]
MB = 20000 # Maintenance Cost of B - [$/yr]
UMB = 0.01 # Maintenance Cost of B - [$/units]
LA = 1.25 # Labor Cost of A - [$/unit]
LB = 0.50 # Labor Cost of B - [$/unit]
OA = 6500 # "Other" Costs of A - [$/yr]
UOA = 0.95 # "Other" Costs of A - [$/unit]
OB = 15500 # "Other" Costs of B - [$/yr]
UOB = 0.55 # "Other" Costs of B - [$/unit]
FA = 5000 # Salvage Value of A - [$]
FB = 20000 # Salvage Value of B - [$]
MARR = 0.15

# Find
# (a.) Who is the preferred supplier if sales are 30,000 units per year? Use an
#      annual worth comparison.
unitRate = 30000 # [units/yr]
EUAWA = -PA * capitalRecoveryFactor(MARR, lifeA) + -MA + -UMA * unitRate + -LA * unitRate + -OA + -UOA * unitRate + FA * sinkingFundFactor(MARR, lifeA)
EUAWB = -PB * capitalRecoveryFactor(MARR, lifeB) + -MB + -UMB * unitRate + -LB * unitRate + -OB + -UOB * unitRate + FB * sinkingFundFactor(MARR, lifeB)

if EUAWA > EUAWB
	println(strA, " is the preferred supplier if unit sales are ", unitRate, " because its EUAW exceeds that of ", strB)
else
	println(strB, " is the preferred supplier if unit sales are ", unitRate, " because its EUAW exceeds that of ", strA)
end

# (b.) Who is the preferred supplier if sales are 200,000 units per year. Use
#      annual worth comparison
unitRate = 200000 # [units/yr]
EUAWA = -PA * capitalRecoveryFactor(MARR, lifeA) + -MA + -UMA * unitRate + -LA * unitRate + -OA + -UOA * unitRate + FA * sinkingFundFactor(MARR, lifeA)
EUAWB = -PB * capitalRecoveryFactor(MARR, lifeB) + -MB + -UMB * unitRate + -LB * unitRate + -OB + -UOB * unitRate + FB * sinkingFundFactor(MARR, lifeB)

if EUAWA > EUAWB
	println(strA, " is the preferred supplier if unit sales are ", unitRate, " because its EUAW exceeds that of ", strB)
else
	println(strB, " is the preferred supplier if unit sales are ", unitRate, " because its EUAW exceeds that of ", strA)
end

# (c.) How sensitive is the choice of supplier to sales level? Experiment with
#      sales levels between 30,000 and 200,000 units per year. At what sales
#      level will the costs of the two melters be equal?
unitRateVector = collect(30000:1000:200000)
EUAWA = -PA * capitalRecoveryFactor(MARR, lifeA) .+ -MA .+ -UMA * unitRateVector .+ -LA * unitRateVector .+ -OA .+ -UOA * unitRateVector .+ FA * sinkingFundFactor(MARR, lifeA)
EUAWB = -PB * capitalRecoveryFactor(MARR, lifeB) .+ -MB .+ -UMB * unitRateVector .+ -LB * unitRateVector .+ -OB .+ -UOB * unitRateVector .+ FB * sinkingFundFactor(MARR, lifeB)

plot(unitRateVector, EUAWA, xlabel="Units", ylabel="Annual Worth (\$)", label=strA,
	title="Sensitivity of Alternatives to Unit Sales", legend=:outerbottomright)
plot!(unitRateVector, EUAWB, label=strB)

EUAWA_func(u) = -PA * capitalRecoveryFactor(MARR, lifeA) .+ -MA .+ -UMA * u .+ -LA * u .+ -OA .+ -UOA * u .+ FA * sinkingFundFactor(MARR, lifeA)
EUAWB_func(u) = -PB * capitalRecoveryFactor(MARR, lifeB) .+ -MB .+ -UMB * u .+ -LB * u .+ -OB .+ -UOB * u .+ FB * sinkingFundFactor(MARR, lifeB)
f(u) = EUAWA_func(u) - EUAWB_func(u)
unitBreakEven = find_zero(f, 34000)

println("The annual worths of both alternatives are sensitive to the unit sales rate.")
println("The breakeven unit sales rate is: ", unitBreakEven)
println("From the plot, we understand that if sales are below the breakeven unit sales rate, then Finedetail is preferred. However, if the unit sales rate exceeds the breakeven unit sales rate, then simplicity is preferred")
