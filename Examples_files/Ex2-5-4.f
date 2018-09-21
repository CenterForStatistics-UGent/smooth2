c
c	X**2 tests of fit for grouped exponential data
c	
c	e2.f
c
	implicit Double Precision(a-h,o-z)
	parameter(k=6)
	dimension f(k),xmid(k),xcut(0:k),p(k),
     #  g1(k),g2(k),g3(k),g4(k)
	data f/21,9,5,2,1,1/
	data xmid/1,4,8,12,16,20/
	data xcut/0,2,6,10,14,18,100/
	write(*,55)
	write(*,*)'Scour Depth Data'
	write(*,*)'See Best & Rayner(2007),CSDA,51,3946.'
	write(*,55)
55	format(//)
	is=0
	nc=k
	av=0
	k1=k-1
	do 66 i=1,k
	is=is+f(i)
66	av=av+f(i)*xmid(i)
	av=av/is
	write(*,*)'Sample mean and Sample size', av,is
	an=1/av
	p(1)=1-dexp(-xcut(1)*an)
	do 266 i=2,k1
266	p(i)=dexp(-xcut(i-1)*an)-dexp(-xcut(i)*an)
	p(k)=dexp(-xcut(k1)*an)
	xs=0
	nn=is
	sn=float(nn)
	sn=dsqrt(sn)
	do 277 i=1,k
	e=nn*p(i)
277	xs=xs+((f(i)-e)**2)/e
	idf=k-2
	px=idf/2.
	zx=xs/2
	pt1=1-gamain(zx,px,g,ifa)
	write(*,*)'Trad X**2,df',xs,idf
	write(*,*)'P value for Trad X**2',pt1
	a=1/av
	its=0
5	s2=0
	do 3 i=1,k1
3	s2=s2+xmid(i)*(dexp(-a*xcut(i-1))-dexp(-a*xcut(i)))
	s2=s2+xmid(k)*dexp(-a*xcut(k1))-av
	s1=0
	s3=0
	do 2 i=1,k
2	s1=s1-xmid(i)*xcut(i-1)*dexp(-a*xcut(i-1))
	do 1 i=1,k1
1	s3=s3+xmid(i)*xcut(i)*dexp(-a*xcut(i))
	its=its+1
	an=a-s2/(s1+s3)
	if(abs(an-a).lt..000001)goto 4
	a=an
	goto 5
4	av=1/an
	write(*,*)'MOM mu,theta,#its',av,an,its
	p(1)=1-dexp(-xcut(1)*an)
	do 6 i=2,k1
6	p(i)=dexp(-xcut(i-1)*an)-dexp(-xcut(i)*an)
	p(k)=dexp(-xcut(k1)*an)
	xs=0
	do 7 i=1,k
	e=nn*p(i)
7	xs=xs+((f(i)-e)**2)/e
	idf=k-2
	write(*,*)'MOM X**2,df',xs,idf
	nc=k
	rm1=0
	rm2=0
	rm3=0
	rm4=0
	do 77 ii=1,nc
	rm1=rm1+(xmid(ii)**1)*p(ii)
	rm2=rm2+(xmid(ii)**2)*p(ii)
	rm3=rm3+(xmid(ii)**3)*p(ii)
77	rm4=rm4+(xmid(ii)**4)*p(ii)
	div=rm2-rm1**2
	ba=1/dsqrt(div)
	by=rm3-rm1*rm2
	bz=ba**2*by*rm1-rm2
	div=rm4-rm2**2-(by**2)*(ba**2)
	cons=1/dsqrt(div)
	do 43 ii=1,nc
	g1(ii)=ba*(xmid(ii)-rm1)
43	g2(ii)=cons*(xmid(ii)**2-ba**2*by*xmid(ii)+bz)
	br=0
	t=0
	u=0
	do 47 ii=1,nc
	br=br+(xmid(ii)**2)*(g2(ii)**2)*p(ii)
	t=t+(g2(ii)**2)*xmid(ii)*p(ii)
47	u=u+xmid(ii)*g2(ii)*g1(ii)*p(ii)
	br=br-t*t-u*u
	br=1/dsqrt(br)
	do 48 ii=1,nc
48	g3(ii)=br*((xmid(ii)-t)*g2(ii)-u*g1(ii))
	br=0
	t=0
	u=0
	do 59 ii=1,nc
	br=br+(xmid(ii)**2)*(g3(ii)**2)*p(ii)
	t=t+(g3(ii)**2)*xmid(ii)*p(ii)
59	u=u+xmid(ii)*g3(ii)*g2(ii)*p(ii)
	br=br-t*t-u*u
	br=1/dsqrt(br)
	do 58 ii=1,nc
58	g4(ii)=br*((xmid(ii)-t)*g3(ii)-u*g2(ii))
	u4=0
	u3=0
	u1=0
	u2=0
	do 26 ii=1,nc
	u4=u4+f(ii)*g4(ii)/sn
	u1=u1+f(ii)*g1(ii)/sn
	u3=u3+f(ii)*g3(ii)/sn
26	u2=u2+f(ii)*g2(ii)/sn
	write(*,*)'Unsqrd MOM Vs',u1,u2,u3,u4
	u1s=u1**2
	u2s=u2**2
	u3s=u3**2
	u4s=u4**2
	write(*,*)'Squared MOM Vs', u1s,u2s,u3s,u4s
	px=idf/2.
	zx=xs/2
	pm1=1-gamain(zx,px,g,ifa)
	px=.5
	zx=u2s/2
	pm2=1-gamain(zx,px,g,ifa)
	write(*,*)'Pvalues for MOM X**2 & V2**2',pm1,pm2
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