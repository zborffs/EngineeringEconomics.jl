using Roots, EngEconomics

# Given
A_InitCost = -10000
A_AnnualSavings = 3000
B_InitCost = -13500
B_AnnualSavings = 3000
B_AnnualSavingsGradient = 500
MARR = 0.06
N = 5

# Choose
ΔInitCost = B_InitCost - A_InitCost
ΔAnnualCost(x) = B_AnnualSavings + B_AnnualSavingsGradient * singlePaymentPresentWorthArithmetic(x, N) - A_AnnualSavings
ΔIRR(x) = ΔInitCost + ΔAnnualCost(x)
ΔIRR_ans = find_zero(ΔIRR, 0.05)

println("ΔIRR > MARR ==> Alternative B is better")
