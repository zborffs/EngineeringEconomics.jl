firstPayment = 3000
i = 0.12
m = 12

# (A/P, i, N)
function capitalRecoveryFactor(i, N)
	(i * (1 + i)^N) / ((i+1)^N - 1)
end

# Find: How much the guy paid the student
P = firstPayment / (1 + i/m)^(m * 1/12)
A = P * capitalRecoveryFactor(i/m, 12)
C = A * 1 / capitalRecoveryFactor(i/m, 5) + A + 1000

println("Guy paid: ", C)
