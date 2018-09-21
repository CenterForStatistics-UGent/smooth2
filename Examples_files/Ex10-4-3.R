# Example 10.4.3: Polonium data

ddsmooth.test(polonium,distr="pois",method="MME",horizon="subset",criterion="AIC",max.order=6,B=1000,plot=T)


# the output
#
#Data-Driven Smooth goodness-of-fit test
#Null hypothesis: pois against 6 th order alternative
#Nuisance parameter estimation: MME 
#Parameter estimates: 3.871549  ( lambda )
#Horizon: subset 
#Selection criterion: AIC 
#
#Data-Driven Smooth test statistic S_k = 10.58998  p-value = 0.032 
#Selected model: 2 4 
#
#All p-values are obtained by the bootstrap with 1000 runs

ddsmooth.test(polonium,distr="pois",method="MME",horizon="subset",criterion="MISE",max.order=6,B=1000,plot=T)

# the output
#
#Data-Driven Smooth goodness-of-fit test
#Null hypothesis: pois against 6 th order alternative
#Nuisance parameter estimation: MME 
#Parameter estimates: 3.871549  ( lambda )
#Horizon: subset 
#Selection criterion: MISE 
#
#Data-Driven Smooth test statistic S_k = 10.58998  p-value = 0.019 
#Selected model: 2 4 
#
#All p-values are obtained by the bootstrap with 1000 runs
