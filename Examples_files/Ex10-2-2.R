# Example 10.2.2: Angus data (operational lifetimes)

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

# the components
V2<-n*mean(g2(x))^2/var(g2(x))
V3<-n*mean(g3(x))^2/var(g3(x))
V4<-n*mean(g4(x))^2/var(g4(x))
V5<-n*mean(g5(x))^2/var(g5(x))
V6<-n*mean(g6(x))^2/var(g6(x))


# the output
#
#> V2
#[1] 10.72430
#> V3
#[1] 28.12168
#> V4
#[1] 23.14275
#> V5
#[1] 4.652365
#> V6
#[1] 0.2335233

# parametric bootstrap p-values
N<-2000
UB2<-rep(0,N)
UB3<-rep(0,N)
UB4<-rep(0,N)
UB5<-rep(0,N)
UB6<-rep(0,N)
for (i in 1:N){
  xx<-rexp(n,rate=m)
  UB2[i]<-n*mean(g2(xx))^2/var(g2(xx))
  UB3[i]<-n*mean(g3(xx))^2/var(g3(xx))
  UB4[i]<-n*mean(g4(xx))^2/var(g4(xx))
  UB5[i]<-n*mean(g5(xx))^2/var(g5(xx))
  UB6[i]<-n*mean(g6(xx))^2/var(g6(xx))
}
pU2<-sum(UB2>=V2)/N
pU3<-sum(UB3>=V3)/N
pU4<-sum(UB4>=V4)/N
pU5<-sum(UB5>=V5)/N
pU6<-sum(UB6>=V6)/N

# the output: p-values
#> pU2
#[1] 0.0075
#> pU3
#[1] 0
#> pU4
#[1] 0
#> pU5
#[1] 0.038
#> pU6
#[1] 0.655

# --> include theta3

# the estimate of theta3
theta3<-mean(g3(x))

# improved density
fimp<-function(x) {
  dexp(x,rate=m)*(1+theta3*g3(x))
}
# the parametric start
fnull<-function(x) dexp(x,rate=m)

# the Gajek corrected improved density
tmp2<-gajek(fimp,fnull,0,50,N=10000)

# a graph of the improved density
epsilon<-tmp2$epsilon
fc.gajek<-tmp2$fc
sx<-seq(0,40,0.01)
plot(sx,fnull(sx),type="l")
lines(sx,fc.gajek(sx),lty=3)



# the denominator of the smooth test for improved densities
denom<-1+theta3*g3(x)
# the components
V2<-n*mean(g2(x)/denom)^2/var(g2(x)/denom)
V3<-n*mean(g3(x)/denom)^2/var(g3(x)/denom)
V4<-n*mean(g4(x)/denom)^2/var(g4(x)/denom)
V5<-n*mean(g5(x)/denom)^2/var(g5(x)/denom)
V6<-n*mean(g6(x)/denom)^2/var(g6(x)/denom)

# the output
#> V2
#[1] 7.449557
#> V3
#[1] 24.27266
#> V4
#[1] 21.82793
#> V5
#[1] 4.729927
#> V6
#[1] 0.4861347


# and the parametric p-values
N<-1000
UB2<-rep(0,N)
UB3<-rep(0,N)
UB4<-rep(0,N)
UB5<-rep(0,N)
UB6<-rep(0,N)
for (i in 1:N){
  xx<-rimp(n=n,fc=fc.gajek,rate=m)
  UB2[i]<-n*mean(g2(xx))^2/var(g2(xx)/denom)
  UB3[i]<-n*mean(g3(xx))^2/var(g3(xx)/denom)
  UB4[i]<-n*mean(g4(xx))^2/var(g4(xx)/denom)
  UB5[i]<-n*mean(g5(xx))^2/var(g5(xx)/denom)
  UB6[i]<-n*mean(g6(xx))^2/var(g6(xx)/denom)

}
pU2<-sum(UB2>=V2)/N
pU3<-sum(UB3>=V3)/N
pU4<-sum(UB4>=V4)/N
pU5<-sum(UB5>=V5)/N
pU6<-sum(UB6>=V6)/N

# the output: p-values 
#> pU2
#[1] 0.154
#> pU3
#[1] 0.036
#> pU4
#[1] 0.019
#> pU5
#[1] 0.109
#> pU6
#[1] 0.585

# --> include theta4

# estimate of theta4
theta4<-mean(g4(x))

# improved density
fimp<-function(x) {
  dexp(x,rate=m)*(1+theta3*g3(x)+theta4*g4(x))
}
fnull<-function(x) dexp(x,rate=m)
tmp2<-gajek(fimp,fnull,0,50,N=10000)

# and a plot of the improved density
epsilon<-tmp2$epsilon
fc.gajek<-tmp2$fc
sx<-seq(0,40,0.01)
plot(sx,fnull(sx),type="l")
lines(sx,fc.gajek(sx),lty=3)

sx<-seq(0,40,0.01)
plot(density(x))
lines(sx,fnull(sx),type="l")
lines(sx,fc.gajek(sx),lty=3)



# the denominator of the smooth test statistic
denom<-1+theta3*g3(x)+theta4*g4(x)
# the components
V2<-n*mean(g2(x)/denom)^2/var(g2(x)/denom)
V3<-n*mean(g3(x)/denom)^2/var(g3(x)/denom)
V4<-n*mean(g4(x)/denom)^2/var(g4(x)/denom)
V5<-n*mean(g5(x)/denom)^2/var(g5(x)/denom)
V6<-n*mean(g6(x)/denom)^2/var(g6(x)/denom)

# the output
#> V2
#[1] 6.472207
#> V3
#[1] 22.72951
#> V4
#[1] 18.58918
#> V5
#[1] 3.265113
#> V6
#[1] 0.2607718

# parametric bootstrap p-values
N<-1000
UB2<-rep(0,N)
UB3<-rep(0,N)
UB4<-rep(0,N)
UB5<-rep(0,N)
UB6<-rep(0,N)
for (i in 1:N){
  xx<-rimp(n=n,fc=fc.gajek,rate=m)
  UB2[i]<-n*mean(g2(xx))^2/var(g2(xx)/denom)
  UB3[i]<-n*mean(g3(xx))^2/var(g3(xx)/denom)
  UB4[i]<-n*mean(g4(xx))^2/var(g4(xx)/denom)
  UB5[i]<-n*mean(g5(xx))^2/var(g5(xx)/denom)
  UB6[i]<-n*mean(g6(xx))^2/var(g6(xx)/denom)
}
pU2<-sum(UB2>=V2)/N
pU3<-sum(UB3>=V3)/N
pU4<-sum(UB4>=V4)/N
pU5<-sum(UB5>=V5)/N
pU6<-sum(UB6>=V6)/N

# the output: p-values 
#> pU2
#[1] 0.289
#> pU3
#[1] 0.173
#> pU4
#[1] 0.13
#> pU5
#[1] 0.358
#> pU6
#[1] 0.743

# --> no more terms to be included

# and final plot of the improved density
sx<-seq(0,20,0.01)

hist(x,prob=T,xlab="lifetime",main="",breaks=seq(0,20,2))
lines(sx,fnull(sx),type="l",lty=2)
lines(sx,fc.gajek(sx),lty=1)


