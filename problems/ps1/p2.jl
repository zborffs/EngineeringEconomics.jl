using EngEconomics

# Given
ex1Quant = 1275
ex2Quant = 92
fillQuant = 260
pil2Quant = 683

ex1Lab = 1.76
ex2Lab = 27.87
fillLab = 10.18
pil1Lab = 5688
pil2Lab = 10.27

ex1Eq = 1.87
ex2Eq = 6.54
fillEq = 2.25
pil1Eq = 6420
pil2Eq = 9.61

ex1Mat = 0
ex2Mat = 0
fillMat = 0
pil1Mat = 300
pil2Mat = 54.36

# Find
# a.) Total Cost of Structure Excavation
ex2TotalCost = ex2Quant * (ex2Lab + ex2Eq + ex2Mat)

# b.) Total Tower Cost
pil1TotalCost = pil1Eq + pil1Lab + pil1Mat

# c.) Total Cost of Labor
labTotalCost = ex1Lab * ex1Quant + ex2Quant * ex2Lab + fillQuant * fillLab + pil1Lab + pil2Quant * pil2Lab

# d.) Find Costs for Installation of Pillars in 2010
costIndex2007 = 120
costIndex2010 = 138
i = costIndex2010 / costIndex2007
pil2TotalCost = pil2Quant * (pil2Lab + pil2Eq + pil2Mat)
pil1TotalCost2010 = pil2TotalCost * i

# e.) Incremental Cost of ex1 if following changes
marginalLab = 0.03
marginalEq = -0.01
ex1Incremental = ex1Quant * (marginalLab * ex1Lab + marginalEq * ex1Eq)
