# Example 6.2.2: Industrial data

# series (4)

data4<-c(0.0197,0.0236,0.0684,0.1882,0.1914,0.4329,0.5875,0.6283,
         0.7559,0.7862,0.7947,0.8158,0.8401,0.8434,0.8967,0.9105,
         0.9349,0.9717,0.9895,0.9934)

smooth.test(data4,order=6,distr="norm",method="MLE",B=1000)

# the output
#
#
#Smooth goodness-of-fit test
#Null hypothesis: norm against 6 th order alternative
#Nuisance parameter estimation: MLE 
#Parameter estimates: 0.63364 0.3388172  ( mean sd )
#
#Smooth test statistic S_k = 7.41113  p-value = 0.031 
#     3 th component V_k = -1.388079  p-value = 0.112 
#     4 th component V_k = -0.8927894  p-value = 0.308 
#     5 th component V_k = 1.999936  p-value = 0.002 
#     6 th component V_k = 0.829186  p-value = 0.296 
#
#All p-values are obtained by the bootstrap with 1000 runs

# the data driven test
ddsmooth.test(data4,distr="norm",method="MLE",horizon="order",
 criterion="BIC",max.order=6,B=1000)

# the output
#
Data-Driven Smooth goodness-of-fit test
Null hypothesis: norm against 6 th order alternative
Nuisance parameter estimation: MLE 
Parameter estimates: 0.63364 0.3388172  ( mean sd )
Horizon: order 
Selection criterion: BIC 

Data-Driven Smooth test statistic S_k = 1.926764  p-value = 0.092 
Selected model: 3 

All p-values are obtained by the bootstrap with 1000 runs





# series (5)

data5<-c(0.301,0.519,0.653,0.690,0.892,0.964,0.978,0.987,1.017,1.233,
         1.346,1.357,1.562,1.845,1.944)

smooth.test(data5,order=6,distr="norm",method="MLE",B=1000)

# the output
#
#Smooth goodness-of-fit test
#Null hypothesis: norm against 6 th order alternative
#Nuisance parameter estimation: MLE 
#Parameter estimates: 1.085867 0.4518286  ( mean sd )
#
#Smooth test statistic S_k = 0.810804  p-value = 0.753 
#     3 th component V_k = 0.4543936  p-value = 0.578 
#     4 th component V_k = -0.4994516  p-value = 0.882 
#     5 th component V_k = -0.5616516  p-value = 0.402 
#     6 th component V_k = 0.1985599  p-value = 0.974 
#
#All p-values are obtained by the bootstrap with 1000 runs
#

# the data driven test
ddsmooth.test(data5,distr="norm",method="MLE",horizon="order",
 criterion="BIC",max.order=6,B=1000)

# the output
#
#Data-Driven Smooth goodness-of-fit test
#Null hypothesis: norm against 6 th order alternative
#Nuisance parameter estimation: MLE 
#Parameter estimates: 1.085867 0.4518286  ( mean sd )
#Horizon: order 
#Selection criterion: BIC 
#
#Data-Driven Smooth test statistic S_k = 0.2064736  p-value = 0.553 
#Selected model: 3 
#
#All p-values are obtained by the bootstrap with 1000 runs



# series (6)

data6<-c(0.013,0.052,0.143,0.208,0.234,0.234,0.234,0.312,0.404,0.508,
  0.599,0.664,0.703,0.820,0.885,1.002,1.041,1.067,1.263,1.380,
  1.445,1.836,1.849,2.122,2.486,2.682,2.812)
 
smooth.test(data6,order=6,distr="norm",method="MLE",B=1000)

# the output
#
#Smooth goodness-of-fit test
#Null hypothesis: norm against 6 th order alternative
#Nuisance parameter estimation: MLE 
#Parameter estimates: 0.999926 0.8139984  ( mean sd )
#
#Smooth test statistic S_k = 6.630394  p-value = 0.043 
#     3 th component V_k = 1.701889  p-value = 0.05 
#     4 th component V_k = -0.4528544  p-value = 0.95 
#     5 th component V_k = -1.870349  p-value = 0.01 
#     6 th component V_k = 0.1751721  p-value = 0.934 
#
#All p-values are obtained by the bootstrap with 1000 runs
#

# the data driven test
ddsmooth.test(data6,distr="norm",method="MLE",horizon="order",
 criterion="BIC",max.order=6,B=1000)

# the output
#
#Data-Driven Smooth goodness-of-fit test
#Null hypothesis: norm against 6 th order alternative
#Nuisance parameter estimation: MLE 
#Parameter estimates: 0.999926 0.8139984  ( mean sd )
#Horizon: order 
#Selection criterion: BIC 
#
#Data-Driven Smooth test statistic S_k = 2.896425  p-value = 0.055 
#Selected model: 3 
#
#All p-values are obtained by the bootstrap with 1000 runs
#
