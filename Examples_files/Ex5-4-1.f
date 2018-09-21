c
c	Smooth Tests for Discrete Uniformity
c
c	e6.f
	implicit double precision (a-h,o-z)
	parameter(m=5)
	dimension f(n)
	data f/0,1,0,5,4/
	xs=0
	u1=0
	n=0
	c1=dsqrt(12.d0/(m*m-1.d0))
	c2=(m+1)/2.d0
	do 1 i=1,m
	n=n+f(i)
	xs=xs+f(i)**2
1	u1=u1+f(i)*c1*(i-c2)
	fn=float(n)
	d=dsqrt(fn)
	u1=u1/d
	u1s=u1**2
	r=m/fn
	xs=r*xs-1/r
	write(*,4)
4	format(//)
	write(*,*)'P and S Data,p.76 of Rayner et al 2009 book'
	write(*,4)
	write(*,*)'X**2,U1**2',xs,u1s
	end
