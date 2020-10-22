using Unitful, UnitfulAstro

# Given
sellingPrice = 167 # Dollars
materialsAndParts = 25 # Dollars per unit
directLabor = 2 * 20
fixedCost = 1400000

# Find
# a.) overhead expenses are charged at
overheadExpenses = 0.8 * directLabor
totalManufacturingCost = materialsAndParts + directLabor + overheadExpenses

# b.) Breakeven
m = sellingPrice - totalManufacturingCost
b = -fixedCost
x = -b / m

# c.) Profit/unit
units = 30000
y = m * units + b
profitPerUnit = y / units

# d.)
x = 15000 # when y = 0, what should
P = -b / x + totalManufacturingCost
