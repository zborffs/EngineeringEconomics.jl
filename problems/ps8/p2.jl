using EngEconomics, Roots, Plots, ColorSchemes
plotly()

uwEngColorScheme = ColorScheme([parse(Colorant, "#D0B4E7"), parse(Colorant, "#57058B"), parse(Colorant, "#8100B4"), parse(Colorant, "#000000")])

# Given
PT = 100
PA = 150
lifeT = 5
lifeA = 5
AT = 50
AA = 62
FT = 20
FA = 30

# Find
# (a.) Construct a break even graph showing the present worth of each
#      alternative as a function of interest rates between 6 percent and 20
#      percent.
i = collect(0.06:0.01:0.2)
NPWT = -PT .+ AT * seriesPresentAmountFactor.(i, lifeT) .+ FT * presentWorthFactor.(i, lifeT)
NPWA = -PA .+ AA * seriesPresentAmountFactor.(i, lifeA) .+ FA * presentWorthFactor.(i, lifeA)

plot(i, NPWT, label="Model T", xlabel="Interest Sensitivity (6%-20%)",
	ylabel="Present Worth (\$1000)",
	title="Sensitivity of Net Present Worth of Models T and A to Interest Rate",
	palette=cgrad(uwEngColorScheme))
plot!(i, NPWA, label="Model A")

# (b.) Which is the preferred choice at 8 percent interest?
i8 = findall(x->x == 0.08, i)
@assert length(i8) == 1
i8 = i8[1]
NPWT_i8 = NPWT[i8]
NPWA_i8 = NPWA[i8]

if NPWT_i8 > NPWA_i8
	println("Model T is preferred because its NPW at i=8% is greater than that of Model A")
else
	println("Model A is preferred because its NPW at i=8% is greater than that of Model T")
end

# (c.) Which is the preferred choice at 16 percent interest?
i16 = findall(x->x == 0.16, i)
@assert length(i16) == 1
i16 = i16[1]
NPWT_i16 = NPWT[i16]
NPWA_i16 = NPWA[i16]

if NPWT_i16 > NPWA_i16
	println("Model T is preferred because its NPW at i=16% is greater than that of Model A")
else
	println("Model A is preferred because its NPW at i=16% is greater than that of Model T")
end

# (d.) What is the break-even interest rate?
NPWT_func(interest) = -PT .+ AT * seriesPresentAmountFactor.(interest, lifeT) .+ FT * presentWorthFactor.(interest, lifeT)
NPWA_func(interest) = -PA .+ AA * seriesPresentAmountFactor.(interest, lifeA) .+ FA * presentWorthFactor.(interest, lifeA)
f(interest) = NPWT_func(interest) - NPWA_func(interest)
iBreakEven = find_zero(f, 0.11)

println("The break even interest rate is roughly ", iBreakEven)
