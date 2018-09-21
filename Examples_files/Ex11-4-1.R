# Example 11.4.1: Port Pirie annual maximum sea-levels

smooth.test(sea,order=4,distr="extrval",method="MME",B=1000)

# the output
#
#Smooth goodness-of-fit test
#Null hypothesis: extrval against 4 th order alternative
#Nuisance parameter estimation: MME 
#Parameter estimates: 3.873208 0.1860791  ( location scale )
#
#Smooth test statistic S_k = 0.5189252  p-value = 0.521 
#     3 th component V_k = -0.6137326  p-value = 0.644 
#     4 th component V_k = 0.5379025  p-value = 0.64 
#
#All p-values are obtained by the bootstrap with 1000 runs
