# Example 11.6.1: Foetal lamb movements

smooth.test(lamb,distr="ZIP",method="MLE",B=1000,order=5)

# the output
#
#Smooth goodness-of-fit test
#Null hypothesis: ZIP against 5 th order alternative
#Nuisance parameter estimation: MLE 
#Parameter estimates: 0.847367 0.5771251  ( lambda phi )
#
#Smooth test statistic S_k = 127.2116  p-value = 0 
#     2 th component V_k = 4.718071  p-value = 0.001 
#     3 th component V_k = 7.762407  p-value = 0 
#     4 th component V_k = 7.355656  p-value = 0 
#     5 th component V_k = 3.484691  p-value = 0.001 
#
#All p-values are obtained by the bootstrap with 1000 runs

smooth.test(lamb,distr="ZIP",method="MME",B=1000,order=5)

# the output
#
#Smooth goodness-of-fit test
#Null hypothesis:  ZIP  against  5 th order alternative
#Nuisance parameter estimation:  MME 
#Parameter estimates:  0.6978758 1.186047  ( p lambda )
#
#Smooth test statistic S_k =  24.00230  p-value =  0.001 
#     3 th compenent V_k =  21.92664  p-value =  0 
#     4 th compenent V_k =  0.6903107  p-value =  0.302 
#     5 th compenent V_k =  0.01249275  p-value =  0.886 
#
#All p-values are obtained by the bootstrap with  1000  runs

smooth.test(lamb,distr="ZIP",method="MME",B=1000,order=5,chol=T)

# the output
#
#Smooth goodness-of-fit test
#Null hypothesis:  ZIP  against  5 th order alternative
#Nuisance parameter estimation:  MME 
#Parameter estimates:  0.6978758 1.186047  ( p lambda )
#
#Smooth test statistic S_k =  24.00230  p-value =  0 
#     5 to 3 Cholesky compenent V_k =  0.019923  p-value =  0.838 
#     4 to 3 Cholesky compenent V_k =  2.055729  p-value =  0.046 
#     3 to 3 Cholesky compenent V_k =  21.92664  p-value =  0 
#
#All p-values are obtained by the bootstrap with  1000  runs

ddsmooth.test(lamb,distr="ZIP",method="MME",B=1000,max.order=5,
    horizon="order",criterion="AIC")

# the output
#
#Data-Driven Smooth goodness-of-fit test
#Null hypothesis:  ZIP  against  5 th order alternative
#Nuisance parameter estimation:  MME 
#Horizon:  order 
#Selection criterion:  AIC 
#
#Data-Driven Smooth test statistic S_k =  23.98237  p-value =  0.001 
#Selected model:  3 4 
#
#All p-values are obtained by the bootstrap with  1000  runs
#

ddsmooth.test(lamb,distr="ZIP",method="MME",B=1000,max.order=5,
    horizon="order",criterion="BIC")

# the output
#
#Data-Driven Smooth goodness-of-fit test
#Null hypothesis:  ZIP  against  5 th order alternative
#Nuisance parameter estimation:  MME 
#Horizon:  order 
#Selection criterion:  BIC 
#
#Data-Driven Smooth test statistic S_k =  21.92664  p-value =  0.001 
#Selected model:  3 
#
#All p-values are obtained by the bootstrap with  1000  runs

ddsmooth.test(lamb,distr="ZIP",method="MME",B=1000,max.order=5,
    horizon="subset",criterion="AIC")

# the output
#
#Data-Driven Smooth goodness-of-fit test
#Null hypothesis:  ZIP  against  5 th order alternative
#Nuisance parameter estimation:  MME 
#Horizon:  subset 
#Selection criterion:  AIC 
#
#Data-Driven Smooth test statistic S_k =  23.98237  p-value =  0 
#Selected model:  3 4 
#
#All p-values are obtained by the bootstrap with  1000  runs

ddsmooth.test(lamb,distr="ZIP",method="MME",B=1000,max.order=5,
    horizon="subset",criterion="BIC")

# the output
#
#Data-Driven Smooth goodness-of-fit test
#Null hypothesis:  ZIP  against  5 th order alternative
#Nuisance parameter estimation:  MME 
#Horizon:  subset 
#Selection criterion:  BIC 
#
#Data-Driven Smooth test statistic S_k =  21.92664  p-value =  0.003 
#Selected model:  3 
#
#All p-values are obtained by the bootstrap with  1000  runs


# removal of obs at 7
w<-c(182,41,12,2,2)
x<-0:4
lamb2<-rep(x,w)

smooth.test(lamb2,distr="ZIP",method="MLE",B=1000,order=5)

# the output
#
#Smooth goodness-of-fit test
#Null hypothesis:  ZIP  against  5 th order alternative
#Nuisance parameter estimation:  MLE 
#Parameter estimates:  0.5228067 0.6925792  ( p lambda )
#
#Smooth test statistic S_k =  3.492954  p-value =  0.189 
#     2 th compenent V_k =  1.174506  p-value =  0.229 
#     3 th compenent V_k =  0.6767098  p-value =  0.206 
#     4 th compenent V_k =  0.964556  p-value =  0.177 
#     5 th compenent V_k =  0.01172812  p-value =  0.859 
#
#All p-values are obtained by the bootstrap with  1000  runs

smooth.test(lamb2,distr="ZIP",method="MME",B=1000,order=5)

# the output
#
#Smooth goodness-of-fit test
#Null hypothesis:  ZIP  against  5 th order alternative
#Nuisance parameter estimation:  MME 
#Parameter estimates:  0.5647838 0.7594937  ( p lambda )
#
#Smooth test statistic S_k =  1.536200  p-value =  0.367 
#     3 th compenent V_k =  0.6077441  p-value =  0.356 
#     4 th compenent V_k =  1.047991  p-value =  0.204 
#     5 th compenent V_k =  0.01053572  p-value =  0.874 
#
#All p-values are obtained by the bootstrap with  1000  runs

smooth.test(lamb2,distr="ZIP",method="MME",B=1000,order=5,chol=T)

# the output
#
#Smooth goodness-of-fit test
#Null hypothesis:  ZIP  against  5 th order alternative
#Nuisance parameter estimation:  MME 
#Parameter estimates:  0.5647838 0.7594937  ( p lambda )
#
#Smooth test statistic S_k =  1.536200  p-value =  0.339 
#     5 to 3 Cholesky compenent V_k =  0.004155058  p-value =  0.928 
#     4 to 3 Cholesky compenent V_k =  0.9243012  p-value =  0.166 
#     3 to 3 Cholesky compenent V_k =  0.6077441  p-value =  0.338 
#
#All p-values are obtained by the bootstrap with  1000  runs


ddsmooth.test(lamb2,distr="ZIP",method="MME",B=1000,max.order=5,
    horizon="order",criterion="AIC")

# the output
#
#Data-Driven Smooth goodness-of-fit test
#Null hypothesis:  ZIP  against  5 th order alternative
#Nuisance parameter estimation:  MME 
#Horizon:  order 
#Selection criterion:  AIC 
#
#Data-Driven Smooth test statistic S_k =  0.6077441  p-value =  0.351 
#Selected model:  3 
#
#All p-values are obtained by the bootstrap with  1000  runs

ddsmooth.test(lamb2,distr="ZIP",method="MME",B=NULL,max.order=5,
    horizon="subset",criterion="AIC",plot=T)


ddsmooth.test(lamb2,distr="ZIP",method="MME",B=1000,max.order=5,
    horizon="order",criterion="BIC")

# the output
#
#Data-Driven Smooth goodness-of-fit test
#Null hypothesis:  ZIP  against  5 th order alternative
#Nuisance parameter estimation:  MME 
#Horizon:  order 
#Selection criterion:  BIC 
#
#Data-Driven Smooth test statistic S_k =  0.6077441  p-value =  0.359 
#Selected model:  3 
#
#All p-values are obtained by the bootstrap with  1000  runs

ddsmooth.test(lamb2,distr="ZIP",method="MME",B=1000,max.order=5,
    horizon="subset",criterion="AIC")

# the output
#
#Data-Driven Smooth goodness-of-fit test
#Null hypothesis:  ZIP  against  5 th order alternative
#Nuisance parameter estimation:  MME 
#Horizon:  subset 
#Selection criterion:  AIC 
#
#Data-Driven Smooth test statistic S_k =  1.047991  p-value =  0.32 
#Selected model:  4 
#
#All p-values are obtained by the bootstrap with  1000  runs

ddsmooth.test(lamb2,distr="ZIP",method="MME",B=1000,max.order=5,
    horizon="subset",criterion="BIC")

# the output
#
#Data-Driven Smooth goodness-of-fit test
#Null hypothesis:  ZIP  against  5 th order alternative
#Nuisance parameter estimation:  MME 
#Horizon:  subset 
#Selection criterion:  BIC 
#
#Data-Driven Smooth test statistic S_k =  1.047991  p-value =  0.292 
#Selected model:  4 
#
#All p-values are obtained by the bootstrap with  1000  runs
