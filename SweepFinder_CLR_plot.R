# Here I use dplyr and ggplot2, though they are not required to reproduce figures
library(dplyr)
library(ggplot2)

# Read in CLR data

load('./SweepFinder_CLR.Rdata')

head(data)

# For each position, the liklihood ratio (LR) from SweepFinder2 is reported. 

## Subset outliers
outliers999 <- data %>%
  filter(LR>=quantile(data$LR, 0.999)[[1]])

outliers9999 <- data %>%
  filter(LR>=quantile(data$LR, 0.9999)[[1]])

(nrow(outliers9999)/nrow(data))*100 # Sanity check: 0.01% of data are outliers

## 1: generate plot concepts

# Point data
plot_concept <- ggplot(data, aes(location/1000000, LR)) + #Convert chromosomal bp to Mbp
  geom_point(alpha=1/4) + theme_bw() +
  theme(panel.border = element_blank(), panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(), axis.line = element_line(colour = "black")) +
  xlab('Chromosomal position (Mbp)') +
  ylab('Composite likelihood ratio') +
  scale_y_continuous(limits = c(0,140), expand = c(0, 0))

# Lined data
lineplot_concept <- ggplot(data, aes(location/1000000, LR)) + 
  geom_line(alpha=1/4) + theme_bw() + 
  theme(panel.border = element_blank(), panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(), axis.line = element_line(colour = "black")) +
  xlab('Chromosomal position (Mbp)') +
  ylab('Composite likelihood ratio') +
  scale_y_continuous(limits = c(0,140), expand = c(0, 0))


## 2: Plot as a grid of separate chromosomes 

# Points
grid <- plot_concept + facet_wrap(~chromsome_name, scales='free', strip.position = "top") +
  geom_point(data=outliers9999, aes(x=location/1000000,y=LR), color='blue', size=1) +
  theme(axis.text.x = element_text(size = 10)) +
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        strip.background = element_blank(),
        panel.border = element_rect(colour = "black", fill = NA))
grid

# Lines
grid_lined <- lineplot_concept + facet_wrap(~chromsome_name, scales='free', strip.position = "top") +
  geom_line() +
  geom_point(data=outliers9999, aes(x=location/1000000,y=LR), color='blue', size=1) + 
  theme(axis.text.x = element_text(size = 10)) + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        strip.background = element_blank(), panel.border = element_rect(colour = "black", fill = NA))
grid_lined