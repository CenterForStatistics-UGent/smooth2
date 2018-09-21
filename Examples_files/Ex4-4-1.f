c
c	Smooth Tests for Uniformity
c
c	e3.f
	implicit double precision (a-h,o-z)
	parameter(n=37)
	dimension hours(n),rmins(n),x(n)
	data hours/19,23,3,8,8,12,1,8,14,23,10,
     #  13,18,9,15,7,3,10,15,6,16,0,14,23,5,5,
     #  6,12,13,12,15,16,19,2,10,11,16/
	data rmins/2,8,56,12,40,25,24,25,2,46,7,
     #  53,45,6,57,40,2,45,6,26,44,26,17,45,8,
     #  49,32,40,30,55,22,9,46,28,6,19,31/
	do 1 i=1,n
1	x(i)=(60*hours(i)+ rmins(i))/1440
	u1=0
	u2=0
	u3=0
	u4=0
	d=dsqrt(dfloat(n))
	c1=dsqrt(3.d0)
	c2=dsqrt(5.d0)
	c3=dsqrt(7.d0)
	do 2 i=1,n
	y=x(i)
	u1=u1+c1*(2*y-1)/d
	u2=u2+c2*(6*y**2-6*y+1)/d
	u3=u3+c3*(20*y**3-30*y**2+12*y-1)/d
2	u4=u4+3.*(70*y**4-140*y**3+90*y**2-20*y+1)/d
	write(*,3)
3	format(//)
	write(*,*)'Birth Time Data, pp.12,61 in Rayner et al 2009 book'
	write(*,3)
	write(*,*)'U1,U2',u1,u2
	write(*,*)'U3,U4',u3,u4
	end