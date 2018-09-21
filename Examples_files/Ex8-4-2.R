# Example 8.4.2: second library circulation data

lib2<-rep(1:16,c(63526,25653,11855,6055,3264,1727,931,497,275,124,68,28,13,6,9,4))

smooth.test((lib2-1),order=5,distr="geom",method="MLE",B=NULL)

# the output
#
#Smooth goodness-of-fit test
#Null hypothesis: geom against 5 th order alternative
#Nuisance parameter estimation: MLE 
#Parameter estimates: 0.5254028  ( prob )
#
#Smooth test statistic S_k = 1146.387  p-value = 6.671837e-247 
#     2 th component V_k = 30.24185  p-value = 6.678207e-201 
#     3 th component V_k = -14.4045  p-value = 4.848157e-47 
#     4 th component V_k = 4.596062  p-value = 4.305504e-06 
#     5 th component V_k = -1.790108  p-value = 0.07343648 
#
#All p-values are obtained by the asymptotical chi-square approximation
#





