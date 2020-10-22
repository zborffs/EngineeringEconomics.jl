using EngEconomics, Roots

# Given
# a = parasailing
# b = kayaking
aInit = -100000
aAnnual = 15000
aN = 15

bInit = -10000
bAnnual = 2000
bN = 15
MARR = 0.10

N = aN

# Determine the better alternative
ΔInit = aInit - bInit
ΔAnnual = aAnnual - bAnnual
ΔIRR(x) = ΔInit + ΔAnnual * seriesPresentAmountFactor(x, N)
ΔIRR_ans = find_zero(ΔIRR, 0.05)

if ΔIRR_ans > MARR
	println("Choose Parasailing")
else
	println("Choose Kayaking")
end
