# Example 1.4.2 (Birth-Time Data)

# k=2,3,4,6 and 8 classes
for(k in c(2,3,4,6,8)) {
  birth.class<-rep(NA,k)
  probs<-rep(1/k,k)
  for(i in 1:k) {
  	birth.class[i]<-sum(birth<=i*24/k)
  }
  birth.class[2:k]<-birth.class[2:k]-birth.class[1:(k-1)]

  print(cat("k=",k,"\n"))
  print(chisq.test(birth.class,p=probs))
}


# The Output
#
#k= 2 
#NULL
#
#	Chi-squared test for given probabilities
#
#data:  birth.class 
#X-squared = 0.027, df = 1, p-value = 0.8694
#
#k= 3 
#NULL
#
#	Chi-squared test for given probabilities
#
#data:  birth.class 
#X-squared = 3.9459, df = 2, p-value = 0.1390
#
#k= 4 
#NULL
#
#	Chi-squared test for given probabilities
#
#data:  birth.class 
#X-squared = 3.5405, df = 3, p-value = 0.3155
#
#k= 6 
#NULL
#
#	Chi-squared test for given probabilities
#
#data:  birth.class 
#X-squared = 5, df = 5, p-value = 0.4159
#
#k= 8 
#NULL
#
#	Chi-squared test for given probabilities
#
#data:  birth.class 
#X-squared = 3.8649, df = 7, p-value = 0.7952
#
#Warning message:
#In chisq.test(birth.class, p = probs) :
#  Chi-squared approximation may be incorrect
