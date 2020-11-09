using EngEconomics, Roots, Plots, ColorSchemes
plotly()

# Given
constructionYears = 5 # Construction takes this many years
constructionStarts = 5 # Construction starts in this many years
constructionA = 20000 # Construction annual cost in $1000, so if this number is 20,000, the real price is 20,000,000
maintenanceStarts = 1 + constructionYears + constructionStarts # Number of years when maintenance for the project will begin. It is simply the sum of how long construction will take and when construction starts plus 1 year
maintenanceA = 2000 # Maintenance annual cost in $1000, so if this number is 2,000, then the real price is 2,000,000
inflationRate = 0.03 # Inflation rate
MARR = 0.07 # Project's MARR
projectLifeTime = 30 # I did this in my head (starts working in 2020, supposed to last till 2050)

# Find
# (a.) The present worth of the project
realMARR = (1 + MARR) / (1 + inflationRate) - 1
NPW = (-constructionA * seriesPresentAmountFactor(realMARR, constructionYears)) * presentWorthFactor(realMARR, constructionStarts) + (-maintenanceA * seriesPresentAmountFactor(realMARR, projectLifeTime)) * presentWorthFactor(realMARR, constructionYears + constructionStarts)

# (b.) Construct a sensitivity graph showing the effects of 5 percent and 10
#      percent increases and decreases in the construction costs, maintenance
#      costs and inflation rate. To which is the present worth most sensitive?
sensitivity = [0.9, 0.95, 1.0, 1.05, 1.1]

# Construction Costs
realMARR = (1 + MARR) / (1 + inflationRate) - 1
NPW_constructionCost = (-constructionA * sensitivity * seriesPresentAmountFactor(realMARR, constructionYears)) * presentWorthFactor(realMARR, constructionStarts) .+ (-maintenanceA * seriesPresentAmountFactor(realMARR, projectLifeTime)) * presentWorthFactor(realMARR, constructionYears + constructionStarts)
plot(sensitivity, NPW_constructionCost)

# Maintenance Costs
realMARR = (1 + MARR) / (1 + inflationRate) - 1
NPW_maintenanceCost = (-constructionA * seriesPresentAmountFactor(realMARR, constructionYears)) * presentWorthFactor(realMARR, constructionStarts) .+ (-maintenanceA * sensitivity * seriesPresentAmountFactor(realMARR, projectLifeTime)) * presentWorthFactor(realMARR, constructionYears + constructionStarts)
plot!(sensitivity, NPW_maintenanceCost)

# Inflation Rate
realMARR_inflationRate = (1 + MARR) ./ (1 .+ sensitivity * inflationRate) .- 1
NPW_inflationRate = (-constructionA * seriesPresentAmountFactor.(realMARR_inflationRate, constructionYears)) .* presentWorthFactor.(realMARR_inflationRate, constructionStarts) .+ (-maintenanceA * seriesPresentAmountFactor.(realMARR_inflationRate, projectLifeTime)) .* presentWorthFactor.(realMARR_inflationRate, constructionYears + constructionStarts)
plot!(sensitivity, NPW_inflationRate)

println("From the plot, it\'s clear that the NPW cost is most sensitive to the initial construction cost because the slope of that line is much bigger than that of the other lines")
