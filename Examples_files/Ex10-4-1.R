# Example 10.4.1: Industrial data series (4)

ddsmooth.test(industrial4,distr="norm",method="MME",horizon="subset",criterion="AIC",max.order=6,B=1000,plot=T)

# the output
#
#Data-Driven Smooth goodness-of-fit test
#Null hypothesis: norm against 6 th order alternative
#Nuisance parameter estimation: MME 
#Parameter estimates: 0.63364 0.3388172  ( mean sd )
#Horizon: subset 
#Selection criterion: AIC 
#
#Data-Driven Smooth test statistic S_k = 3.999744  p-value = 0.0522 
#Selected model: 5 
#
#All p-values are obtained by the bootstrap with 1000 runs

ddsmooth.test(industrial4,distr="norm",method="MME",horizon="subset",criterion="MISE",max.order=6,B=1000,plot=T)

# the output
#
#Data-Driven Smooth goodness-of-fit test
#Null hypothesis: norm against 6 th order alternative
#Nuisance parameter estimation: MME 
#Parameter estimates: 0.63364 0.3388172  ( mean sd )
#Horizon: subset 
#Selection criterion: MISE 
#
#Data-Driven Smooth test statistic S_k = 7.41113  p-value = 0.009 
#Selected model: 3 4 5 6 
#
#All p-values are obtained by the bootstrap with 1000 runs

