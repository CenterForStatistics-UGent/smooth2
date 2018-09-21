# Example 1.4.4: Mississipi River Data

smooth.test(river,order=6,distr="norm",method="MLE",B=1000)

# The output
#
#Smooth goodness-of-fit test
#Null hypothesis: norm against 6 th order alternative
#Nuisance parameter estimation: MLE 
#Parameter estimates: 1355.78 338.0937  ( mean sd )
#
#Smooth test statistic S_k = 4.268263  p-value = 0.154 
#     3 th component V_k = 1.853743  p-value = 0.053 
#     4 th component V_k = 0.3183491  p-value = 0.727 
#     5 th component V_k = -0.7813746  p-value = 0.263 
#     6 th component V_k = -0.3464229  p-value = 0.620 
#
#All p-values are obtained by the bootstrap with 1000 runs