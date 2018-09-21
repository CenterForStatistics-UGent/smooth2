# Example 7.3.1: Prussian army horsekicks

smooth.test(prusian.years,order=5,distr="pois",method="MLE",B=1000)

# the outpur
#
#Smooth goodness-of-fit test
#Null hypothesis: pois against 5 th order alternative
#Nuisance parameter estimation: MLE 
#Parameter estimates: 9.8  ( lambda )
#
#Smooth test statistic S_k = 8.98556  p-value = 0.038 
#     2 th component V_k = 2.762153  p-value = 0.022 
#     3 th component V_k = -0.8424436  p-value = 0.304 
#     4 th component V_k = -0.80395  p-value = 0.266 
#     5 th component V_k = 0.005114728  p-value = 0.95 
#
#All p-values are obtained by the bootstrap with 1000 runs


