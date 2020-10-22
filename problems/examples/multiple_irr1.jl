using EngEconomics, Roots, Plots

# Given
init = -610000
annual = 200000
N = 10
salvage = -1500000

MARR = 0.1
# Determine the better alternative
NPW(x) = init + annual * seriesPresentAmountFactor(x, N) + salvage * presentWorthFactor(x, N)
xVec = collect(0:0.01:1.0)
zVec = zeros(size(xVec))

# Two irrs that are equal to zero
plot(xVec, NPW.(xVec))
plot!(xVec, zVec)
