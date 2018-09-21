# Example 11.3.1: Flood heights

smooth.test(flood,order=4,distr="laplace",method="MME",B=1000)

# the output
#
#Smooth goodness-of-fit test
#Null hypothesis: laplace against 4 th order alternative
#Nuisance parameter estimation: MME 
#Parameter estimates: 9.353333 2.799946  ( location scale )
#
#Smooth test statistic S_k = 0.4161878  p-value = 0.338 
#     3 th component V_k = -0.05061184  p-value = 0.921 
#     4 th component V_k = -0.6431378  p-value = 0.023 
#
#All p-values are obtained by the bootstrap with 1000 runs




ddsmooth.test(flood,horizon="subset",criterion="AIC",distr="laplace",method="MME",max.order=5,B=1000)

# the output
#
#Data-Driven Smooth goodness-of-fit test
#Null hypothesis: laplace against 5 th order alternative
#Nuisance parameter estimation: MME 
#Parameter estimates: 9.353333 2.799946  ( location scale )
#Horizon: subset 
#Selection criterion: AIC 
#
#Data-Driven Smooth test statistic S_k = 0.4136262  p-value = 0.324 
#Selected model: 4 
#
#All p-values are obtained by the bootstrap with 1000 runs



ddsmooth.test(flood,horizon="subset",criterion="BIC",distr="laplace",method="MME",max.order=5,B=1000)

# the output
#
#Data-Driven Smooth goodness-of-fit test
#Null hypothesis: laplace against 5 th order alternative
#Nuisance parameter estimation: MME 
#Parameter estimates: 9.353333 2.799946  ( location scale )
#Horizon: subset 
#Selection criterion: BIC 
#
#Data-Driven Smooth test statistic S_k = 0.4136262  p-value = 0.316 
#Selected model: 4 
#
#All p-values are obtained by the bootstrap with 1000 runs



