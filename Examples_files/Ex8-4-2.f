c
c	Smooth Tests for the Geometric
c	e8.f
	implicit double precision (a-h,o-z)
	parameter(n=122)
	dimension x(n)
	data x/65*0,26*1,12*2,10*3,5*4,3*5,6/
	a=0
	do 1 i=1,n
1	a=a+x(i)
	a=a/n
	p=1/(a+1)
	write(*,4)
	write(*,*)'p',p
	q=1-p
	d=dsqrt(dfloat(n))
	u2=0
	u3=0
	c2=d*2*q
	c3=d*6*q*dsqrt(q)
	do 2 i=1,n
	t=x(i)-a
	u2=u2+(p*p*t**2-(q+1)*p*t-q)/c2
	u3=u3+(p*p*p*t**3+3*p*p*(p-2)*t**2+p*(2*p*p+3*p-6)*t
2     #  +2*q*(1+q))/c3
	write(*,4)
4	format(//)
	write(*,*)'Library Data,p.175 of Rayner et al 2009 book'
	write(*,4)
	write(*,*)'U2,U3',u2,u3
	end
