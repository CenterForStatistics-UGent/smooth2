# Example 6.3.1: Operational lifetime data


smooth.test(lifetimes,order=5,distr="exp",method="MLE",B=1000)

# the output
#
#Smooth goodness-of-fit test
#Null hypothesis: exp against 5 th order alternative
#Nuisance parameter estimation: MLE 
#Parameter estimates: 0.1167747  ( rate )
#
#Smooth test statistic S_k = 8.769788  p-value = 0.015 
#     2 th component V_k = -1.662699  p-value = 0 
#     3 th component V_k = 1.856696  p-value = 0.006 
#     4 th component V_k = -1.402018  p-value = 0.026 
#     5 th component V_k = 0.7695728  p-value = 0.192 
#
#All p-values are obtained by the bootstrap with 1000 runs
#
