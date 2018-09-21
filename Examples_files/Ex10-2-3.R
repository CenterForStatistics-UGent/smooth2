# Example 10.2.3: Angus data (operational lifetimes)

x<-lifetimes

# nuisance parameter estimates
m<-1/mean(x)
n<-length(x)

# the orthonormal polynomials
g2<-orth.poly(2,distr="exp",pars=c(m))
g3<-orth.poly(3,distr="exp",pars=c(m))
g4<-orth.poly(4,distr="exp",pars=c(m))
g5<-orth.poly(5,distr="exp",pars=c(m))
g6<-orth.poly(6,distr="exp",pars=c(m))

# the theta parameter estimates
theta2<-mean(g2(x))
theta3<-mean(g3(x))
theta4<-mean(g4(x))
theta5<-mean(g5(x))
theta6<-mean(g6(x))

# a function that generates the denominator of the smooth test statistic for improved models
denomf<-function(x,S) {
  d<-1
  for(j in S) {
    if(j==2) d<-d+theta2*g2(x)
    if(j==3) d<-d+theta3*g3(x)
    if(j==4) d<-d+theta4*g4(x)
    if(j==5) d<-d+theta5*g5(x)
    if(j==6) d<-d+theta6*g6(x)
  }
  return(d)
}

# the components
V2<-n*mean(g2(x)/denomf(x,c(3,4,5,6)))^2/var(g2(x)/denomf(x,c(3,4,5,6)))
V3<-n*mean(g3(x)/denomf(x,c(2,4,5,6)))^2/var(g3(x)/denomf(x,c(2,4,5,6)))
V4<-n*mean(g4(x)/denomf(x,c(2,3,5,6)))^2/var(g4(x)/denomf(x,c(2,3,5,6)))
V5<-n*mean(g5(x)/denomf(x,c(2,3,4,6)))^2/var(g5(x)/denomf(x,c(2,3,4,6)))
V6<-n*mean(g6(x)/denomf(x,c(2,3,4,5)))^2/var(g6(x)/denomf(x,c(2,3,4,5)))


# the output
#> V2
#[1] 6.567121
#> V3
#[1] 21.68386
#> V4
#[1] 21.42784
#> V5
#[1] 5.303857
#> V6
#[1] 0.7822281

# since only V6 is very small, we compute only this p-value

# improved density
fimp<-function(x) {
  dexp(x,rate=m)*denomf(x,c(2,3,4,5))
}
fnull<-function(x) dexp(x,rate=m)
tmp2<-gajek(fimp,fnull,0,50,N=10000)

# a plot of the improved density estimate
epsilon<-tmp2$epsilon
fc.gajek<-tmp2$fc
sx<-seq(0,20,0.01)
hist(x,prob=T)
lines(sx,fnull(sx),type="l",lty=2)
lines(sx,fc.gajek(sx),lty=1)


# parametric bootstrap p-value
N<-1000
UB6<-rep(0,N)
for (i in 1:N){
  xx<-rimp(n=n,fc=fc.gajek,rate=m)
  UB6[i]<-n*mean(g6(xx)/denomf(xx,c(2,3,4,5)))^2/var(g6(xx)/denomf(xx,c(2,3,4,5)))
}
pU6<-sum(UB6>=V6)/N

# the output: p-values
#> pU6
#[1] 0.432

# --> remove theta6

# new components
V2<-n*mean(g2(x)/denomf(x,c(3,4,5)))^2/var(g2(x)/denomf(x,c(3,4,5)))
V3<-n*mean(g3(x)/denomf(x,c(2,4,5)))^2/var(g3(x)/denomf(x,c(2,4,5)))
V4<-n*mean(g4(x)/denomf(x,c(2,3,5)))^2/var(g4(x)/denomf(x,c(2,3,5)))
V5<-n*mean(g5(x)/denomf(x,c(2,3,4)))^2/var(g5(x)/denomf(x,c(2,3,4)))
V6<-n*mean(g6(x)/denomf(x,c(2,3,4,5)))^2/var(g6(x)/denomf(x,c(2,3,4,5)))

# the output
#> V2
#[1] 6.471516
#> V3
#[1] 21.49964
#> V4
#[1] 21.74689
#> V5
#[1] 5.651383
#> V6
#[1] 0.7822281

# since only V2 and V5 are very small, I compute only these p-value

# improved density
fimp<-function(x) {
  dexp(x,rate=m)*denomf(x,c(3,4,5))
}
fnull<-function(x) dexp(x,rate=m)
tmp2<-gajek(fimp,fnull,0,50,N=10000)

# a plot of the improved density
epsilon<-tmp2$epsilon
fc.gajek<-tmp2$fc
sx<-seq(0,20,0.01)
hist(x,prob=T)
lines(sx,fnull(sx),type="l",lty=2)
lines(sx,fc.gajek(sx),lty=1)


# parametric bootstrap p-values
N<-5000
UB2<-rep(0,N)
for (i in 1:N){
  xx<-rimp(n=n,fc=fc.gajek,rate=m)
  UB2[i]<-n*mean(g2(xx)/denomf(xx,c(3,4,5)))^2/var(g2(xx)/denomf(xx,c(3,4,5)))
}
pU2<-sum(UB2>=V2)/N

# the output: p-values
#> pU2
#[1] 0.0524

# improved density
fimp<-function(x) {
  dexp(x,rate=m)*denomf(x,c(2,3,4))
}
fnull<-function(x) dexp(x,rate=m)
tmp2<-gajek(fimp,fnull,0,50,N=10000)

# a plot of the improved density
epsilon<-tmp2$epsilon
fc.gajek<-tmp2$fc
sx<-seq(0,20,0.01)
hist(x,prob=T)
lines(sx,fnull(sx),type="l",lty=2)
lines(sx,fc.gajek(sx),lty=1)


# parametric bootstrap p-value
N<-1000
UB5<-rep(0,N)
for (i in 1:N){
  xx<-rimp(n=n,fc=fc.gajek,rate=m)
  UB5[i]<-n*mean(g5(xx)/denomf(xx,c(2,3,4)))^2/var(g5(xx)/denomf(xx,c(2,3,4)))
}
pU5<-sum(UB5>=V5)/N

# the output: ;p-values
#> pU5
#[1] 0.109


# --> remove theta5

# new components
V2<-n*mean(g2(x)/denomf(x,c(3,4)))^2/var(g2(x)/denomf(x,c(3,4)))
V3<-n*mean(g3(x)/denomf(x,c(2,4)))^2/var(g3(x)/denomf(x,c(2,4)))
V4<-n*mean(g4(x)/denomf(x,c(2,3)))^2/var(g4(x)/denomf(x,c(2,3)))
V5<-n*mean(g5(x)/denomf(x,c(2,3,4)))^2/var(g5(x)/denomf(x,c(2,3,4)))
V6<-n*mean(g6(x)/denomf(x,c(2,3,4)))^2/var(g6(x)/denomf(x,c(2,3,4)))

# the output
#> V2
#[1] 6.472207
#> V3
#[1] 21.48782
#> V4
#[1] 23.03010
#> V5
#[1] 5.651383
#> V6
#[1] 1.181050

# since only V2 is very small, we compute only this p-value

# improved density
fimp<-function(x) {
  dexp(x,rate=m)*denomf(x,c(3,4))
}
fnull<-function(x) dexp(x,rate=m)
tmp2<-gajek(fimp,fnull,0,50,N=10000)

# a plot of the improved density
epsilon<-tmp2$epsilon
fc.gajek<-tmp2$fc
sx<-seq(0,20,0.01)
hist(x,prob=T)
lines(sx,fnull(sx),type="l",lty=2)
lines(sx,fc.gajek(sx),lty=1)


# parametric bootstrap p-values
N<-5000
UB2<-rep(0,N)
for (i in 1:N){
  xx<-rimp(n=n,fc=fc.gajek,rate=m)
  UB2[i]<-n*mean(g2(xx)/denomf(xx,c(3,4)))^2/var(g2(xx)/denomf(xx,c(3,4)))
}
pU2<-sum(UB2>=V2)/N

# the output: p-values
#> pU2
#[1] 0.0524

