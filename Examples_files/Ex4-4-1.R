# Example 4.4.1: Birth-Time Data

smooth.test(birth,order=4,distr="unif",pars=c(0,24),method="NONE",B=1000)

#Smooth goodness-of-fit test
#Null hypothesis: unif against 4 th order alternative
#Nuisance parameter estimation: NONE 
#
#Smooth test statistic S_k = 5.354735  p-value = 0.25 
#     1 th component V_k = -0.1605659  p-value = 0.896 
#     2 th component V_k = -1.545008  p-value = 0.122 
#     3 th component V_k = 0.4810345  p-value = 0.596 
#     4 th component V_k = 1.646362  p-value = 0.116 
#
#All p-values are obtained by the bootstrap with 1000 runs
#
