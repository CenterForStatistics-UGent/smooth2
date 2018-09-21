# Example 5.5: Consumer preference studies

# the data
# the 18 raw observations
x<-c(1,rep(2,3),rep(4,6),rep(5,3),rep(6,5))
# and in a count vector
n<-c(1,3,0,6,3,5)

# define the discrete unform distribution
p<-function(x) {
  prob<-rep(1/6,length(x))
  prob[(x<0)|(x>6)]<-0  
  return(prob)
}

# construct the orthonormal polynomials manually
op1<-orth.poly(degree=1,distr="otherwise",f=p,typedistr="disc")
op2<-orth.poly(degree=2,distr="otherwise",f=p,typedistr="disc")
op3<-orth.poly(degree=3,distr="otherwise",f=p,typedistr="disc")
op4<-orth.poly(degree=4,distr="otherwise",f=p,typedistr="disc")
op5<-orth.poly(degree=5,distr="otherwise",f=p,typedistr="disc")
op6<-orth.poly(degree=6,distr="otherwise",f=p,typedistr="disc")

# The components
V1<-sum(op1(x))/sqrt(length(x))
V2<-sum(op2(x))/sqrt(length(x))
V3<-sum(op3(x))/sqrt(length(x))
V4<-sum(op4(x))/sqrt(length(x))
V5<-sum(op5(x))/sqrt(length(x))
V6<-sum(op6(x))/sqrt(length(x))
V1^2+V2^2+V3^2+V4^2+V5^2+V6^2
V1
V2

# Pearson chi-squared statistic
chisq.test(n,p=rep(1/6,6))


# The output
#
#[1] 8.666667
#> V1
#[1] 1.794170
#> V2
#[1] -1.316261e-14
#> 
#> # Pearson chi-squared statistic
#> chisq.test(n,p=rep(1/6,6))
#
#	Chi-squared test for given probabilities
#
#data:  n 
#X-squared = 8.6667, df = 5, p-value = 0.1231
#
#Warning message:
#In chisq.test(n, p = rep(1/6, 6)) :
#  Chi-squared approximation may be incorrect
#
