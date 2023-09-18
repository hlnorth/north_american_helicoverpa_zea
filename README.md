# North American Helicoverpa zea (sampled 2019)

Population genomic analysis of North American Helicoverpa zea. I test for introgression, IbD, and signatures of selection. I then model directional selection at a locus of interest under the inferred selection coefficient to show that the coefficient estimate can explain shifts in allele frequency over the past ~20 years. All the metadata you should need can be found [here](https://github.com/hlnorth/north_american_helicoverpa_zea/blob/main/suppl_table_S2_VCF_metadata.csv) or elsewhere in the Supplementary Materials. Please do get in touch if you have any questions or comments. 

### Patterns of allele sharing on chromosome 15

[fd](https://academic.oup.com/mbe/article/32/1/244/2925550?login=true) was calculated in 20kbp windows, where P1 is H. zea sampled in 2002, P2 is Ja15 and Ja25, P3 is H. armigera, and the outgroup is H. punctigera. To reproduce the figure of fd on chromosome 15 around the CYP337B3 locus, [plot_fd_admixedSamples.R](https://github.com/hlnorth/north_american_helicoverpa_zea/blob/main/plot_fd_admixedSamples.R) reads in [fd_admixedJA.RData](https://github.com/hlnorth/north_american_helicoverpa_zea/blob/main/fd_admixedJA.RData)

This dataframe contains the number of ABBA and BABA sites, fd, fdm and Patterson's D in 20kbp windows for all chromosomes. 

### Genetic diversity, divergence, and differentiation

H. armigera has twice the effective population size of H. zea. I therefore expect reasonably large introgressed haplotypes from H. armigera to be more genetically diverse than the genomic background in H. zea. I also expect genetic differentiation and divergence between H. armigera and H. zea to be lower in putatively introgressed regions. Pi within putatively admixed H. zea and within H. armigera, plus Fst and dXY between these classes, is stored in [fd_admixedJA.RData](https://github.com/hlnorth/north_american_helicoverpa_zea/blob/main/fd_admixedJA.RData). [plot_FST_pi_dxy_100kbpWindows.R](https://github.com/hlnorth/north_american_helicoverpa_zea/blob/main/plot_FST_pi_dxy_100kbpWindows.R) reads in this data reproduces plots. This dataframe is for 100kbp windows; the same result holds for 20kbp windows. 


### Isolation by distance

To look at the relationship between genetic differentiation and geographic distance between sample sites, [plot_IbD.R](https://github.com/hlnorth/north_american_helicoverpa_zea/blob/main/plot_IbD.R) reads in data from [IbD.RData](https://github.com/hlnorth/north_american_helicoverpa_zea/blob/main/IbD.RData). This is a table of mean FST values for for each chromosome, for each pairwise comparison of 10 samples sites, along with the geographic distance for those comparisons. This dataset expcludes the two admixed individuals. 

### Model selection at one locus and fit this model to observed allele frequencies

I use a simple model of single-locus selection. Using the model, I retrodict allele frequencies by plugging in my estimate of the selection coefficient (based on qualities of the selective sweep; see above) and biologically realistic generation times. Using the same model, I show that a very similar selection coefficient is the best fit to independently observed allele frequencies. 

[s_fit_model.R](https://github.com/hlnorth/north_american_helicoverpa_zea/blob/main/s_fit_model.R) demonstrates the model and the method I used to fit the model to observed data. This toy example will produce a plot of the most recent iteration: Light blue points are the retrodicted allele frequencies under the selection coefficient, dominance coefficient and generation time for that iteration.
Dark blue points are the observed allele frequencies.Red lines indicate the error score. 

This script can be adjusted to identify combinations of the selection coefficient, dominance coefficient and generation time parameters that best fit observed data. Note that this is a very simple model; I simply use it to show that my estimate of the selection coefficient could reasonably explain independently estimated allele frequencies.
