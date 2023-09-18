# North American Helicoverpa zea (sampled 2019)

Population genomic analysis of North American Helicoverpa zea. I test for introgression, IbD, and signatures of selection. I then model directional selection at a locus of interest under the inferred selection coefficient to show that the coefficient estimate can explain shifts in allele frequency over the past ~20 years. Please do get in touch if you have any trouble running these scripts or if you spot any bugs. 


## Model selection and fit to observed data

I use a simple model of single-locus selection. Using the model, I retrodict allele frequenceis by plugging in my estimate of the selection coefficeint (based on qualities of the selective sweep; see above) and biologically realistic generation times. Using the same model, I show taht a very similar selection coefficient is the best fit to independently observed allele frequenices. 

[s_fit_model.R](https://github.com/hlnorth/north_american_helicoverpa_zea/blob/main/s_fit_model.R) demonstrates the model and the method I used to fit the model to observed data. This toy example will produce a plot of the most recent iteration: '#ADD8E6' Light blue points are the retrodicted allele frequencies under the selection coefficient, dominance coefficient and generation time for that iteration.
'#0000FF' Dark blue points are the observed allele frequencies. 
'#FF0000' Red lines indicate the error score. 

This script can be adjusted to identify combinations of the selection coefficient, dominance coefficient and generation time parameters that best fit observed data. Note that this is a very simple model; I simply use it to show that my estimate of the seleciton coefficient could reasonably explain independently estimated allele frequencies.
