# Example 10.4.2: Angus data

ddsmooth.test(lifetimes,distr="exp",method="MME",horizon="subset",criterion="AIC",max.order=6,B=1000,plot=T)

# the output
#
#Data-Driven Smooth goodness-of-fit test
#Null hypothesis: exp against 6 th order alternative
#Nuisance parameter estimation: MME 
#Parameter estimates: 0.1167747  ( rate )
#Horizon: subset 
#Selection criterion: AIC 
#
#Data-Driven Smooth test statistic S_k = 6.21189  p-value = 0.024 
#Selected model: 2 3 
#
#All p-values are obtained by the bootstrap with 1000 runs
#

ddsmooth.test(lifetimes,distr="exp",method="MME",horizon="order",criterion="MISE",max.order=6,B=1000,plot=T)

# the output
#
#Data-Driven Smooth goodness-of-fit test
#Null hypothesis: exp against 6 th order alternative
#Nuisance parameter estimation: MME 
#Parameter estimates: 0.1167747  ( rate )
#Horizon: order 
#Selection criterion: MISE 
#
#Data-Driven Smooth test statistic S_k = 8.769788  p-value = 0.016 
#Selected model: 2 3 4 5 
#
#All p-values are obtained by the bootstrap with 1000 runs
#
