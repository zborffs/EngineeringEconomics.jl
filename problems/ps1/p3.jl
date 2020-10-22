using EngEconomics


function learningCurveModel(T_init, N, b)
	return T_init * N^b
end

function learningCurveModelCoeff(T1, N1, T2, N2)
	b = log(T1 / T2) / log(N1 / N2)
end

function learningCurvePercentage(b)
	return exp(b * log(2))
end

# Given
avgLaborCost = 20 # $/hr
prodTimeUnit1 = 10 # hrs
prodTimeUnit4 = 8.1 # hrs
overheadExpenses = 1.0 * avgLaborCost # Dollars / hr

# Find
# a.) Learning Curve Model
Tinit = prodTimeUnit1
T4 = prodTimeUnit4
b = log(T4 / Tinit) / log(4 / 1)
percentage = exp(b * log(2))
b = learningCurveModelCoeff(Tinit, 1, T4, 4)
percentage = learningCurvePercentage(b)
