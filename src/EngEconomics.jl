module EngEconomics

using Dates

export simpleInterest, findFractionalPeriod

# Simple Interest (F = P(1 + i x n))
# F = Future amount
# P = Principal amount
# i = simple interest rate
# n = period of time
function simpleInterest(P::Number, i::Number, n::Number)::Number
	F = P * (1 + i * n)
end

# Find Fraction Period (360 days a year, 12 months, 60 days)
function findFractionalPeriod(date1::Date, date2::Date)::Number
	monthDays = 30 * (Dates.month(date2) - Dates.month(date1))
	d = Dates.day(date2) - Dates.day(date1) + 1
	return (monthDays + d) / 360
end


export learningCurveModel, learningCurveModelCoeff, learningCurvePercentage
function learningCurveModel(T_init, N, b)
	return T_init * N^b
end

function learningCurveModelCoeff(T1, N1, T2, N2)
	b = log(T1 / T2) / log(N1 / N2)
end

function learningCurvePercentage(b)
	return exp(b * log(2))
end


export compoundAmountFactor, presentWorthFactor
# Compound Amount Factor: (F/P, i, N)
# - gives future amount, F, that is equivalent to a present amount, P, when the
#   interest rate is i, and the number of periods is N
# - How much money will be in the bank after 15 years if we invest 100 dollars
#   now at 8% interest compounded semi-annually
function compoundAmountFactor(i, N)
	(1 + i)^N
end

# Present Worth Factor: (P/F, i, N)
# - gives the present amount, P, that is equivalent to the future amount, F,
#   when the interest rate is i, and the number of periods is N
# - How much should be invested now so that in 4 years we will have 1360.5
#   dollars in the bank if the interest rate is 8%
function presentWorthFactor(i, N)
	1 / ((1 + i)^N)
end

export sinkingFundFactor, uniformSeriesCompoundAmoundFactor
# Sinking Fund Factor: (A/F, i, N)
# - gives the size of A of a repeated receipt or disbursement that is equivalent
#   to a future amount F if the interest rate is i and the number of periods is
#   N
# - If you want to accumulate 50,000 in 5 years, how much should we invest
#   yearly if the interest rate is 10%? F * (A/F,10%, 5)
function sinkingFundFactor(i, N)
	i / ((1 + i)^N - 1)
end

# Uniform Series Compound Amount Factor: (F/A, i, N)
# - gives the future value F that is equivalent to a series of equal size
#   receipts or disbursements of A when the interest rate is i and the number of
#   periods is N
# - If you deposit $200 yearly for 45 years if the interest rate is 12% how much
#   will be in your savings account? 200 (A/F, 12%, 45)
function uniformSeriesCompoundAmoundFactor(i, N)
	((1+i)^N - 1) / i
end

export capitalRecoveryFactor, seriesPresentAmountFactor
# Capital Recovery Factor: (A/P, i, N)
# - gives the value of A of the equal periodic payments or receipts that are
#   equivalent to the present amount P when the interest is i and the number of
#   period is N
# - how much should I pay per month to be equal to just paying $100 dollars now
#   for the thing?
function capitalRecoveryFactor(i, N)
	(i * (1 + i)^N) / ((i+1)^N - 1)
end

# Series Present Worth Factor: (P/A,i,N)
# - gives the present amount, P, that is equivalent to an annuity with
#   disbursements or receipts in the amount of A, where the interest rate is i
#   and the number of periods is N
# - how much should I pay now to get out of paying $200 a month for 40 years if
#   the interest is 2%
function seriesPresentAmountFactor(i, N)
	((1 + i)^N - 1) / (i * (1 + i)^N)
end

export singlePaymentPresentWorthArithmetic, sinkingFundPaymentArithmetic
# Single Payment Present Worth for Arithmetic Gradient Series:
# - gives the present worth of paying a gradient cost for N periods at an
#   interest rate of i
# - (P/G, i, N)
function singlePaymentPresentWorthArithmetic(i, N)
	((1+i)^N - i * N - 1) / (i^2 * (1+i)^N)
end

# Sinking Fund Payment for Arithmetic Gradient Series
# - (A/G, i, N)
function sinkingFundPaymentArithmetic(i, N)
	(1 / i - N / ((1+i)^N - 1))
end

export presentWorthConversionFactorGeometric
# Conversion Factor for Geometric Gradient Series (P/A, g, i, N)
# - gives the present worth P that is equivalent to a geometric gradient series
#   where the base receipt or disbursement is A, the growth rate is g, and the
#   interest rate is i, and the number of periods is N
function presentWorthConversionFactorGeometric(g, i, N)
	i0 = (1 + i) / (1 + g) - 1
	(((1 + i0)^N - 1) / (i0 * (1+i0)^N)) * 1 / (1 + g)
end

end
