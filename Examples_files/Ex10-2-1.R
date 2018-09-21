# Example 10.2.1: Industrial data series (4)

x<-data4

# parameter estimates
m<-mean(x)
s<-var(x)
n<-length(x)

# orthonormal polynomials 
g3<-orth.poly(3,distr="norm",pars=c(m,s))
g4<-orth.poly(4,distr="norm",pars=c(m,s))
g5<-orth.poly(5,distr="norm",pars=c(m,s))
g6<-orth.poly(6,distr="norm",pars=c(m,s))


# components
V3<-n*mean(g3(x))^2/var(g3(x))
V4<-n*mean(g4(x))^2/var(g4(x))
V5<-n*mean(g5(x))^2/var(g5(x))
V6<-n*mean(g6(x))^2/var(g6(x))

# the output
#
#> V3
#[1] 5.693851
#> V4
#[1] 1.677282
#> V5
#[1] 19.94121
#> V6
#[1] 3.3999

# p-values with the paramertic bootstrap
N<-10000
UB3<-rep(0,N)
UB4<-rep(0,N)
UB5<-rep(0,N)
UB6<-rep(0,N)
for (i in 1:N){
  xx<-rnorm(n,mean=m,sd=sqrt(s))
  UB3[i]<-n*mean(g3(xx))^2/var(g3(xx))
  UB4[i]<-n*mean(g4(xx))^2/var(g4(xx))
  UB5[i]<-n*mean(g5(xx))^2/var(g5(xx))
  UB6[i]<-n*mean(g6(xx))^2/var(g6(xx))
}
pU3<-sum(UB3>=V3)/N
pU4<-sum(UB4>=V4)/N
pU5<-sum(UB5>=V5)/N
pU6<-sum(UB6>=V6)/N

# the output: p-values
#
#> pU3
#[1] 0.0235
#> pU4
#[1] 0.2127
#> pU5
#[1] 4e-04
#> pU6
#[1] 0.0786

# --> include theta 5

# parameter estimate of theta5
theta5<-mean(g5(x))

# construct improved density
fimp<-function(x) {
  dnorm(x,mean=m,sd=sqrt(s))*(1+theta5*g5(x))
}

# the ``parametric start''
fnull<-function(x) dnorm(x,mean=m,sd=sqrt(s))

# corrected improved density (method of Gajek)
tmp2<-gajek(fimp,fnull,-2,2,N=100)


# a plot of the improved density
epsilon<-tmp2$epsilon
fc.gajek<-tmp2$fc
sx<-seq(-2,5,0.01)
plot(sx,fnull(sx),type="l")
lines(sx,fc.gajek(sx),lty=2)



# denominator of the smooth test statistic for improved models
denom<-1+theta5*g5(x)
# the components
V3<-n*mean(g3(x)/denom)^2/var(g3(x)/denom)
V4<-n*mean(g4(x)/denom)^2/var(g4(x)/denom)
V5<-n*mean(g5(x)/denom)^2/var(g5(x)/denom)
V6<-n*mean(g6(x)/denom)^2/var(g6(x)/denom)

# the output
#> V3
#[1] 2.829976
#> V4
#[1] 1.210397
#> V5
#[1] 12.50804
#> V6
#[1] 2.530735


# bootstrap p-values
N<-100
UB3<-rep(0,N)
UB4<-rep(0,N)
UB5<-rep(0,N)
UB6<-rep(0,N)
for (i in 1:N){
  xx<-rimp(n=n,fc=fc.gajek,mean=m,var=s)
  UB3[i]<-n*mean(g3(xx))^2/var(g3(xx)/denom)
  UB4[i]<-n*mean(g4(xx))^2/var(g4(xx)/denom)
  UB5[i]<-n*mean(g5(xx))^2/var(g5(xx)/denom)
  UB6[i]<-n*mean(g6(xx))^2/var(g6(xx)/denom)
}
pU3<-sum(UB3>=V3)/N
pU4<-sum(UB4>=V4)/N
pU5<-sum(UB5>=V5)/N
pU6<-sum(UB6>=V6)/N

# the output: p-values 
#> pU3
#[1] 0.37
#> pU4
#[1] 0.38
#> pU5
#[1] 0.06
#> pU6
#[1] 0.14

# --> no more terms to be included!

# a final plot of the improved density
sx<-seq(-2,5,0.01)
hist(x,prob=T,main="",breaks=seq(-0.10,1.10,0.2))
#lines(density(x),lty=3)
lines(sx,fnull(sx),type="l",lty=1)
lines(sx,fc.gajek(sx),lty=2)
dev.off()
