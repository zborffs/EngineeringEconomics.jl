using EngEconomics

# Given
# Option 1: 1,500,000 install; 200,000 every 10 years; i=0.05; lifespan = infinite
installation = 1500000
A = 200000
i = 0.05
ic = (1 + i)^(1 * 10)-1
N = 10
P = installation + A / ic
