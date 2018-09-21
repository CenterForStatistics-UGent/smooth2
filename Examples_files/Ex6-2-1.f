c
c	Smooth Tests for Normality
c
c	e4.f
	implicit double precision (a-h, o-z)
	parameter(n=20,ns=10000)
	dimension x(n),xx(n)
	data x/10,9,6,3*5,3*4,4*3,4*2,2*1,0/
	ix=55689
	iy=13002
	iz=91874
	c=dsqrt(6.d0)
	cc=dsqrt(24.d0)
	d=dsqrt(dfloat(n))
	dc=d*c
	dcc=d*cc
	z3=0
	z4=0
	a=0
	v=0
	do 6 i=1,n
	y=x(i)
	a=a+y
6	v=v+y**2
	a=a/n
	v=dsqrt(v/n-a**2)
	do 1 i=1,n
	y=(x(i)-a)/v
	z3=z3+(y**3-3*y)/dc
1	z4=z4+(y**4-6*y**2+3)/dcc
	s=z3**2+z4**2
	write(*,2)
	write(*,*)'Example from Best & Rayner(1985),JSPI,12,p.395'
2	format(//)
	write(*,*)'Also see p.105 of Rayner et al(2009), SMOOTH TESTS OF G
     #OODNESS OF FIT'
	write(*,2)
	write(*,*)'Z3,Z4',z3,z4
	write(*,*)'S2   ',s
	k1=0
	k2=0
	k3=0
	do 3 j=1,ns
	do 4 i=1,n
4	xx(i)=xn5(ix,iy,iz)	
	a=0
	v=0
	do 7 i=1,n
	y=xx(i)
	a=a+y
7	v=v+y**2
	a=a/n
	v=dsqrt(v/n-a**2)
	zz3=0
	zz4=0
	do 5 i=1,n
	y=(xx(i)-a)/v
	zz3=zz3+(y**3-3*y)/dc
5	zz4=zz4+(y**4-6*y**2+3)/dcc
	ss=zz3**2+zz4**2
	if(zz3**2.ge.z3**2)k1=k1+1
	if(zz4**2.ge.z4**2)k2=k2+1
3	if(ss.ge.s)k3=k3+1
	d=dfloat(ns)
	p1=k1/d
	p2=k2/d
	p3=k3/d
	write(*,*)'P values for Z3**2 & Z4**2',p1,p2
	write(*,*)'P value for S2',p3
	end
	double precision function xn5(ix,iy,iz)
	implicit double precision (a-h,o-z)
c	based on Best(1979),Australian Computer Journal,11(2),p.60
	c=1.715527769d0
1	u=ru(ix,iy,iz)
	v=ru(ix,iy,iz)
	xn5=c*(v-.5d0)/u
	x2=.25d0*xn5**2
	if(x2.le.1-u)return
	if(x2.le.-dlog(u))return
	goto 1
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


