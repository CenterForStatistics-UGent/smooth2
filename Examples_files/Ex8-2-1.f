c
c	Smooth Tests for the Poisson
c	e7.f
	implicit double precision (a-h,o-z)
	parameter(n=2608)
	dimension x(n)
	data x/57*0,203*1,383*2,525*3,532*4,408*5,273*6,
     #  139*7,45*8,27*9,10*10,4*11,13,14/
	a=0
	do 1 i=1,n
1	a=a+x(i)
	a=a/n
	d=dsqrt(dfloat(n))
	u2=0
	u3=0
	u4=0
	c2=d*dsqrt(2*a**2)
	c3=d*dsqrt(6*a**3)
	c4=d*dsqrt(24*a**4)
	do 2 i=1,n
	t=x(i)-a
	u2=u2+(t**2-t-a)/c2
	u3=u3+(t**3-3*t**2+(2-3*a)*t+2*a)/c3
2	u4=u4+(t**4-6*t**3+(11-6*a)*t*t+(14*a-6)*t+3*a*a-6*a)/c4
	s3=u2**2+u3**2+u4**2	
	write(*,4)
4	format(//)
	write(*,*)'Decay Data,p.160 of Rayner et al 2009 book'
	write(*,4)
	write(*,*)'S3,U2,U3,U4',S3,u2,u3,u4
	end
