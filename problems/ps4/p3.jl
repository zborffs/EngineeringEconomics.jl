using EngEconomics

# Given
i = 0.1
xInit = 12500
yInit = 8900
xAnnualBenefit = 6800
yAnnualBenefit = 2000
xSalvage = 5000
ySalvage = 8900
xLife = 2
yLife = 3

# Find: Present Worth Analysis of Both

# Determine the least common multiple of xLife and yLife to figure out how many
# times we have to repeat the PW Analysis
years = 6
xTimes = years / xLife
yTimes = years / yLife

# Determine Product X's PW
xInitPW = -xInit * (1 + presentWorthFactor(i, xLife) + presentWorthFactor(i, 2 * xLife))
xAnnualBenefitPW = (xAnnualBenefit * seriesPresentAmountFactor(i, xLife)) * (1 + presentWorthFactor(i, xLife) + presentWorthFactor(i, 2 * xLife))
xSalvagePW = xSalvage * (presentWorthFactor(i, xLife) + presentWorthFactor(i, 2 * xLife) + presentWorthFactor(i, 3 * xLife))
xPW = xInitPW + xAnnualBenefitPW + xSalvagePW

# Determine Product Y's PW
yInitPW = -yInit * (1 + presentWorthFactor(i, yLife))
yAnnualBenefitPW = (yAnnualBenefit * seriesPresentAmountFactor(i, yLife)) * (1 + presentWorthFactor(i, yLife))
ySalvagePW = ySalvage * (presentWorthFactor(i, yLife) + presentWorthFactor(i, 2 * yLife))
yPW = yInitPW + yAnnualBenefitPW + ySalvagePW

# Determine which product is better by comparing they're present value
if xPW > yPW
	println("Pick Product X")
else
	println("Pick Product Y")
end
