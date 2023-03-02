# Load required packages
library(scales) # for visualization; all else can be done in Base R v4.2.2

# Read in data
Dstats_data <- readRDS('Dstats_data.RData')
# Dstats_data is a list of dataframes
# The name of each dataframe describes the focal population set to P2
str(Dstats_data) 

## Brazilian hybrids

# Unpack data from Brazilian hybrids
P2HYB <- Dstats_data$P2HYB
head(P2HYB)

# Remove fD values >1 and <-1, which are meaningless values caused by using too few sites to calculate the statistic
P2HYB <- na.omit(P2HYB)
P2HYB_cleaned <- subset(P2HYB, P2HYB$fd<1)
P2HYB_cleaned <- subset(P2HYB_cleaned, P2HYB_cleaned$fd>-1)
nrow(P2HYB_cleaned) # Look at the number of windows remaining
P2HYB_cleaned_density <- density(P2HYB_cleaned$fd)
plot(P2HYB_cleaned_density) # Look at the distribution of fD across all windows

# Now do the same for data from each of our 10 sampling sites

## Lees Mill Township, NC 
P2Zea_NC <- Dstats_data$P2Zea_NC
mean(na.omit(P2Zea_NC$fd)) 
P2Zea_NC_density <- density(na.omit(P2Zea_NC$fd))
P2Zea_NC <- na.omit(P2Zea_NC)
P2Zea_NC_cleaned <- subset(P2Zea_NC, P2Zea_NC$fd<1)
P2Zea_NC_cleaned <- subset(P2Zea_NC_cleaned, P2Zea_NC_cleaned$fd>-1)
nrow(P2Zea_NC_cleaned)
P2Zea_NC_cleaned_density <- density(P2Zea_NC_cleaned$fd)
plot(P2Zea_NC_cleaned_density)

## Jackson, Co., TX 
P2Zea_JA <- Dstats_data$P2Zea_JA
mean(na.omit(P2Zea_JA$fd)) 
P2Zea_JA_density <- density(na.omit(P2Zea_JA$fd))
P2Zea_JA <- na.omit(P2Zea_JA)
P2Zea_JA_cleaned <- subset(P2Zea_JA, P2Zea_JA$fd<1)
P2Zea_JA_cleaned <- subset(P2Zea_JA_cleaned, P2Zea_JA_cleaned$fd>-1)
nrow(P2Zea_JA_cleaned)
P2Zea_JA_cleaned_density <- density(P2Zea_JA_cleaned$fd)
plot(P2Zea_JA_cleaned_density)


## JLafayette Co., Arkansas
P2Zea_LaF <- Dstats_data$P2Zea_LaF
mean(na.omit(P2Zea_LaF$fd)) 
P2Zea_LaF_density <- density(na.omit(P2Zea_LaF$fd))
P2Zea_LaF <- na.omit(P2Zea_LaF)
P2Zea_LaF_cleaned <- subset(P2Zea_LaF, P2Zea_LaF$fd<1)
P2Zea_LaF_cleaned <- subset(P2Zea_LaF_cleaned, P2Zea_LaF_cleaned$fd>-1)
nrow(P2Zea_LaF_cleaned)
P2Zea_LaF_cleaned_density <- density(P2Zea_LaF_cleaned$fd)
plot(P2Zea_LaF_cleaned_density)

## Matagorda Co., Texas 
P2Zea_MA <- Dstats_data$P2Zea_MA
mean(na.omit(P2Zea_MA$fd)) 
P2Zea_MA_density <- density(na.omit(P2Zea_MA$fd))
P2Zea_MA <- na.omit(P2Zea_MA)
P2Zea_MA_cleaned <- subset(P2Zea_MA, P2Zea_MA$fd<1)
P2Zea_MA_cleaned <- subset(P2Zea_MA_cleaned, P2Zea_MA_cleaned$fd>-1)
nrow(P2Zea_MA_cleaned)
P2Zea_MA_cleaned_density <- density(P2Zea_MA_cleaned$fd)
plot(P2Zea_MA_cleaned_density)

## Mississippi Co., Missouri 
P2Zea_MO <- Dstats_data$P2Zea_MO
mean(na.omit(P2Zea_MO$fd)) 
P2Zea_MO_density <- density(na.omit(P2Zea_MO$fd))
P2Zea_MO <- na.omit(P2Zea_MO)
P2Zea_MO_cleaned <- subset(P2Zea_MO, P2Zea_MO$fd<1)
P2Zea_MO_cleaned <- subset(P2Zea_MO_cleaned, P2Zea_MO_cleaned$fd>-1)
nrow(P2Zea_MO_cleaned)
P2Zea_MO_cleaned_density <- density(P2Zea_MO_cleaned$fd)
plot(P2Zea_MO_cleaned_density)


## Navasota, Texas 
P2Zea_NA <- Dstats_data$P2Zea_NA
mean(na.omit(P2Zea_NA$fd)) 
P2Zea_NA_density <- density(na.omit(P2Zea_NA$fd))
P2Zea_NA <- na.omit(P2Zea_NA)
P2Zea_NA_cleaned <- subset(P2Zea_NA, P2Zea_NA$fd<1)
P2Zea_NA_cleaned <- subset(P2Zea_NA_cleaned, P2Zea_NA_cleaned$fd>-1)
nrow(P2Zea_NA_cleaned)
P2Zea_NA_cleaned_density <- density(P2Zea_NA_cleaned$fd)
plot(P2Zea_NA_cleaned_density)

## Thrall, Texas 
P2Zea_Thrall <- Dstats_data$P2Zea_Thrall
mean(na.omit(P2Zea_Thrall$fd)) 
P2Zea_Thrall_density <- density(na.omit(P2Zea_Thrall$fd))
P2Zea_Thrall <- na.omit(P2Zea_Thrall)
P2Zea_Thrall_cleaned <- subset(P2Zea_Thrall, P2Zea_Thrall$fd<1)
P2Zea_Thrall_cleaned <- subset(P2Zea_Thrall_cleaned, P2Zea_Thrall_cleaned$fd>-1)
nrow(P2Zea_Thrall_cleaned)
P2Zea_Thrall_cleaned_density <- density(P2Zea_Thrall_cleaned$fd)
plot(P2Zea_Thrall_cleaned_density)

## Wharton, Texas
P2Zea_WA <- Dstats_data$P2Zea_WA
mean(na.omit(P2Zea_WA$fd)) 
P2Zea_WA_density <- density(na.omit(P2Zea_WA$fd))
P2Zea_WA <- na.omit(P2Zea_WA)
P2Zea_WA_cleaned <- subset(P2Zea_WA, P2Zea_WA$fd<1)
P2Zea_WA_cleaned <- subset(P2Zea_WA_cleaned, P2Zea_WA_cleaned$fd>-1)
nrow(P2Zea_WA_cleaned)
P2Zea_WA_cleaned_density <- density(P2Zea_WA_cleaned$fd)
plot(P2Zea_WA_cleaned_density)

## Tillar, Arkansas 
P2Zea_Tillar <- Dstats_data$P2Zea_Tillar
mean(na.omit(P2Zea_Tillar$fd)) 
P2Zea_Tillar_density <- density(na.omit(P2Zea_Tillar$fd))
P2Zea_Tillar <- na.omit(P2Zea_Tillar)
P2Zea_Tillar_cleaned <- subset(P2Zea_Tillar, P2Zea_Tillar$fd<1)
P2Zea_Tillar_cleaned <- subset(P2Zea_Tillar_cleaned, P2Zea_Tillar_cleaned$fd>-1)
nrow(P2Zea_Tillar_cleaned)
P2Zea_Tillar_cleaned_density <- density(P2Zea_Tillar_cleaned$fd)
plot(P2Zea_Tillar_cleaned_density)

## Winnsboro, Louisiana 
P2Zea_WB <- Dstats_data$P2Zea_WB
mean(na.omit(P2Zea_WB$fd)) 
P2Zea_WB_density <- density(na.omit(P2Zea_WB$fd))
P2Zea_WB <- na.omit(P2Zea_WB)
P2Zea_WB_cleaned <- subset(P2Zea_WB, P2Zea_WB$fd<1)
P2Zea_WB_cleaned <- subset(P2Zea_WB_cleaned, P2Zea_WB_cleaned$fd>-1)
nrow(P2Zea_WB_cleaned)
P2Zea_WB_cleaned_density <- density(P2Zea_WB_cleaned$fd)
plot(P2Zea_WB_cleaned_density)

## Reproduce plot

plot(P2HYB_cleaned_density, 
     main="", 
     xlab = expression(italic(f[D]) ~ " 20kbp" ~ "windows"), ylab="Relative frequency", ylim=c(0,7), 
     cex.lab = 1.25, mgp=c(2.5,1,0))
polygon(P2HYB_cleaned_density, col=alpha("darkblue", 0.25), border="black")
polygon(P2Zea_NC_cleaned_density, col=alpha("lightblue", 0.25), border="black")
polygon(P2Zea_JA_cleaned_density, col=alpha("lightblue", 0.25), border="black")
polygon(P2Zea_LaF_cleaned_density, col=alpha("lightblue", 0.25), border="black")
polygon(P2Zea_MA_cleaned_density, col=alpha("lightblue", 0.25), border="black")
polygon(P2Zea_MO_cleaned_density, col=alpha("lightblue", 0.25), border="black")
polygon(P2Zea_NA_cleaned_density, col=alpha("lightblue", 0.25), border="black")
polygon(P2Zea_Thrall_cleaned_density, col=alpha("lightblue", 0.25), border="black")
polygon(P2Zea_WA_cleaned_density, col=alpha("lightblue", 0.25), border="black")
polygon(P2Zea_Tillar_cleaned_density, col=alpha("lightblue", 0.25), border="black")
polygon(P2Zea_WB_cleaned_density, col=alpha("lightblue", 0.25), border="black")