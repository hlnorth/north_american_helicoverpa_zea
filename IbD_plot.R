# Required packages
library(dplyr)
library(ggplot2)
library(hrbrthemes)
library(scales)

# Read in data
IbD_genomewide <- readRDS(file='IbD_genomewide.RData')
head(IbD_genomewide)

# Standardize FST and look at the correlation with geographic distance
IbD_genomewide$FST_over_1minusFST <- IbD_genomewide$FST/(1-IbD_genomewide$FST)

IbD_log_normalisedFST_cor <- cor.test(log10(IbD_genomewide$distance),IbD_genomewide$FST_over_1minusFS)
IbD_log_normalisedFST_cor 

# Reproduce plot
plot <- ggplot(IbD_genomewide, aes(x=log10(distance), y=FST_over_1minusFST)) +
  xlab(expression(log[10] ~ pairwise ~ geographic ~ distance ~ (km))) + 
  ylab(expression(bar(F[ST])/(1-bar(F[ST])))) +
  geom_smooth(method=lm , color=alpha("lightblue", 0.025), fill="lightblue", se=TRUE) + # generalized additive model
  geom_point(size=2.5, alpha=0.75) + 
  theme_classic(base_size = 20) + 
  scale_x_continuous(expand = expansion(mult = c(0, 0))) +
  xlim(1.77, 3.31) # Ensure all data are clearly visible 
plot


