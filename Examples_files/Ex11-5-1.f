c
c	Smooth Tests for the Negative Binomial
c	e12.f
	implicit double precision (a-h,o-z)
	parameter(n=50)
	dimension x(n)
	data x/6*0,8*1,9*2,6*3,6*4,5,5,5*6,3*7,8,4*9/
	a=0
	v=0
	do 1 i=1,n
	v=v+x(i)**2
1	a=a+x(i)
	a=a/n
	d=dsqrt(dfloat(n))
	v=(v/n-a**2)
	c=a*a/(v-a)
	p=c/(c+a)
	write(*,*)'p,k',p,c
	q=1-p
	u3=0
	u4=0
	c3=d*dsqrt(6*c*(c+1)*(c+2)*q**3)
	c4=d*dsqrt(4*c*q*(2549*c*p**3-36*c*c*p**3-36*p**3
     #  -6*(c**3)*p**3+198*c*p*p+18*p*p*c**3+108*p*p
     #  +108*c*c*p*p-198*c*p-18*p*c**3-108*p-108*p*c*c
     #  +36*c*c+66*c+6*c**3+36))
	write(*,*)'c3,q',c3,q
	bt=0
	do 2 i=1,n
	t=x(i)-a
	bt=bt+t**3
	u4=u4+((p**4)*t**4+6*p*p*p*(p-2)*t**3+p*p*(6*c*p-6*c+36
     #  -36*p+11*p*p)*t**2
     #  +3*(c*c-2*c*c*p+c*c*p*p-6*c+12*c*p
     #  -8*c*p*p+2*c*p**3))/c4
2	u3=u3+((p**3)*t**3+3*p*p*(p-2)*t**2+2*c*q*(q+1))/c3
	bt=bt/n-v*(2*v/a-1)
	write(*,4)
4	format(//)
	write(*,*)'Black Bean Aphid Data,p.160 of Rayner et al 2009 book'
	write(*,4)
	write(*,*)'U3,T,U4',u3,bt,u4
	vt=(2*c*(c+1)*(10+3*c-4*p)*q*q*q/p**6)/n
	vr=(24*c*(c+1)*(q**4)*(3*p*p-6*p+c*c+5*c+9))/(n*p**8)
	se=dsqrt(vt)
	write(*,*)'SE',se
	s=bt*bt/vt
	write(*,*)'T**2/var(T)',s
	u3s=(c3*c3*u3**2)/((p**6)*n*n*vt)
	write(*,*)'u3**2/var(U3)',u3s
	u4s=(c4*c4*u4**2)/((p**8)*n*n*vr)
	write(*,*)'u4**2/var(U4)',u4s
	end
