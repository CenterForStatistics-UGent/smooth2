c
c	Smooth Tests for the Extreme Value
c	e11.f
	implicit double precision (a-h,o-z)
	parameter(n=65)
	dimension x(n)
	data x/4.03,3.83,3.65,3.88,4.01,4.08,4.18,3.8,4.36,3.96,
     #  3.98,4.69,3.85,3.96,3.85,3.93,3.75,3.63,3.57,4.25,3.97,4.05,4.24
     #  ,4.22,3.73,4.37,4.06,3.71,3.96,4.06,4.55,3.79,3.89,4.11,3.85,
     #  2*3.86,4.21,4.01,4.11,4.24,3.96,4.21,3.74,3.85,3.88,3.66,4.11,
     #  3.78,3.91,3.72,4.,3.66,3.62,4.33,4.55,3.75,4.08,3.9,3.88,3.94,
     #	3.71,4.18,3.9,4.33/
	pi=3.14159265358979324d0
	g=.5772156649d0
	a=0
	v=0
	do 1 i=1,n
	v=v+x(i)**2
1	a=a+x(i)
	a=a/n
	v=v/n-a**2
	d=dsqrt(dfloat(n))
	c=(dsqrt(6.d0))/pi
	be=c*dsqrt(v)
	al=a-g*be
	write(*,4)
	write(*,*)'al,be',al,be
	c31=.1060499473d0
	c32=-.4944037009d0
	c34=.5583053486d0
	c41=.02493263957d0
	c42=-.2416834738d0
	c43=.2690771426d0
	c45=-.2258794507d0
	u3=0
	u4=0
	do 2 i=1,n
	y=(x(i)-al)/be-g
	u3=u3+(c31*y**3+c32*y*y+c34)/d
2	u4=u4+(c41*y**4+c42*y**3+c43*y*y+c45)/d	
	u3s=u3**2
	u4s=u4**2
	write(*,4)
4	format(//)
	write(*,*)'Sea Level Data,p.231 of Rayner et al 2009 book'
	write(*,4)
	write(*,*)'U3^2,U4^2',u3s,u4s
        end