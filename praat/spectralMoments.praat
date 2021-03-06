# Spectral moments

# [f]
# [θ]
# [s]
# [ʃ]

# Find midpoint of fricative

# Select 50ms, Selec > Move end of selection by...,

# Once you have made the selection, select 50ms hamming window 
# (File > Extract selected sound windowed)
# Window shape = hamming, (rename slice to "f")

# Select Sound f, Analyse spectrum > To spectrum... 

# Select Spectrum f, 
#   Query > Get center of gravity (write down this number)
#   Query > Get standard deviation (write down this number)
#   Query > Get skewness
#   Query > Get kurtosis

# Repeat process with [θ], [s] and [ʃ]




segment   Cog    SD  skewness  kurtosis
f       13236  2717     -1.13      3.30
th      13186  2501     -1.15      5.42
s       11088  2562      0.06      0.22
sh       6017  3156      1.10      0.37


# Notes
# CoG (mean): average energy concentration
# SD (variance): range of energy concentration
# Skewness: Indicates asymmetry of distribution, spectral tilt (slant of enegry distribution)
#   - 0 = symetrical around the mean
#   - negative = left-tail extends further than the right (positive tilt, energy concentrated in higher frequencies)
#   - positive = right-tail extends further than the left (negative tilt, energy concentrated in lower frequencies)
# Kurtosis: Indicates peak of distribution
#   - positive/higher values = more peak, clearly defined
#   - negative values = flat distribution, no clearly defined peaks