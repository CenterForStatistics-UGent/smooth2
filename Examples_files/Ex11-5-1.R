# Example 11.5.1: Black Bean Aphids data

stems<-rep(0:9,c(6,8,9,6,6,2,5,3,1,4))

smooth.test(stems,order=4,distr="negb",method="MME",B=1000)

# the output
#
#Smooth goodness-of-fit test
#Null hypothesis: negb against 4 th order alternative
#Nuisance parameter estimation: MME 
#Parameter estimates: 3.193789 0.4799956  ( size prob )
#
#Smooth test statistic S_k = 1.778221  p-value = 0.2 
#     3 th component V_k = -1.036574  p-value = 0.121 
#     4 th component V_k = 0.8934634  p-value = 0.242 
#
#All p-values are obtained by the bootstrap with 1000 runs

ddsmooth.test(stems,max.order=10,horizon="order",criterion="AIC",distr="negb",method="MME",B=1000)


# the output
#
#Data-Driven Smooth goodness-of-fit test
#Null hypothesis: negb against 10 th order alternative
#Nuisance parameter estimation: MME 
#Parameter estimates: 3.193789 0.4799956  ( size prob )
#Horizon: order 
#Selection criterion: AIC 
#
#Data-Driven Smooth test statistic S_k = 1.074487  p-value = 0.111 
#Selected model: 3 
#
#All p-values are obtained by the bootstrap with 1000 runs

ddsmooth.test(stems,max.order=10,horizon="order",criterion="BIC",distr="negb",method="MME",B=1000)

# the output
#
#Data-Driven Smooth goodness-of-fit test
#Null hypothesis: negb against 10 th order alternative
#Nuisance parameter estimation: MME 
#Parameter estimates: 3.193789 0.4799956  ( size prob )
#Horizon: order 
#Selection criterion: BIC 
#
#Data-Driven Smooth test statistic S_k = 1.074487  p-value = 0.132 
#Selected model: 3 
#
#All p-values are obtained by the bootstrap with 1000 runs
#

