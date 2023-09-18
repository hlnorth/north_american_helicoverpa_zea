## Initialize
iterations <- 100 # This example uses 100 iterations. ~10^6 iterations is more appropriate for fully exploring parameter space. 
gens_per_year <- 10 # Generations per year. 
fixed_dominance <- F # Is the dominance fixed to a certain value, or will the dominance coefficient be co-estimated along with s?

# Generate a set of random s values
s_set <- runif(iterations, 0, 1)

# The time-series spans generations between 1998 and 2019
t_set <- seq((1998+(1/gens_per_year)),2017,1/gens_per_year)

# Observed allele frequencies
# "Sanger sequencing of ca. 200-bp fragments spanning one nonsynonymous mutation in ... cyp333b3 indicated [its frequency] 
# in 1998 [was] ... 0.1 ... [these] same mutations had frequencies of ... 0.35 in 2002 and ... 0.82 in 2017"
# https://www.pnas.org/doi/full/10.1073/pnas.2020853118

q1998 = 0.1
q2002 = 0.35
q2017 = 0.82

# Create an empty dataframe to fill
s_h_D = data.frame(matrix(nrow = length(s_set), ncol = 3)) 
colnames(s_h_D) <- c("s","h","D")
i = 1 # The index in the dataframe s_h_D

index_deciles <- seq(0.05, 0.95, by = 0.05)*length(s_set) # To track progress

minD = 1 # Set the initial value of minD to 1

for (s in s_set) { # for a random value of s
  t = 1998 # start at 1998
  q = q1998 # Initial allele frequency is that observed in 1998 
  p = 1-q
  
  if (i %in% index_deciles) {
    percent_complete <- i/length(s_set)*100
    cat(percent_complete, "% complete",sep="")
    cat("\n")
  }
  
  if (fixed_dominance==T) {
    h = 1 # Defint the fixed dominance coefficient. In this example it is 1 (complete dominance).
  } else {
    h = runif(1, 0, 1) # Random dominance coefficient
  }
  
  
  wAA = 1 # The reference genotypic fitness is homozygous ancestral
  wAa = 1 + h*s # Heterozygous genotype fitness
  waa = 1 + s # Fitness of derived homozygous CYP333B3
  
  plot(t, q, xlab="Year", ylab="Frequency of CYP333B3", 
       pch=19, xlim=c(1998,2019), ylim=c(0,1), col="blue", type="p")
  
  points(2002, q2002, pch=19, col="blue", type="p")
  points(2017, q2017, pch=19, col="blue", type="p")
  
  # Timestep
  t = 1999
  for (t in t_set) {
    
    # Define p in generation t+1
    meanFitness = p^2*wAA + 2*p*q*wAa + q^2*waa # update mean fitness 
    delta_p = ((p*q)*(p*(wAA-wAa) + q*(wAa - waa))) / meanFitness
    
    # Update p
    p = p + delta_p
    q = 1-p
    
    
    # Calculate the difference between observed q and expected q
    
    if (t==2002) {
      D_2002 = abs(q-q2002)
      segments(t,q,t,q2002, lwd=2, col='red')
    }
    
    if (t==2017) {
      D_2017 = abs(q-q2017)
      segments(t,q,t,q2017, lwd=2, col='red')
    }
    
    points(t,q, pch=19, type="p", col='lightblue')
    
  }
  
  # Calculate the total error (D) for a given value of s and h
  D = D_2002 + D_2017
  # Record the relationship between D, s and h for each iteration
  s_h_D$s[i] <- s
  s_h_D$h[i] <- h
  s_h_D$D[i] <- D
  
  # If the observed error is less than the previously observed error, 
  # update the estimate of s and h
  
  if (D < minD) {
    minD = D
    opt_s = s
    opt_h = h
  }
  
  i = i + 1 # update the index when we move to the next row of s_h_D
}

cat("the optimal estimate of s is", opt_s, sep=" ")
cat("\n")
cat("the optimal estimate of h is", opt_h, sep=" ")
cat("\n")
cat("Error score:", minD, sep=" ")

# Output the data with an appropraite file name
#write.table(s_h_D, "s_estimator_XgensPerYear_Xiterations_CYP333B3_XDominance.tsv", append = FALSE, sep = '\t',
#            row.names = F, col.names = T, quote=F)
