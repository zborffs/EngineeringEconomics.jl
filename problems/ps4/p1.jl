using EngEconomics

# Given
xInit = 120000
yInit = 96000
xBenefits1 = (11000, 10)
xBenefits2 = (9000, 20)
yBenefits = (12000, 20)
xSalvage = 40000
ySalvage = 20000
MARR = 0.08
N = 20

# Find Present Worth Method Better Option
xInitPW = -xInit
xBenefitsPW = xBenefits1[1] * seriesPresentAmountFactor(MARR, xBenefits1[2]) +
				xBenefits2[1] * seriesPresentAmountFactor(MARR, xBenefits2[2])
xSalvagePW = xSalvage * presentWorthFactor(MARR, N)
xPW = xInitPW + xBenefitsPW + xSalvagePW

yInitPW = -yInit
yBenefitsPW = yBenefits[1] * seriesPresentAmountFactor(MARR, yBenefits[2])
ySalvagePW = ySalvage * presentWorthFactor(MARR, N)
yPW = yInitPW + yBenefitsPW + ySalvagePW

if xPW > yPW
	println("X is better")
else
	println("Y is better")
end
