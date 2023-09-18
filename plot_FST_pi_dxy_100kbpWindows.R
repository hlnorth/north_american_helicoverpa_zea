# Explore dataframe of genetic diversity within H. armigera and admixed H. zea, plus genetic differentiation and divergence between these classes

load('./FST_pi_dxy_100kbp_windows.RData')

# Subset only at chromosome 15 windows with at least 1000 informative sites per window
c15_FST_pi_100kb <- subset(FST_pi, 
                           FST_pi$chr==15 & c15_FST_pi_100kb$sites>1000)

# Coordinates in Mbp for clarity when plotting
c15_FST_pi_100kb$mid_Mbp <- (c15_FST_pi_100kb$mid/1000000) 

### Genetic diversity

# Genetic diversity in H. armigera
plot(c15_FST_pi_100kb$mid_Mbp, 
     c15_FST_pi_100kb$pi_ZEA_2019_ADMIXED, 
     col="black", type='l',
     lwd=2, ylim=c(0,0.1),
     xlab='Position on chromosome 15 (Mbp)', 
     ylab=expression(paste(pi)))
# Genetic diversity in the admixed samples
points(c15_FST_pi_100kb$mid_Mbp, 
       c15_FST_pi_100kb$pi_ARM, type='l',
       col="#FF680C", 
       lwd=2, cex=0.75)
# Divide into 'segment A' and 'segment B'
abline(v=9, 
       lty=1,
       lwd=0.5,
       col="grey")


### Genetic differentiation

# Label segments by segment
c15_FST_pi_100kb$segment <- ifelse(c15_FST_pi_100kb$mid_Mbp > 9, "B", "A")
c15_FST_pi_100kb$segment <- as.factor(c15_FST_pi_100kb$segment)

## Fst
boxplot(c15_FST_pi_100kb$Fst_ZEA_2019_ADMIXED_ARM ~ 
        c15_FST_pi_100kb$segment, 
        xlab='Segment', 
        ylab=expression(italic(F[ST])))

# Look at the genome-wide mean FST between the admixed individuals and H. armigera
FST_pi_100kb_filtered <- subset(FST_pi, 
                                c15_FST_pi_100kb$sites>1000)
mean(FST_pi_100kb_filtered$Fst_ZEA_2019_ADMIXED_ARM)

## dXY
boxplot(c15_FST_pi_100kb$dxy_ZEA_2019_ADMIXED_ARM ~ 
          c15_FST_pi_100kb$segment, 
        xlab='Segment', 
        ylab=expression(italic(d[XY])))

# Look at the genome-wide mean dXY between the admixed individuals and H. armigera
mean(FST_pi_100kb_filtered$dxy_ZEA_2019_ADMIXED_ARM)

