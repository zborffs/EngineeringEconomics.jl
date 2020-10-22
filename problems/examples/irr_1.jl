using Roots, EngEconomics

# Given
MARR = 0.06
A_Init = -1000
A_Year = 1500
B_Init = -2000
B_Year = 2800

# Find the better option using Incremental ROR
ΔInit = B_Init - A_Init
ΔYear = B_Year - A_Year
ΔIRR(x) = ΔInit + presentWorthFactor(x, 1) * ΔYear
ΔIRR_ans = find_zero(ΔIRR, 0.05)

# Because ΔIRR_ans > MARR, the second alternative, B, is better
println("Choose Alt. 2")
