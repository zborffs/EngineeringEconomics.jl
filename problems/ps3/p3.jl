using EngEconomics

# Given
B = 5000
i = 0.015
A = B * i
ieq = 0.08 / 4
C = A + A * seriesPresentAmountFactor(ieq, 25) + B * presentWorthFactor(ieq, 25)
