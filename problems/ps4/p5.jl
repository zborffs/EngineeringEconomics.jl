using EngEconomics

# Given
xInit = 80000
xMaintenance = 30000
xSalvage = 40000
yInit = 97000
yMaintenance = 27000
ySalvage = 50000
i = 0.15
N = 3 # years

# Find: The Future Worth Analysis
# Determine Alternatives
option1Init = xInit * 2
option2Init = yInit * 2
option3Init = xInit + yInit
option1Maintenance = xMaintenance * 2
option2Maintenance = yMaintenance * 2
option3Maintenance = xMaintenance + yMaintenance
option1Salvage = 2 * xSalvage
option2Salvage = 2 * ySalvage
option3Salvage = xSalvage + ySalvage

# Determine the FW of Option1
option1InitFW = -option1Init * compoundAmountFactor(i, N)
option1MaintenanceFW = -option1Maintenance * uniformSeriesCompoundAmoundFactor(i, N)
option1SalvageFW = option1Salvage
option1FW = option1InitFW + option1MaintenanceFW + option1SalvageFW

# Determine the FW of Option2
option2InitFW = -option2Init * compoundAmountFactor(i, N)
option2MaintenanceFW = -option2Maintenance * uniformSeriesCompoundAmoundFactor(i, N)
option2SalvageFW = option2Salvage
option2FW = option2InitFW + option2MaintenanceFW + option2SalvageFW

# Determine the FW of Option3
option3InitFW = -option3Init * compoundAmountFactor(i, N)
option3MaintenanceFW = -option3Maintenance * uniformSeriesCompoundAmoundFactor(i, N)
option3SalvageFW = option3Salvage
option3FW = option3InitFW + option3MaintenanceFW + option3SalvageFW

# Pick the Better one
maxOption = max(option1FW, option2FW, option3FW)

if maxOption == option1FW
	println("Pick XX")
elseif maxOption == option2FW
	println("Pick YY")
else
	println("Pick XY")
end
