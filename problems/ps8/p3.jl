using EngEconomics, Roots, Plots, ColorSchemes
plotly()

uwEngColorScheme = ColorScheme([parse(Colorant, "#D0B4E7"), parse(Colorant, "#57058B"), parse(Colorant, "#8100B4"), parse(Colorant, "#000000")])

# Given
n = 5
timeDelay = 3
A = 10
G = 1
MARR = 0.15
sensitivity = [0.85, 0.925, 1.0, 1.075, 1.15]

# Find
# Construct a sensitivity graph for the interest rate:
NPW_interest = (A .+ G * sinkingFundPaymentArithmetic.(MARR * sensitivity, n + 1)) .* uniformSeriesCompoundAmoundFactor.(MARR * sensitivity, (n + 1)) .* presentWorthFactor.(MARR * sensitivity, n + timeDelay)
plot(sensitivity, NPW_interest, label="Interest", legend=:outerbottomright,
	xlabel="Sensitivity (+/- 7.5%, 15%)",
	ylabel="Net Present Worth (\$1000)",
	title="Sensitivity of Interest Rate, Base Savings,<br> and Saving Gradient",
	palette=cgrad(uwEngColorScheme))

# Construct a sensitivity graph for the base savings
NPW_baseSavings = (A * sensitivity .+ G * sinkingFundPaymentArithmetic.(MARR, n + 1)) .* uniformSeriesCompoundAmoundFactor.(MARR, n + 1) .* presentWorthFactor.(MARR, n + timeDelay)
plot!(sensitivity, NPW_baseSavings, label="Base Savings")

# Construct a sensitivity graph for the savings gradient
NPW_gradientSavings = (A .+ G * sensitivity * sinkingFundPaymentArithmetic.(MARR, n + 1)) .* uniformSeriesCompoundAmoundFactor.(MARR, n + 1) .* presentWorthFactor.(MARR, n + timeDelay)
plot!(sensitivity, NPW_gradientSavings, label="Gradient Savings")
