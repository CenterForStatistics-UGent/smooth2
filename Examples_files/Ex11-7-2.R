# Example 11.7.2: Annual maximum December temperatures at Fair Isle

# prepare the data for the GPD
FairIsle1<-FairIsle[-which.min(FairIsle)]-min(FairIsle)

FairIsle2<-FairIsle1[-which.min(FairIsle1)]-min(FairIsle1)

FairIsle3<-FairIsle2[-which.min(FairIsle2)]-min(FairIsle2)

smooth.test(FairIsle1,distr="genpareto",method="MME",order=4,chol=T,B=1000)

# the output
#
#Smooth goodness-of-fit test
#Null hypothesis: genpareto against 4 th order alternative
#Nuisance parameter estimation: MME 
#Parameter estimates: 25.0424 8.649365  ( scale -shape )
#
#Smooth test statistic S_k = 110.0640  p-value = 0 
#     3 to 3 Cholesky component V_k = 3.438771  p-value = 0 
#     3 to 4 Cholesky component V_k = 9.911552  p-value = 0 
#
#All p-values are obtained by the bootstrap with 1000 runs

smooth.test(FairIsle2,distr="genpareto",method="MME",order=4,chol=T,B=1000)

# the output
#
#Smooth goodness-of-fit test
#Null hypothesis: genpareto against 4 th order alternative
#Nuisance parameter estimation: MME 
#Parameter estimates: 2.925657 1.544049  ( scale -shape )
#
#Smooth test statistic S_k = 28.11174  p-value = 0.013
#     3 to 3 Cholesky component V_k = 1.728780  p-value = 0.174 
#     3 to 4 Cholesky component V_k = 5.01229  p-value = 0.012 
#
#All p-values are obtained by the bootstrap with 1000 runs

smooth.test(FairIsle3,distr="genpareto",method="MME",order=4,chol=T,B=1000)

# the output
#
#Smooth goodness-of-fit test
#Null hypothesis: genpareto against 4 th order alternative
#Nuisance parameter estimation: MME 
#Parameter estimates: 2.221014 1.221014  ( scale -shape )
#
#Smooth test statistic S_k = 27.59942  p-value = 0.011 
#     3 to 3 Cholesky component V_k = 1.213290  p-value = 0.326 
#     3 to 4 Cholesky component V_k = 5.111492  p-value = 0.02 
#
#All p-values are obtained by the bootstrap with 1000 runs


