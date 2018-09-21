# Example 8.2.2: Aluminium defects data

smooth.test(aluminium,order=5,distr="pois",method="MLE",B=1000)

# the output
#
#Smooth goodness-of-fit test
#Null hypothesis: pois against 5 th order alternative
#Nuisance parameter estimation: MLE 
#Parameter estimates: 1.999  ( lambda )
#
#Smooth test statistic S_k = 5.100857  p-value = 0.206 
#     2 th component V_k = 2.17006  p-value = 0.021 
#     3 th component V_k = -0.2531372  p-value = 0.766 
#     4 th component V_k = 0.01256290  p-value = 0.948 
#     5 th component V_k = -0.5722425  p-value = 0.484 
#
#All p-values are obtained by the bootstrap with 1000 runs
#
