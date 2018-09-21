# Example 11.5.2: Bacterial cells data

smooth.test(cells,order=4,distr="negb",method="MME",chol=T,B=1000)

# the output
#
#Smooth goodness-of-fit test
#Null hypothesis: negb against 4 th order alternative
#Nuisance parameter estimation: MME 
#Parameter estimates: 2.767314 0.5314283  ( size prob )
#
#Smooth test statistic S_k = 17.75808  p-value = 0.002 
#     3 to 3 Cholesky component V_k = 3.552241  p-value = 0.002 
#     3 to 4 Cholesky component V_k = 2.267082  p-value = 0.004 
#
#All p-values are obtained by the bootstrap with 1000 runs

ddsmooth.test(cells,max.order=10,horizon="order",criterion="AIC",distr="negb",method="MME",B=1000)

# the output
#
#Data-Driven Smooth goodness-of-fit test
#Null hypothesis: negb against 10 th order alternative
#Nuisance parameter estimation: MME 
#Parameter estimates: 2.767314 0.5314283  ( size prob )
#Horizon: order 
#Selection criterion: AIC 
#
#Data-Driven Smooth test statistic S_k = 38.23904  p-value = 0.005 
#Selected model: 3 4 5 6 7 8 9 10 
#
#All p-values are obtained by the bootstrap with 1000 runs

ddsmooth.test(cells,max.order=10,horizon="order",criterion="BIC",distr="negb",method="MME",B=1000)

# the output
#
#Data-Driven Smooth goodness-of-fit test
#Null hypothesis: negb against 10 th order alternative
#Nuisance parameter estimation: MME 
#Parameter estimates: 2.767314 0.5314283  ( size prob )
#Horizon: order 
#Selection criterion: BIC 
#
#Data-Driven Smooth test statistic S_k = 12.61841  p-value = 0.05 
#Selected model: 3 
#
#All p-values are obtained by the bootstrap with 1000 runs
#

ddsmooth.test(cells,max.order=5,horizon="subset",criterion="AIC",distr="negb",method="MME",B=1000)

# the output
#
#Data-Driven Smooth goodness-of-fit test
#Null hypothesis: negb against 5 th order alternative
#Nuisance parameter estimation: MME 
#Parameter estimates: 2.767314 0.5314283  ( size prob )
#Horizon: subset 
#Selection criterion: AIC 
#
#Data-Driven Smooth test statistic S_k = 17.75808  p-value = 0.000 
#Selected model: 3 4 
#
#All p-values are obtained by the bootstrap with 1000 runs


ddsmooth.test(cells,max.order=5,horizon="subset",criterion="BIC",distr="negb",method="MME",B=1000)

# the output
#
#Data-Driven Smooth goodness-of-fit test
#Null hypothesis: negb against 5 th order alternative
#Nuisance parameter estimation: MME 
#Parameter estimates: 2.767314 0.5314283  ( size prob )
#Horizon: subset 
#Selection criterion: BIC 
#
#Data-Driven Smooth test statistic S_k = 12.61841  p-value = 0.005 
#Selected model: 3 
#
#All p-values are obtained by the bootstrap with 1000 runs


