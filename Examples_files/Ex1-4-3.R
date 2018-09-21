# Example 1.4.3: Chemical Concentration Data

smooth.test(PCB,order=6,distr="norm",method="MLE",B=1000)

# The output
#
#Smooth goodness-of-fit test
#Null hypothesis: norm against 6 th order alternative
#Nuisance parameter estimation: MLE 
#Parameter estimates: 210 72.26383  ( mean sd )
#
#Smooth test statistic S_k = 10.18261  p-value = 0.026 
#     3 th component V_k = 2.33172  p-value = 0.017 
#     4 th component V_k = 2.030242  p-value = 0.022 
#     5 th component V_k = 0.4343416  p-value = 0.530 
#     6 th component V_k = -0.6596619  p-value = 0.328 
#
#All p-values are obtained by the bootstrap with 1000 runs