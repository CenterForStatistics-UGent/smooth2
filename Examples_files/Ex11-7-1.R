# Example 11.7.1: Operational life time example

# prepare data for the GPD
lifetimes1<-lifetimes[-which.min(lifetimes)]-min(lifetimes)



smooth.test(lifetimes1,distr="genpareto",method="MME",order=4,chol=T,B=1000)

# the output
#
#Smooth goodness-of-fit test
#Null hypothesis: genpareto against 4 th order alternative
#Nuisance parameter estimation: MME 
#Parameter estimates: 10.97237 0.6906582  ( scale -shape )
#
#Smooth test statistic S_k = 1.607093  p-value = 0.422 
#     3 to 3 Cholesky component V_k = -0.3305957  p-value = 0.692 
#     3 to 4 Cholesky component V_k = 1.223846  p-value = 0.458 
#
#All p-values are obtained by the bootstrap with 1000 runs
#
