# Example 8.4.1: first library circulation data

lib1<-rep(1:7,c(65,26,12,10,5,3,1))

smooth.test((lib1-1),order=5,distr="geom",method="MLE",B=1000)

# the output
#
#Smooth goodness-of-fit test
#Null hypothesis: geom against 5 th order alternative
#Nuisance parameter estimation: MLE 
#Parameter estimates: 0.5020576  ( prob )
#
#Smooth test statistic S_k = 3.253078  p-value = 0.212 
#     2 th component V_k = -0.1378651  p-value = 0.978 
#     3 th component V_k = -0.9806227  p-value = 0.178 
#     4 th component V_k = 1.253118  p-value = 0.058 
#     5 th component V_k = -0.8379415  p-value = 0.178 
#
#All p-values are obtained by the bootstrap with 1000 runs



