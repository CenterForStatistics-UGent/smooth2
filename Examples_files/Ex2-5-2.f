c
c	e1.f,X**2 tests of the normal for grouped data
c
	implicit double precision (a-h,o-z)
	parameter(k=9)
	dimension f(k),xm(k),xc(0:k),e(k),p(k),
     #  g1(k),g2(k),g3(k),gg4(k)
	data f/3,8,53,215,346,277,120,24,7/
	data xm/54,56,58,60,62,64,66,68,70/
	data xc/-1000,55,57,59,61,63,65,67,69,1000/
	write(*,55)
	write(*,*)'Mothers Heights Data'
	write(*,*)'See Best,Rayner & Thas(2008),Journal of Applied Statist
     #ics,35,481.'
	write(*,55)
55	format(//)
	c1=1/dsqrt(2*3.14159265d0)
	av=0
	s=0
	do 1 i=1,k
	s=s+f(i)
1	av=av+f(i)*xm(i)
	n=s
	write(*,*)'# obs is',n
	av=av/s
	va=0
	k1=k-1
	do 2 i=1,k
2	va=va+f(i)*(xm(i)-av)**2
	sd=sqrt(va/s)
	ssd=sd
	write(*,*)'av,sd',av,ssd
	be=sd
	al=av
	a0=al
	b0=be
9	f1=0
	f2=0
	r11=0
	r22=0
	r12=0
	do 8 i=1,k
	ii=i-1
	t=(xc(i)-a0)/b0
	tt=(xc(ii)-a0)/b0
	z1=alnorm(t,.false.)
	z2=alnorm(tt,.false.)
	p(i)=z1-z2
	z1=c1*dexp(-0.5*t**2)
	z2=c1*dexp(-0.5*tt**2)
	dpda=-(z1-z2)/b0
	dpdb=(tt*z2-t*z1)/b0
	dpda2=dpdb/b0
	dpdb2=((tt**3)*z2-(t**3)*z1)/b0**2+2*dpdb
	dpdab=((tt**2-1)*z2-(t**2-1)*z1)/b0**2
	r11=r11+(f(i)/p(i)**2)*(p(i)*dpda2-dpda**2)
	r12=r12+(f(i)/p(i)**2)*(p(i)*dpdab-dpda*dpdb)
	r22=r22+(f(i)/p(i)**2)*(p(i)*dpdb2-dpdb**2)
	f1=f1+(f(i)/p(i))*dpda
8	f2=f2+(f(i)/p(i))*dpdb
	det=r11*r22-r12**2
	a1=a0-(r22*f1-r12*f2)/det
	b1=b0-(r11*f2-r12*f1)/det
	if(abs(a1-a0).lt..0001.and.abs(b1-b0).lt..0001)goto 10
	a0=a1
	b0=b1
	goto 9
10	sp=0
	do 14 i=1,k
	sp=sp+p(i)
14	e(i)=s*p(i)
	write(*,*)'obs,exp,unsqr contrib to X**2'
	do 15 i=1,k
	z=(f(i)-e(i))/dsqrt(e(i))
15	write(*,*) f(i),e(i),z
	xsl=0
	do 16 i=1,k
16	xsl=xsl+((f(i)-e(i))**2)/e(i)
	zx=xsl/2
	df=(k-3)/2.
	idf=k-3
	pr=1-gamain(zx,df,gh,iu)
	write(*,*)'MLE X**2,df,prob',xsl,idf,pr
	write(*,*)'MLE alpha,beta',a1,b1
	a0=a1
	b0=b1
	its=0
99	f1=0
	f2=0
	r11=0
	r22=0
	r12=0
	r21=0
	its=its+1
	rm1=0
	do 88 i=1,k
	ii=i-1
	t=(xc(i)-a0)/b0
	tt=(xc(ii)-a0)/b0
	z1=alnorm(t,.false.)
	z2=alnorm(tt,.false.)
	p(i)=z1-z2
88	rm1=rm1+xm(i)*p(i)
c	write(*,*)'rm1',rm1
	do 89 i=1,k
	dd=xm(i)-rm1
	ii=i-1
	t=(xc(i)-a0)/b0
	tt=(xc(ii)-a0)/b0
	z1=c1*dexp(-0.5*t**2)
	z2=c1*dexp(-0.5*tt**2)
	dpda=-(z1-z2)/b0
	dpdb=(tt*z2-t*z1)/b0
	r11=r11+xm(i)*dpda
	r12=r12+xm(i)*dpdb
	r21=r21+(dd**2)*dpda
	r22=r22+(dd**2)*dpdb
89	f2=f2+p(i)*dd**2
c	write(*,*)'f,g,av,sd',rm1,f2,ave,ssd
	f1=rm1-av
	f2=f2-ssd**2
c	write(*,*)'f,g',f1,f2
	d1=r11*r22
	d2=r12*r21
	det=r11*r22-r12*r21
c	write(*,*)'r11,r12,r21,r22,det,d1,d2',r11,r12,r21,r22,det
	a1=a0-(r22*f1-r21*f2)/det
	b1=b0-(r11*f2-r12*f1)/det
c	write(*,*)'al,be,its',a1,b1,its
	if(abs(a1-a0).lt..0001.and.abs(b1-b0).lt..0001)goto 110
	a0=a1
	b0=b1
	goto 99
110	sp=0
	do 314 i=1,k
	sp=sp+p(i)
314	e(i)=s*p(i)
	write(*,*)'obs,exp,unsqr contrib to X**2'
	do 315 i=1,k
	z=(f(i)-e(i))/dsqrt(e(i))
315	write(*,*) f(i),e(i),z
	xs=0
	do 1316 i=1,k
1316	xs=xs+((f(i)-e(i))**2)/e(i)
	zx=xs/2
	pr=1-gamain(zx,df,gu,iu)
	write(*,*)'MOM X**2,df,prob',xs,idf,pr
	write(*,*)'MOM alpha,beta',a1,b1
	rm1=0
	do 1114 i=1,k
1114	rm1=rm1+xm(i)*p(i)
	rm2=0
	rm3=0
	rm4=0
	rm5=0
	rm6=0
	rm7=0
	rm8=0
	do 1115 i=1,k
	z=xm(i)-rm1
	pp=p(i)
	rm2=rm2+pp*z**2
	rm3=rm3+pp*z**3
	rm4=rm4+pp*z**4
	rm5=rm5+pp*z**5
	rm6=rm6+pp*z**6
	rm7=rm7+pp*z**7
1115	rm8=rm8+pp*z**8
	do 1116 i=1,k
	z=xm(i)-rm1
	g1(i)=z/dsqrt(rm2)
	d=dsqrt(rm4-rm3*rm3/rm2-rm2**2)
	g2(i)=(z**2-rm3*z/rm2-rm2)/d
	d=d**2
	d3=d
	a=(rm5-rm3*rm4/rm2-rm2*rm3)/d
	b=(rm4*rm4/rm2-rm2*rm4-rm3*rm5/rm2+rm3**2)/d
	c=(2*rm3*rm4-rm3*rm3*rm3/rm2-rm2*rm5)/d
	d=dsqrt(rm6-2*a*rm5+(a**2-2*b)*rm4+2*(a*b-c)*rm3+
     #  (b**2+2*a*c)*rm2+c*c)
1116	g3(i)=(z**3-a*z**2-b*z-c)/d
	a3=a
	b3=b
	cc3=c
	a=-(rm7-a3*rm6-rm5*b3-cc3*rm4)/(rm6-rm5*a3-rm4*b3-cc3*rm3)
	b=-(rm6-rm5*rm3/rm2-rm2*rm4)/d3-a3*a
	c=-(rm5+a*rm4+b*rm3)/rm2
	d=-(rm4+a*rm3+b*rm2)
	dd=dsqrt(rm8+2*a*rm7+(a**2+2*b)*rm6+2*(a*b+c)*rm5
     #  +(b**2+2*a*c+2*d)*rm4+2*(a*d+b*c)*rm3+
     #  (c**2+2*b*d)*rm2+d**2)
	do 1164 i=1,k
	z=xm(i)-rm1
1164	gg4(i)=(z**4+a*z**3+b*z**2+c*z+d)/dd
	ss=dsqrt(s)
	v1=0
	v2=0
	v3=0
	vv4=0
	do 1117 i=1,k
	ff=f(i)
	v1=v1+ff*g1(i)
	v2=v2+ff*g2(i)
	vv4=vv4+ff*gg4(i)
1117	v3=v3+ff*g3(i)
	v1=v1/ss
	v2=v2/ss
	v3=v3/ss
	vv4=vv4/ss
c	write(*,*)'MOM V1,V2,V3,V4',v1,v2,v3,vv4
	v1=v1**2
	v2=v2**2
	v3=v3**2
	v4=vv4**2
	write(*,*)'squares of MOM V3,V4 ',v3,v4
	end
	double precision function gamain (x,p,g,ifault)
      implicit double precision (a-h,o-z)
c        Algorithm AS 32 J.R. Statist. Soc. C.  (1970) Vol.19 No. 3
      dimension pn(6)
      data zero/0.0d0/, one/1.0d0/, uflo/1.0d-37/, two/2.0d0/
      data acu/1.0d-8/,oflo/1.0d37/
      g=alngam(p,i)
      gin=zero
      ifault=0
      if (p.le.zero) ifault=1
      if(x.lt.zero) ifault=2
      if (ifault .gt. 0 .or. x .eq. zero) go to 50
      arg=p*log(x)-x-g
      if(arg.lt.log(uflo)) then
	ifault=3
	go to 50
      end if
      factor=exp(arg)
      if(x.gt.one .and. x.ge.p) goto 30
      gin=one
      term=one
      rn=p
   20 rn=rn+one
      term=term*x/rn
      gin=gin+term
      if(term.gt.acu) goto 20
      gin=gin*factor/p
      goto 50
   30 a=one-p
      b=a+x+one
      term=zero
      pn(1)=one
      pn(2)=x
      pn(3)=x+one
      pn(4)=x*b
      gin=pn(3)/pn(4)
   32 a=a+one
      b=b+two
      term=term+one
      an=a*term
      do 33 i=1,2
   33 pn(i+4)=b*pn(i+2)-an*pn(i)
      if(pn(6).eq.zero) goto 35
      rn=pn(5)/pn(6)
      dif=abs(gin-rn)
      if(dif.gt.acu) goto 34
      if(dif.le.acu*rn) goto 42
   34 gin=rn
   35 do 36 i=1,4
   36 pn(i)=pn(i+2)
      if(abs(pn(5)).lt.oflo) goto 32
      do 41 i=1,4
   41 pn(i)=pn(i)/oflo
      goto 32
   42 gin=one-factor*gin
   50 gamain=gin
      return
      end
      DOUBLE PRECISION FUNCTION ALNGAM(XVALUE, IFAULT)
C     ALGORITHM AS245  APPL. STATIST. (1989) VOL. 38, NO. 2
      INTEGER IFAULT
      DOUBLE PRECISION ALR2PI, FOUR, HALF, ONE, ONEP5, R1(9), R2(9),
     +		R3(9), R4(5), TWELVE, X, X1, X2, XLGE, XLGST, XVALUE,
     +		Y, ZERO
      DATA R1/-2.66685 51149 5D0, -2.44387 53423 7D1,
     +        -2.19698 95892 8D1,  1.11667 54126 2D1,
     +	       3.13060 54762 3D0,  6.07771 38777 1D-1,
     +	       1.19400 90572 1D1,  3.14690 11574 9D1,
     +	       1.52346 87407 0D1/
      DATA R2/-7.83359 29944 9D1, -1.42046 29668 8D2,
     +         1.37519 41641 6D2,  7.86994 92415 4D1,
     +         4.16438 92222 8D0,  4.70668 76606 0D1,
     +         3.13399 21589 4D2,  2.63505 07472 1D2,
     +         4.33400 02251 4D1/
      DATA R3/-2.12159 57232 3D5,  2.30661 51061 6D5,
     +         2.74647 64470 5D4, -4.02621 11997 5D4,
     +        -2.29660 72978 0D3, -1.16328 49500 4D5,
     +        -1.46025 93751 1D5, -2.42357 40962 9D4,
     +        -5.70691 00932 4D2/
      DATA R4/ 2.79195 31791 8525D-1, 4.91731 76105 05968D-1,
     +         6.92910 59929 1889D-2, 3.35034 38150 22304D0,
     +         6.01245 92597 64103D0/
      DATA ALR2PI/9.18938 53320 4673D-1/, FOUR/4.D0/, HALF/0.5D0/,
     +     ONE/1.D0/, ONEP5/1.5D0/, TWELVE/12.D0/, ZERO/0.D0/
      DATA XLGE/5.10D6/, XLGST/1.D+305/
      X = XVALUE
      ALNGAM = ZERO
      IFAULT = 2
      IF (X .GE. XLGST) RETURN
      IFAULT = 1
      IF (X .LE. ZERO) RETURN
      IFAULT = 0
      IF (X .LT. ONEP5) THEN
	IF (X .LT. HALF) THEN
	  ALNGAM = -LOG(X)
	  Y = X + ONE
	  IF (Y .EQ. ONE) RETURN
	ELSE
	  ALNGAM = ZERO
	  Y = X
	  X = (X - HALF) - HALF
	END IF
	ALNGAM = ALNGAM + X * ((((R1(5)*Y + R1(4))*Y + R1(3))*Y
     +                + R1(2))*Y + R1(1)) / ((((Y + R1(9))*Y + R1(8))*Y
     +                + R1(7))*Y + R1(6))
	RETURN
      END IF
      IF (X .LT. FOUR) THEN
	Y = (X - ONE) - ONE
	ALNGAM = Y * ((((R2(5)*X + R2(4))*X + R2(3))*X + R2(2))*X
     +              + R2(1)) / ((((X + R2(9))*X + R2(8))*X + R2(7))*X
     +              + R2(6))
	RETURN
      END IF
      IF (X .LT. TWELVE) THEN
	ALNGAM = ((((R3(5)*X + R3(4))*X + R3(3))*X + R3(2))*X + R3(1)) /
     +            ((((X + R3(9))*X + R3(8))*X + R3(7))*X + R3(6))
	RETURN
      END IF
      Y = LOG(X)
      ALNGAM = X * (Y - ONE) - HALF * Y + ALR2PI
      IF (X .GT. XLGE) RETURN
      X1 = ONE / X
      X2 = X1 * X1
      ALNGAM = ALNGAM + X1 * ((R4(3)*X2 + R4(2))*X2 + R4(1)) /
     +              ((X2 + R4(5))*X2 + R4(4))
      RETURN
      END
	double precision function alnorm(x,upper)
c         Algorithm AS66 Applied Statistics (1973) vol22 no.3
      double precision zero,one,half
      double precision con,z,y,x
      double precision p,q,r,a1,a2,a3,b1,b2,c1,c2,c3,c4,c5,c6
      double precision d1,d2,d3,d4,d5
      logical upper,up
      double precision ltone,utzero
      data zero/0.0d0/, one/1.0d0/, half/0.5d0/
      data ltone/7.0d0/,utzero/18.66d0/
      data con/1.28d0/
      data p/0.398942280444d0/,q/0.39990348504d0/,r/0.398942280385d0/   
      data a1/5.75885480458d0/,a2/2.62433121679d0/,a3/5.92885724438d0/  
      data b1/-29.8213557807d0/,b2/48.6959930692d0/
      data c1/-3.8052d-8/,c2/3.98064794d-4/,c3/-0.151679116635d0/
      data c4/4.8385912808d0/,c5/0.742380924027d0/,c6/3.99019417011d0/  
      data d1/1.00000615302d0/,d2/1.98615381364d0/,d3/5.29330324926d0/  
      data d4/-15.1508972451d0/,d5/30.789933034d0/
      up=upper
      z=x
      if(z.ge.zero)goto 10
      up=.not.up
      z=-z
   10 if(z.le.ltone.or.up.and.z.le.utzero)goto 20
      alnorm=zero
      goto 40
   20 y=half*z*z
      if(z.gt.con) goto 30
      alnorm=half-z*(p-q*y/(y+a1+b1/(y+a2+b2/(y+a3))))
      goto 40
   30 alnorm=r*dexp(-y)/(z+c1+d1/(z+c2+d2/(z+c3+d3/(z+c4+d4/(z+c5+d5/   
     2   (z+c6))))))
   40 if(.not.up)alnorm=one-alnorm
      return
      end
