PJane = 25000
PJoe = 40000
P = PJane + PJoe
i = 0.1
m = 1
N = 6
iJane = 0.09

F = P * (1 + i / m)^(N * m)

iJoe = ((F - PJane * (1 + i)^N) / PJoe)^(1/N) - 1
