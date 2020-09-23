using EngEconomics
using Test
using Dates

@testset "Simple Interest" begin
	@test simpleInterest(4500, 0.08, 1) == 4860
	@test simpleInterest(4500, 0.08, 4) == 5940
	@test isapprox(simpleInterest(1000, 0.08, 80/360), (1000 + 17.78); atol=0.01)
end

@testset "Fractional Payment Period" begin
	apr1 = Date(Dates.Month(4), Dates.Day(1))
	jun20 = Date(Dates.Month(6), Dates.Day(20))
	@test findFractionalPeriod2(apr1, jun20) == 80/360
end
