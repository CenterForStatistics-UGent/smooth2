# Example 10.4.4: Aluminium defects data

ddsmooth.test(aluminium,distr="pois",method="MME",horizon="subset",max.order=6,criterion="AIC",B=1000,plot=T)

# the output
#
#Data-Driven Smooth goodness-of-fit test
#Null hypothesis: pois against 5 th order alternative
#Nuisance parameter estimation: MME 
#Parameter estimates: 1.999  ( lambda )
#Horizon: subset 
#Selection criterion: AIC 
#
#Data-Driven Smooth test statistic S_k = 4.709159  p-value = 0.12 
#Selected model: 2 
#
#All p-values are obtained by the bootstrap with 1000 runs
#

ddsmooth.test(aluminium,distr="pois",method="MME",horizon="subset",max.order=5,criterion="MISE",B=1000,plot=T)

# the output
#
#Data-Driven Smooth goodness-of-fit test
#Null hypothesis: pois against 5 th order alternative
#Nuisance parameter estimation: MME 
#Parameter estimates: 1.999  ( lambda )
#Horizon: subset 
#Selection criterion: MISE 
#
#Data-Driven Smooth test statistic S_k = 4.709159  p-value = 0.142 
#Selected model: 2 
#
#All p-values are obtained by the bootstrap with 1000 runs


