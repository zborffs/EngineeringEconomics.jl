using EngEconomics, Plots, ColorSchemes, Colors
plotly()


uwEngColorScheme = ColorScheme([parse(Colorant, "#D0B4E7"), parse(Colorant, "#FFFFFF"), parse(Colorant, "#57058B"), parse(Colorant, "#8100B4")])

F = 50
A_base = 7
i_base = 0.10
sensitivityVector = [.90, 0.95, 1.0, 1.05, 1.10]

baseN = log(F / A_base * i_base + 1) / log(1 + i_base)

N_annualSavings = log.(F ./ (A_base .* sensitivityVector) .* i_base .+ 1) ./ log(1 + i_base)
N_interestRate  = log.(F / A_base .* (sensitivityVector * i_base) .+ 1) ./ log.(1 .+ (i_base .* sensitivityVector))

plot(sensitivityVector, N_annualSavings, label="Annual Savings Sensitivity",
	xlabel="Sensitivity (+/- 5%, 10%)", ylabel="Number of Years",
	palette=cgrad(uwEngColorScheme))
plot!(sensitivityVector, N_interestRate, label="Interest Rate Sensitivity")
