c
c	Smooth Tests for the Logistic
c	e9.f
	implicit double precision (a-h,o-z)
	parameter(n=10,ns=100000)
	dimension x(n)
	data x/785,855,905,918,919,920,929,936,948,950/
	pi=3.14159265358979324d0
	ix=55689
	iy=13002
	iz=91874
	a=0
	v=0
	do 1 i=1,n
	v=v+x(i)**2
1	a=a+x(i)
	a=a/n
	v=v/n-a**2
	d=dsqrt(dfloat(n))
	c=dsqrt(3.d0)/pi
	al=a
	be=c*dsqrt(v)
	c3=5*dsqrt(7.d0)/(12*pi**3)
	c4=35/(64*pi**4)
	u3=0
	u4=0
	do 2 i=1,n
	y=(x(i)-al)/be
	u3=u3+c3*(y**3-8*pi*pi*y/3)/d
2	u4=u4+c4*(y**4-7*(pi**4)/15)/d	
	u3s=u3**2
	u4s=u4**2
	write(*,4)
4	format(//)
	write(*,*)'Logistic Data,p.225 of Rayner et al 2009 book'
	write(*,4)
	write(*,*)'U3^2,U4^2',u3s,u4s
	k=0
	kk=0
	do 100 j=1,ns
	do 5 i=1,n
	r=ru(ix,iy,iz)
5	x(i)=al+be*dlog(r/(1-r))
	a=0
	v=0
	do 11 i=1,n
	v=v+x(i)**2
11	a=a+x(i)
	a=a/n
	v=v/n-a**2
	all=a
	bee=c*dsqrt(v)
	u3=0
	u4=0
	do 22 i=1,n
	y=(x(i)-all)/bee
	u3=u3+c3*(y**3-8*pi*pi*y/3)/d
22	u4=u4+c4*(y**4-7*(pi**4)/15)/d	
	u3ss=u3**2
	u4ss=u4**2
	if(u3ss.ge.u3s)k=k+1
100	if(u4ss.ge.u4s)kk=kk+1
	dd=dfloat(ns)
	p3=k/dd
	p4=kk/dd
	write(*,4)
	write(*,*)'p3,p4',p3,p4
	end
	double precision function ru(ix,iy,iz)
c     Algorithm AS 183 Appl. Statist. (1982) vol.31, no.2
      ix = 171 * mod(ix, 177) - 2 * (ix / 177)
      iy = 172 * mod(iy, 176) - 35 * (iy / 176)
      iz = 170 * mod(iz, 178) - 63 * (iz / 178)
      if (ix .lt. 0) ix = ix + 30269
      if (iy .lt. 0) iy = iy + 30307
      if (iz .lt. 0) iz = iz + 30323
      ru = dmod(dfloat(ix) / 30269. + dfloat(iy) / 30307. +
     +                        dfloat(iz) / 30323., 1.d0)
      return
      end
