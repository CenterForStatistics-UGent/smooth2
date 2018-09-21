# Example 1.4.1: Weldon's Dice Data

r<-0:12
probs<-choose(12,r)*(1/3)^r*(2/3)^(12-r)

chisq.test(dice.n,p=probs)


#	Chi-squared test for given probabilities
#
#data:  dice.n 
#X-squared = 41.3122, df = 12, p-value = 4.345e-05
#
#Warning message:
#In chisq.test(dice.n, p = probs) :
#  Chi-squared approximation may be incorrect

