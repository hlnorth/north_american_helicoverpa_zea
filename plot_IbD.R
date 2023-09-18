# Read in data
load('./IbD.RData')

#IbD shows mean chromosomal FST comparisons between sample sites, along the the lat/long coordinates between those locations

# Look at the relationship between Fst and geographic distance
plot(log10(IbD$distance_km), 
     IbD$FST_chromosomal,
     xlab=expression(log[10] ~ pairwise ~ geographic ~ distance ~ (km)), 
     ylab=expression(bar(F[ST])/(1-bar(F[ST]))))

# Note that the scaffold HaChr01 corresponds to the Z chromosome. 
# HaChr02 corresponds to chr 2, HaChr03 to 3 etc. 