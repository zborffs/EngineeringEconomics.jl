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


end
