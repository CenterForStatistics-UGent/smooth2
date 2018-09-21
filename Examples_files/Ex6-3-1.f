c
c	Smooth Tests for Exponentiality
c	e5.f
	implicit double precision (a-h,o-z)
	parameter(n=20)
	dimension x(n)
	data x/6278,3113,5236,11584,12628,7725,8604,14266,
     #  6125,9350,3212,9003,3523,12888,9460,13431,17809,
     #  2812,11825,2398/
	a=0
	do 1 i=1,n
1	a=a+x(i)
	a=a/n
	d=dsqrt(dfloat(n))
	u2=0
	u3=0
	u4=0
	do 2 i=1,n
	y=x(i)/a
	u2=u2+(1-2*y+.5*y**2)/d
	u3=u3+(1-3*y+1.5*y**2-(y**3)/6)/d
2	u4=u4+(1-4*y+3*y**2-2*(y**3)/3+(y**4)/24)/d
	s3=u2**2+u3**2+u4**2	
	write(*,4)
4	format(//)
	write(*,*)'Angus Data,p.215 of Rayner et al 2009 book'
	write(*,4)
	write(*,*)'S3',S3
	end
