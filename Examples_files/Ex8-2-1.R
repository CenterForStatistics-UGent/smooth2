# Example 8.2.1: polonium data

smooth.test(polonium,order=5,distr="pois",method="MLE",B=1000)

# the output
#
#Smooth goodness-of-fit test
#Null hypothesis: pois against 5 th order alternative
#Nuisance parameter estimation: MLE 
#Parameter estimates: 3.871549  ( lambda )
#
#Smooth test statistic S_k = 10.62199  p-value = 0.034 
#     2 th component V_k = -1.648833  p-value = 0.106 
#     3 th component V_k = 0.1551733  p-value = 0.89 
#     4 th component V_k = 2.80559  p-value = 0.02 
#     5 th component V_k = -0.08903458  p-value = 0.966 
#
#All p-values are obtained by the bootstrap with 1000 runs

