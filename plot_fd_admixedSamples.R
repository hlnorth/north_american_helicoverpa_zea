### Explore fd results: admixed individuals. 

# read in the data
load('./fd_admixedJA.RData')

# Subset chromosome 15
admixed_JA_c15 <- subset(admixed_JA, 
                         admixed_JA$chr==15)


save(admixed_JA, 
     file='/Users/henrylnorth/Dropbox/papers/2021_02_northAmericanZea_GSword/draft3/Github_files/fd_admixedJA.RData')

# The midpoint of the CYP337B3 annotation in Mbp
CYP337B3_midpoint_Mbp <- ((11436565+11440168)/2)/1000000

# reproduce plot
plot(admixed_JA_c15$mid_Mbp, 
     admixed_JA_c15$fd, 
     col='black', 
     pch=19, cex=0.75, ylim=c(-0.75,0.75),
     xlab='Position on chromosome 15 (Mbp)', 
     ylab=expression(italic(f[d])))
abline(v=CYP337B3_midpoint_Mbp, 
       lty=2,
       lwd=3,
       col=alpha('orange',0.75))



