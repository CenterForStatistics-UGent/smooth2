# Example 6.2.1: Artificial data

# series 1
data1<-c(53,1,70,73,79,48,91,20,34,91,87,15,3,78,78,62,5,15,20,42)

smooth.test(data1,order=6,distr="norm",method="MLE",B=1000)

# the output
#
#Smooth goodness-of-fit test
#Null hypothesis: norm against 6 th order alternative
#Nuisance parameter estimation: MLE 
#Parameter estimates: 48.25 31.12053  ( mean sd )
#
#Smooth test statistic S_k = 4.726856  p-value = 0.088 
#     3 th component V_k = -0.2315646  p-value = 0.786 
#     4 th component V_k = -1.353316  p-value = 0.004 
#     5 th component V_k = 0.3550490  p-value = 0.6 
#     6 th component V_k = 1.647942  p-value = 0.004 
#
#All p-values are obtained by the bootstrap with 1000 runs

# series 2

data2<-c(-3,-454,116,6,-153,-46,-42,183,-87,-4,-191,36,97,-48,-48,56,92,-32,-361,-67)

smooth.test(data2,order=6,distr="norm",method="MLE",B=1000)

# the output
#
#Smooth goodness-of-fit test
#Null hypothesis: norm against 6 th order alternative
#Nuisance parameter estimation: MLE 
#Parameter estimates: -47.5 148.6746  ( mean sd )
#
#Smooth test statistic S_k = 9.220463  p-value = 0.016 
#     3 th component V_k = -2.161484  p-value = 0.014 
#     4 th component V_k = 1.189265  p-value = 0.068 
#     5 th component V_k = 1.095421  p-value = 0.1 
#     6 th component V_k = -1.390738  p-value = 0.02 
#
#All p-values are obtained by the bootstrap with 1000 runs
#

# series 3

data3<-c(4,1,2,2,3,4,1,2,4,5,5,2,3,3,6,5,10,0,9,3)

smooth.test(data3,order=6,distr="norm",method="MLE",B=1000)

# the output
#
#Smooth goodness-of-fit test
#Null hypothesis: norm against 6 th order alternative
#Nuisance parameter estimation: MLE 
#Parameter estimates: 3.7 2.45153  ( mean sd )
#
#Smooth test statistic S_k = 6.71538  p-value = 0.042 
#     3 th component V_k = 1.900377  p-value = 0.034 
#     4 th component V_k = 0.7099093  p-value = 0.184 
#     5 th component V_k = -1.219433  p-value = 0.062 
#     6 th component V_k = -1.054969  p-value = 0.104 
#
#All p-values are obtained by the bootstrap with 1000 runs


