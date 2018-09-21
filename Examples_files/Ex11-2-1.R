# Example 11.2.1: Life-testing of incandescent lamps

smooth.test(lamp,order=4,distr="logis",method="MLE",B=1000)

# the output
#
#Smooth goodness-of-fit test
#Null hypothesis: logis against 4 th order alternative
#Nuisance parameter estimation: MLE 
#Parameter estimates: 915.8808 23.68155  ( location scale )
#
#Smooth test statistic S_k = 9.377444  p-value = 0.017 
#     1 th  component V_k = -2.32663  p-value = 0.012 
#     2 th  component V_k = 1.433731  p-value = 0.031 
#     3 th  component V_k = -1.447546  p-value = 0.028 
#     4 th  component V_k = 0.3390907  p-value = 0.037 
#
#All p-values are obtained by the bootstrap with 1000 runs

smooth.test(lamp,order=4,distr="logis",method="MME",B=1000)

# the output
#
#Smooth goodness-of-fit test
#Null hypothesis: logis against 4 th order alternative
#Nuisance parameter estimation: MME 
#Parameter estimates: 906.5 26.37087  ( location scale )
#
#Smooth test statistic S_k = 1.062645  p-value = 0.035 
#     3 th  component V_k = -1.029870  p-value = 0.025 
#     4 th  component V_k = 0.04487287  p-value = 0.11 
#
#All p-values are obtained by the bootstrap with 1000 runs
#


ddsmooth.test(lamp,max.order=6,horizon="order",criterion="AIC",distr="logis",method="MME",B=1000)

# the output
#
#Data-Driven Smooth goodness-of-fit test
#Null hypothesis: logis against 6 th order alternative
#Nuisance parameter estimation: MME 
#Parameter estimates: 906.5 26.37087  ( location scale )
#Horizon: order 
#Selection criterion: AIC 
#
#Data-Driven Smooth test statistic S_k = 1.060632  p-value = 0.018 
#Selected model: 3 
#
#All p-values are obtained by the bootstrap with 1000 runs

ddsmooth.test(lamp,max.order=6,horizon="order",criterion="BIC",distr="logis",method="MME",B=1000)

# the output
#
#Data-Driven Smooth goodness-of-fit test
#Null hypothesis: logis against 6 th order alternative
#Nuisance parameter estimation: MME 
#Parameter estimates: 906.5 26.37087  ( location scale )
#Horizon: order 
#Selection criterion: BIC 
#
#Data-Driven Smooth test statistic S_k = 1.060632  p-value = 0.028 
#Selected model: 3 
#
#All p-values are obtained by the bootstrap with 1000 runs

ddsmooth.test(lamp,max.order=5,horizon="subset",criterion="AIC",distr="logis",method="MME",B=1000)

# the output
#
#Data-Driven Smooth goodness-of-fit test
#Null hypothesis: logis against 5 th order alternative
#Nuisance parameter estimation: MME 
#Parameter estimates: 906.5 26.37087  ( location scale )
#Horizon: subset 
#Selection criterion: AIC 
#
#Data-Driven Smooth test statistic S_k = 1.333219  p-value = 0.018 
#Selected model: 5 
#
#All p-values are obtained by the bootstrap with 1000 runs

# the next example also shows the use of the plot=T statement for plotting the improved density estimate, and the breaks=10 argument  is actually an argument for the hist function. 

ddsmooth.test(lamp,max.order=5,horizon="subset",criterion="BIC",distr="logis",method="MME",B=1000,plot=T,breaks=10)

# the output
#
#Data-Driven Smooth goodness-of-fit test
#Null hypothesis: logis against 5 th order alternative
#Nuisance parameter estimation: MME 
#Parameter estimates: 906.5 26.37087  ( location scale )
#Horizon: subset 
#Selection criterion: BIC 
#
#Data-Driven Smooth test statistic S_k = 1.333219  p-value = 0.018 
#Selected model: 5 
#
#All p-values are obtained by the bootstrap with 1000 runs
#




