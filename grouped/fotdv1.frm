; FOTDv1.frm
; Compilation of Fractint formulas required for Jim Muth's FOTD series 12.Apr.97 - 11.Apr.98 
; This is a companion file to FOTD_v1.par
; Compiled by Les St Cair.

3wayMandelbrot {; Jim Muth
z=p3, g=pixel, a=real(p1), b=imag(p1),
c=real(p2), d=imag(p2):
z=(a*z^b)+(c*z^d)+(.3*(sqr(z)))+g,
|z| <= 100
}

4drot-xz-xw {; Benno Schmid & Jim Muth
; real(p1)=rotation angle in degrees
; imag(p1)=exponent of Z
; p2=parallel planes, p3=proportional extra term
e=exp(flip(real(p1)*.01745329251994)),
z=e*imag(pixel)+flip(real(p2)),
c=real(pixel)+flip(imag(p2)):
z=z^imag(p1)+(real(p3)*z^imag(p3))+c,
|z| <= 36
}


4drot-xz-xwa {; Benno Schmid & Jim Muth
; formulaname appended to "a" to differentiate from
; previously posted 4drot-xz-xw formula
; real(p1)=exponent of Z
; imag(p1)=rotation angle in degrees
; p2 and p3=parallel planes
e=exp(flip(imag(p1)*.01745329251994)),
z=e*imag(pixel)+p2,
c=real(pixel)+p3:
z=z^real(p1)+c,
|z| <= 36
}

BasicNewton { ; Jim Muth
; REDUNDANT -- STILL NEEDS WORK
a=real(p1), b=imag(p1), c=real(p2),
d=imag(p2), k=real(p3), f=imag(p3),
z=pixel:
zx=z^b
zy=c*(zx*z)
z=(d*zy+a)/(k*zx),
f<=|zy-a|
}

boring {;Candidate for contest
  ;p2 = bailout value
    z=p1, c1=c2=c3=pixel, bailout=real(p2):
      z=z^3-c1*z^2+c2*z+c3,
  |z| <=bailout
  }

bubbles {; Jim Muth
 z=c=pixel:
  a=sqr(z)+(c-1)*z-c
  b=3*sqr(z)+c-1
  z=z-2*a/b,
   .000000000000000000000000000001 <= |a|
  }

carnival {; Jim Muth
z=c=pixel:
a=(z*z*z)+(c-2)*z-c
b=2*(sqr(z))+c-1
z=z-1*a/b
.000000000000000000000000000001 <= |a|
}

contest4  {; Kerry Mitchell
      ; slightly optimized version of Contest formula
         z=p1, c=pixel:
         z2=sqr(z), z=z*z2+c*(1+z-z2), |z| <= 4
         }

contest4a  {; Kerry Mitchell (variable bailout by JM)
            ; formulaname appended to "a" to differentiate from
            ; previously posted contest4 formula
            ; slightly optimized version of Contest formula
         z=p1, c=pixel:
         z2=sqr(z), z=z*z2+c*(1+z-z2), |z| <= p2
         }

CrazyMidgets   {; JM, draws very distorted midgets
c=pixel, a=real(p1), b=imag(p1), d=real(p2), f=imag(p2),
g=1/f, h=1/d, j=1/(f-b), z=(-a*b*g*h)^j:
z=(a*(z^b))+(d*(z^f))+c,
|z| <= 100
}

CrazyNewton { ; Jim Muth
a=real(p1), b=imag(p1), c=real(p2),
d=imag(p2), k=real(p3), f=imag(p3),
z=pixel:
zx=z^b
zy=c*(zx*z)
z=(d*zy+a)/(k*zx),
f<=|zy-a|
}

eclipse {; Jim Muth
z=c=pixel:
z=(-z)^(-1.5)*(c^(-2.5))+c,
|z| <= 100
}

Elliptic {; Jim Muth
z=flip(imag(pixel))+real(p1),
c=real(pixel)+flip(imag(p1)):
z=sqr(z)+c,
|z| <= 36
}

EllipticN {; Jim Muth
z=flip(imag(pixel))+p1,
c=real(pixel)+p2:
z=z^p3+c,
|z| <= 16
}

EllipticVB {; Jim Muth
z=flip(imag(pixel))+real(p1),
c=real(pixel)+flip(imag(p1)),
a=sqr(p2):
z=sqr(z)+c,
|z| <= a
}

Flames {; Jim Muth
c=pixel, z=2*(pixel):
z=fn1(z)+c+fn2(c)
c=fn3(c),
LastSqr <= 100
}

FlipLambdaJ (ORIGIN) { ; Ron Barnett, 1993
  z = pixel:
   z = p1*z*(1-flip(z)*flip(z))
    |z| <= 100
  }

fracfern {; Jim Muth
z=c=pixel:
z=z^1000*(c^(-1002))+c,
|z| <= 10000
}

Gamut {; Jim Muth
z=g=pixel, a=real(p1), b=imag(p1), c=real(p2),
d=imag(p2), e=real(p3), f=imag(p3):
h=z^a+(g-b)*z-g
j=c*z^d+g
z=z-e*h/j,
f <= |h|
}

gothic {; Jim Muth
; A variation of Chris Green's HyperMandel
a=(p1),b=(0,0):
q=sqr(a)-sqr(b)+pixel
b=p2*a*b+p3
a=q,
|a|+|b| <= 100
}

HyperBrot       {; Jim Muth
a=real(p1), b=imag(p1),
d=real(p2), h=imag(p2), f=p3:
z=z+1,
g=sqr(a)-sqr(b)+pixel,
b=d*a*b+f,
a=h*g,
|a|+|b| <= 9
}

HyperBrotII     {; Jim Muth
a=p1, b=0,0, d=real(p2),
h=imag(p2), f=p3:
g=sqr(a)-sqr(b)+pixel,
b=d*a*b+f,
a=h*g,
|a|-|b| <= 9
}

HyperBrotIII    {; Jim Muth
a=p1, b=0,0, d=real(p2),
h=imag(p2), f=p3:
g=sqr(a)-sqr(b)+pixel,
b=d*a*b+f,
a=h*g,
|a|*|b| <= 9
}

HyperBrotVII    {; Jim Muth, formula
a=0,0, b=0,0, x=real(p1), y=imag(p1),
d=real(p2), h=imag(p2), f=p3:
g=a^x-b^y+pixel,
b=d*a*b+f,
a=h*g,
|a|+|b| <= 9
}

HyperSqrTest {; Jim Muth
a=real(p1), b=imag(p1), c=real(p2),
d=imag(p2), e=real(p3), f=imag(p3):
g=(a^c)-(b^d)+pixel
b=e*a*b+f
a=g,
|a|+|b| <= 100
}

HyperSquare {; Jim Muth
 a=(p1),b=(0,0):
  q=sqr(a)-sqr(b)+pixel
  b=p2*a*b+p3
  a=q,
   |a|+|b| <= 100
  }

IfElse01 {; adapted from R. Barnett's formula
z=y=c=pixel, w=0:
if(w), z=fn1(real(y))+flip(imag(y)), w=0
else, z=(y*p1), w=w+1, endif
z=z^p2+(p3*c), y=z,
|z| <= 100 
}

IfElse03 {; Jim Muth
 z=y=pixel, a=real(p1), b=imag(p1),
 c=p2+(p3*pixel), w=0:
IF(w)
 z=fn1(real(y))+fn2(imag(y)), w=0
ELSE
 z=(y*a), w=w+1
ENDIF
  z=z^b+c, y=z,
   |z| <= 100 
}

JimsComMand2J {; Jim Muth
z=c=pixel,
a=real(p1), b=imag(p1):
z=(-z)^a*(c^b)+p2+(p3*c),
|z| <= p3+100
}

JimsComMandJ {; Jim Muth
 z=c=pixel,
 a=real(p1), b=imag(p1):
  z=z^a*(c^b)+p2+(p3*c),
   |z| <=100
  }

JuliaMiN {; formula, Jim Muth
b=p1, z=pixel+p2, c=p3:
z=(-z)^b+c,
|z| <= 16
}

JuliaXLow {; Jim Muth
z=pixel, a=real(p1), b=imag(p1),
d=real(p2), f=imag(p2), c=p3:
z=(a*(z^b))+(d*((-z)^f))+c,
|z|<=2500
}

JulibrotInvZ {; Jim Muth
z=pixel, c=p2+(pixel*p3):
z=(-z)^p1+c,
|z| <= 100
}

JulibrotZpwr {; Jim Muth
;Draws oblique XY-ZW slices of order n Julibrot Figure
;P1 defines power of Z, P2 sets center of slice
;P3 sets angle of slice
 z=pixel, c=p2+(pixel*p3):
  z=z^p1+c,
   |z| <= 100
  }

Liar4 { ; by Chuck Ebbert.
  ; X: X is as true as (p1+1) times Y
  ; Y: Y is as true as X is false
  ; Calculate new x and y values simultaneously.
  ; Real part of p1 changes probability.  Use floating point.
  ; y(n+1)=abs((1-x(n) )-y(n) ), x(n+1)=1-abs(y(n)-x(n) )
  z = pixel, p = p1 + 1:
   z = 1-abs(imag(z)*p-real(z))+flip(1-abs(1-real(z)-imag(z)))
    |z| <= 1
  }

M-J-rotation {; Jim Muth
; p1=power of Z,  p2=rotation point,  p3=rotation angle
z=pixel, c=p2+(p3*pixel):
z=z^p1-(1.1*z)+c,
|z| <=25
}

M-O-rotation {; Jim Muth
; real(p1)=power of Z,  imag(p1)=angle of rotation
; p2=parallel planes,  p3=rotation point and parallel planes
a=real(p1), b=imag(p1)+.0000000000001,
z=sin(b*.01745329251994)*real(pixel)+p2,
c=cos(b*.01745329251994)*real(pixel)+flip(imag(pixel))+p3:
z=Z^a-(1.1*z)+c,
|z| <=25
}

M-P-rotation {; Jim Muth
; real(p1)=power of Z,  imag(p1)=angle of rotation
; p2=parallel planes,  p3=rotation point and parallel planes
a=real(p1), b=imag(p1)+.0000000000001,
z=sin(b*.01745329251994)*imag(pixel)+p2,
c=cos(b*.01745329251994)*flip(imag(pixel))+real(pixel)+p3:
z=z^a-(1.1*z)+c,
|z| <=25
}

M-R-rotation {; Jim Muth
; real(p1)=power of Z,  imag(p1)=angle of rotation
; p2 and p3=rotation point and parallel planes
a=real(p1), b=imag(p1)+.0000000000001,
z=sin(b*.01745329251994)*flip(real(pixel))+p2,
c=cos(b*.01745329251994)*real(pixel)+flip(imag(pixel))+p3:
z=z^a-(1.1*z)+c,
|z| <=25
}

Man2-XW {; Jim Muth
z=flip(real(pixel))+real(p1),
c=imag(pixel)+flip(imag(p1)):
z=sqr(z)+c,
|z| <= 36
}

Man2-YW {; Jim Muth
z=real(p1)+flip(real(pixel)),
c=imag(p1)+flip(imag(pixel)):
z=sqr(z)+c,
|z| <= 36
}

Man2-YZ {; Jim Muth
z=real(pixel)+flip(real(p1)),
c=flip(imag(pixel))+imag(p1):
z=sqr(z)+c,
|z| <= 36
}

MandelbrotMix {; Jim Muth
z=p3, c=pixel,
a=real(p1), b=imag(p1), d=real(p2), f=imag(p2):
z=(a*(z^b))+(d*(z^f))+c,
|z| <= 100
}

ManN-YZ {; Jim Muth
z=real(pixel)+flip(real(p1)),
c=flip(imag(pixel))+imag(p1):
z=z^p2+(p3*c),
|z| <= 16
}

ManN-YZ-XZ {; Jim Muth, Thanks to Benno
; p3 = 0 = Julibrot YZ plane
; p3 = 1 = Julibrot XZ plane
; p3 = >0 <1 = Oblique planes
z=real(pixel)+flip(real(p1)),
c=imag(pixel)+flip(imag(p1)),
a=p3, b=flip(cos(asin(p3))):
z=z^p2+((a+b)*c),
|z| <= 25
}

Man-XW-YW {; Jim Muth, Thanks to Benno
; p2 = 0 = Julibrot XW plane
; p2 = 1 = Julibrot YW plane
; p2 = >0 <1 = Oblique planes
z=flip(real(pixel))+real(p1),
c=flip(imag(pixel))+imag(p1),
a=p2, b=flip(cos(asin(p2))):
z=sqr(z)+((a+b)*c),
|z| <= 25
}

Man-YZ-XZ {; Jim Muth, Thanks to Benno
; p2 = 0 = Julibrot YZ plane
; p2 = 1 = Julibrot XZ plane
; p2 = >0 <1 = Oblique planes
z=real(pixel)+flip(real(p1)),
c=imag(pixel)+flip(imag(p1)),
a=p2, b=flip(cos(asin(p2))):
z=sqr(z)+((a+b)*c),
|z| <= 25
}

Mandelbrot {; Jim Muth
z=p1, c=pixel:
z=sqr(z)+c,
|z| <=p2
}

Mandelbrot2 {; Jim Muth
z=p1, c=pixel+p2:
z=sqr(z)+c,
|z| <= 16
}

MandelbrotMiN {; formula -- Jim Muth
z=p1+10^-100, c=p2+pixel:
z=(-z)^p3+c,
|z| <= 16
}

MandelbrotMix {; Jim Muth
z=p3, c=pixel,
a=real(p1), b=imag(p1), d=real(p2), f=imag(p2):
z=(a*(z^b))+(d*(z^f))+c,
|z| <= 100
}

MandelbrotMix4 {; Jim Muth
c=pixel, a=real(p1), b=imag(p1), d=real(p2), f=imag(p2),
g=1/f, h=1/d, j=1/(f-b), z=(-a*b*g*h)^j:
z=(a*(z^b))+(d*(z^f))+c,
|z| <= 100
}

MandelbrotN {; Jim Muth
b=p1, z=p2, c=p3+pixel:
z=z^(b)+c,
|z| <= 16
}

MandelbrotPM {; formula Jim Muth
z=p1+10^-100, c=pixel:
z=p2*(.5*((-z)^p3+z^p3))+c,
|z| <= 250
}

MandelbrotQud {; Jim Muth
z=p3, c=pixel,
a=real(p1), b=imag(p1), d=real(p2), f=imag(p2):
z=sqr(z)+(.2*(z*z*z))+(a*(z^b))+(d*(z^f))+c,
|z| <= 100
}

MandelbrotTri {; Jim Muth
z=p3, c=pixel,
a=real(p1), b=imag(p1), d=real(p2), f=imag(p2):
z=(z*z*z)+(a*(z^b))+(d*(z^f))+c,
|z| <= 100
}

MandelbrotVB {; Jim Muth
z=p1, c=pixel,
a=sqr(p2):
z=sqr(z)+c,
|z| <= a
}

MandelbrotVBa {; Jim Muth
; formulaname appended to "a" to differentiate from
; previously posted MandelbrotVB formula
z=p1, c=pixel+p3,
a=sqr(p2):
z=sqr(z)+c,
|z| <= a
}

MandelbrotZC {; Jim Muth
z=p3, c=pixel:
z=(real(p1)*(z^imag(p1)+c))+(real(p2)*(c^imag(p2)+z)),
|z| <= 100
}

MandelbrotZC2 {; Jim Muth
z=p1, c=pixel:
z=real(p2)*(z^imag(p2)+c)+real(p3)*(c^imag(p3)+z),
|z| <= 100
}

MandNewt03 {; Jim Muth
z=c=pixel:
a=z^3+(c-1)*z-c
b=p1*z^p2+c-1
z=z-p3*a/b
.0001 <= |a|
}

MandNewt04 {; Jim Muth
z=c=pixel:
a=z^3+(c-1)*z-c
b=p1*z^2+c-1
z=z-p2*a/b
p3 <= |a|
}

MandNewt05 {; Jim Muth
z=c=fn1(pixel):
a=z^2+(c-p1)*z-c
b=p2*z^2+c-1
z=z-1*a/b
p3 <= |a|
}

MandNewt06 {; Jim Muth
z=c=(pixel*p1):
a=z^3+(c-p2)*z-c
b=p3*z^2+c-1
z=z-1*a/b
.000000000000000000000000000001 <= |a|
}

MandNewt07 {; Jim Muth
z=c=(pixel*p1):
a=z^3+(c-p2)*z-c
b=3*z^2+c-1
z=z-p3*a/b
.000000000000000000000000000001 <= |a|
}

MandNewt08 {; Jim Muth
z=c=(pixel*p1):
a=z^p2+(c-1)*z-c
b=p3*z^2+c-1
z=z-1*a/b
.000000000000000000000000000001 <= |a|
}

MandNewt09 {; formula, Jim Muth
z=c=pixel:
a=z^3+(c-1)*z-c
b=p1*z^p2+c-1
z=z-1*a/b
p3 <= |a|
}

MandNewt10 {; Jim Muth
z=g=pixel, a=real(p1), b=imag(p1), c=real(p2),
d=imag(p2), e=real(p3), f=imag(p3):
h=z^a+(g-b)*z-g
j=c*z^d+g
z=z-e*h/j,
f <= |h|
}

MandNewt11 {; Jim Muth
z=g=pixel, a=real(p1), b=imag(p1), c=real(p2),
d=imag(p2), e=real(p3), f=imag(p3):
h=z^a+(g-b)*z-f
j=c*z^d+g
z=z-e*h/j,
.0000000000000000000000000000005 <= |h|
}

ManMinusN-XZ { ; Jim Muth
z=real(pixel)+flip(real(p1)),
c=imag(pixel)+flip(imag(p1)):
z=(-z)^p2+(p3*c),
|z| <= 16
}

ManMinusN-YZ {; Jim Muth
z=real(pixel)+flip(real(p1)),
c=flip(imag(pixel))+imag(p1):
z=(-z)^p2+(p3*c),
|z| <= 16
}

ManN-2-pro-YW { ; Jim Muth
z=real(p1)+flip(real(pixel)),
g=imag(p1)+flip(imag(pixel)),
a=real(p2), b=imag(p2), c=real(p3), d=imag(p3):
z=(a*(z^b))+(c*(z^d))+g,
|z| <= 16
}

ManN-XW-YW {; Jim Muth, Thanks to Benno
; p3 = 0 = Julibrot XW plane
; p3 = 1 = Julibrot YW plane
; p3 = >0 <1 = Oblique planes
z=flip(real(pixel))+real(p1),
c=flip(imag(pixel))+imag(p1),
a=p3, b=flip(cos(asin(p3))):
z=z^p2+((a+b)*c),
|z| <= 25
}

ManN-YW {
z=real(p1)+flip(real(pixel)),
c=imag(p1)+flip(imag(pixel)):
z=z^p2+c,
|z| <= 16
}

ManN-YZ {
z=real(pixel)+flip(real(p1)),
c=flip(imag(pixel))+imag(p1):
z=z^p2+(p3*c),
|z| <= 16
}

ManTest1XY-XZ { ; Jim Muth
z=real(pixel)+(p1*(imag(pixel)))+flip(real(p2)),
c=imag(pixel)+(p1*(real(pixel)))+flip(imag(p2)):
z=z^p3+c,
|z| <= 16
}

minN-XY-XWrot {; Jim Muth, thanks to Benno Schmid
; real(p1)=rotation angle in degrees, imag(p1)=power of Z
; p2 and p3=rotation point and parallel planes
a=real(p1), b=imag(p1),
z=sin(a*.01745329251994)*flip(imag(pixel))+p2,
c=cos(a*.01745329251994)*flip(imag(pixel))+real(pixel)+p3:
z=(-z)^b+c,
|z| <= 16
}

minN-XY-YZrot {; Jim Muth, thanks to Benno
; real(p1)=rotation angle in degrees, imag(p1)=power of Z
; p2=parallel planes, p3=rotation point and parallel planes
a=real(p1), b=imag(p1),
z=sin(a*.01745329251994)*real(pixel)+p2,
c=cos(a*.01745329251994)*real(pixel)+flip(imag(pixel))+p3:
z=(-z)^b+c,
|z| <= 16
}

MixMan2waypro {; Jim Muth
z=c=pixel:
z=z^p1+(p2*z^p3)+c,
|z| <= 100
}

MixMan3wayPro {; Jim Muth
z=g=pixel, a=real(p1), b=imag(p1), c=real(p2),
d=imag(p2), e=real(p3), f=imag(p3):
z=(a*z^b)+(c*z^d)+(e*z^f)+g,
|z| <= 100
}

MixSqrProJulib {; Jim Muth
z=pixel, a=real(p1), b=imag(p1),
c=real(p2), d=imag(p2), e=p3+(d*pixel):
z=(a*sqr(z))+(b*z^c)+e,
|z| <= 100
}

Mosaic {; Jim M, thanks to someone unknown
        ; p1=Mandelbrot set coordinates
        ; try ident, cos, ident, cos
z=c=p1+.05*(fn1(fn2(real(pixel)))+flip(fn3(fn4(imag(pixel))))):
z=sqr(z)+c,
|z| <= 100
}

mult105-XY-ZW {; draws all 6 planes and many rotations
;when fn1-2=i,f, then p1 0,0=M, 0,90=O, 90,0=E, 90,90=J
;when fn1-2=f,i, then p1 0,0=M, 0,90=R, 90,0=P, 90,90=J
a=real(p1)*.01745329251994, b=imag(p1)*.01745329251994,
z=sin(b)*fn1(real(pixel))+sin(a)*fn2(imag(pixel))+p2,
c=cos(b)*real(pixel)+cos(a)*flip(imag(pixel))+p3:
z=(-z)^1.05+c,
|z| <= 36  }

multi1-5-XY-ZW {; draws all 6 planes and many rotations
;when fn1-2=i,f, then p1 0,0=M, 0,90=O, 90,0=E, 90,90=J
;when fn1-2=f,i, then p1 0,0=M, 0,90=R, 90,0=P, 90,90=J
a=real(p1)*.01745329251994, b=imag(p1)*.01745329251994,
z=sin(b)*fn1(real(pixel))+sin(a)*fn2(imag(pixel))+p2,
c=cos(b)*real(pixel)+cos(a)*flip(imag(pixel))+p3:
z=z^1.5+c,
|z| <= 36  
}

multi20031 {; Jim Muth, best=ifif, fiif, fifi, iffi
a=real(p1)*.01745329251994, b=imag(p1)*.01745329251994,
z=sin(b)*fn1(real(pixel))+sin(a)*fn2(imag(pixel))+p2,
c=cos(b)*fn3(real(pixel))+cos(a)*fn4(imag(pixel))+p3:
z=z^2.003+c,
|z| <= 100  
}

multi20031a {; formula   draws many rotations
;when fn1-2=i,f, then p1 0,0=M, 0,90=O, 90,0=E, 90,90=J
;when fn1-2=f,i, then p1 0,0=M, 0,90=R, 90,0=P, 90,90=J
;note: formula appended with "a" to differentiate from 
;formula of same name previously posted (see above)
a=((real(p1))+(.000000000000000000001))*.01745329251994,
b=((imag(p1))+(.000000000000000000001))*.01745329251994,
z=sin(b)*fn1(real(pixel))+sin(a)*fn2(imag(pixel))+p2,
c=cos(b)*real(pixel)+cos(a)*flip(imag(pixel))+p3:
z=z^2.003+c,
|z| <= 36  }

multi20032 {; Jim Muth   this is the formula
; 0,0=para, 90,0=obl, 0,90=elip, 90,90=rect
e=exp(flip(real(p1*.01745329251994))),
f=exp(flip(imag(p1*.01745329251994))),
z=f*real(pixel)+p2, c=e*imag(pixel)+p3:
z=z^2.003+c,
|z| <= 100  
}

multigator2 {; Jim Muth
; 0,0=para, 90,0=obl, 0,90=elip, 90,90=rect
e=exp(flip(real(p1*.01745329251994))),
f=exp(flip(imag(p1*.01745329251994))),
z=f*real(pixel)+p2, c=e*imag(pixel)+p3:
z=(.5*(z^-4))+(-2*(z^-2))+c,
|z| <= 100  }

multirot-pm21 {; Jim Muth, best=ifif, fiif, fifi, iffi
a=real(p1)*.01745329251994, b=imag(p1)*.01745329251994,
z=sin(b)*fn1(real(pixel))+sin(a)*fn2(imag(pixel))+p2,
c=cos(b)*fn3(real(pixel))+cos(a)*fn4(imag(pixel))+p3:
z=(.1*(sqr(z)))+(10*(z^-2))+c,
|z| <= 100  }

multirot-XY-ZW {; Jim Muth, best=ifif, fiif
 a=real(p1)*.01745329251994, b=imag(p1)*.01745329251994,
 z=sin(b)*fn1(real(pixel))+sin(a)*fn2(imag(pixel))+p2,
 c=cos(b)*fn3(real(pixel))+cos(a)*fn4(imag(pixel))+p3:
  z=sqr(z)+c,
   |z| <= 36  }

multirot-XY-ZWa {; draws all 6 planes and many rotations
; formulaname appended to "a" to differentiate from
; previously posted multirot-XY-ZW formula
;when fn1-2=i,f, then p1 0,0=M, 0,90=O, 90,0=E, 90,90=J
;when fn1-2=f,i, then p1 0,0=M, 0,90=R, 90,0=P, 90,90=J
a=real(p1)*.01745329251994, b=imag(p1)*.01745329251994,
z=sin(b)*fn1(real(pixel))+sin(a)*fn2(imag(pixel))+p2,
c=cos(b)*real(pixel)+cos(a)*flip(imag(pixel))+p3:
z=sqr(z)+c,
|z| <= 36  }

multirot-XZ-YW {; Jim Muth
; 0,0=para, 90,0=obl, 0,90=elip, 90,90=rect
e=exp(flip(real(p1*.01745329251994))),
f=exp(flip(imag(p1*.01745329251994))),
z=f*real(pixel)+p2, c=e*imag(pixel)+p3:
z=sqr(z)+c,
|z| <= 36  }

multmin1-2-XY-ZW {; draws all 6 planes and many rotations
;when fn1-2=i,f, then p1 0,0=M, 0,90=O, 90,0=E, 90,90=J
;when fn1-2=f,i, then p1 0,0=M, 0,90=R, 90,0=P, 90,90=J
a=real((p1)+.000000000000000000000000000001)*.01745329251994,
b=imag(p1)*.01745329251994,
z=sin(b)*fn1(real(pixel))+sin(a)*fn2(imag(pixel))+p2,
c=cos(b)*real(pixel)+cos(a)*flip(imag(pixel))+p3:
z=(-z)^1.2+c,
|z| <= 36  }

Mystic {; Jim Muth
c=pixel, z=sqr(pixel)+(p1*(pixel)):
z=sqr(sqr(z)+(p2*(c)))+(p3*(fn1(c)))
c=fn2(c),
LastSqr <= 100
}

Mystic2 {; Jim Muth
a=real(p1), b=imag(p1), c=real(p2),
d=imag(p2), k=real(p3), f=imag(p3),
g=pixel, z=(pixel)^a+(b*(pixel))^c:
z=(fn1(z)+(d*(g)))^k+(f*(cos(g)))
g=sqr(g),
LastSqr <= 100
}

Mytest02  {; Jim Muth
z=c=pixel:
z=((z*(z+p1))^p2)^p3+c,
|z|<100
}

Mytest05  {; Jim Muth
 z=c=pixel, a=real(p1), b=imag(p1):
  z=(((z^a)*(z+b))^p2)^p3+c,
   |z|<=100
    }

Mytest06  {; Jim Muth
z=c=pixel:
z=(((z^p1)*(z+p2))^p3)^(-p3)+c,
|z|<100
}

Mytest06_ver2  {; Jim Muth
z=c=pixel:
z=(((z^p1)*(p2*z))^p3)^(-p3)+c,
|z|<=100
}

Mytest07  {; Jim Muth
z=pixel, a=real(p2), b=imag(p2), c=b*(pixel):
z=(((z^p1)*(z+a))^p3)^(-p3)+c,
|z|<=100
}

Mytest08  {; Jim Muth
z=fn1(pixel), a=real(p3),
b=imag(p3), c=a+(b*pixel):
z=(((z^p1)*z)^p2)^(-p2)+c,
|z|<=100
}

Mytest10  {; Jim Muth
z=c=pixel:
z=z^p1+p2*((z^p3)^(-p3))+c,
|z|<=100
}

Mytest11  {; Jim Muth
z=c=pixel:
z=z^p1+(p2*((z^p3)^(-p3)))+c,
|z|<=100
}

Mytest12  {; Jim Muth
z=c=pixel, a=real(p1), b=imag(p1):
z=(a*((z^p2)^(-p2)))+(b*((z^p3)^(-p3)))+c,
|z|<=100
}

MytestAB {; Jim Muth
z=c=pixel,
a=real(p3), b=imag(p3):
z=(a*(z^p1))+(b*((-z)^p2))+c,
|z|<=100
}

MytestAC {; Jim Muth
z=pixel, a=real(p1), b=imag(p1), d=real(p2),
f=imag(p2), g=real(p3), h=imag(p3), c=g+(h*pixel):
z=(a*(z^b))+(d*((-z)^f))+c,
|z|<=2500
}

MytestAD {; Jim Muth
; fn1=ident=mandelbrot, fn1=zero=julia
; p3 = C-value of julia
z=pixel, a=real(p1), b=imag(p1), d=real(p2),
f=imag(p2), c=p3+fn1(pixel):
z=(a*(z^b))+(d*((-z)^f))+c,
|z|<=2500
}

MytestAE {; Jim Muth
z=sqr(p3)+pixel, a=real(p1), b=imag(p1),
d=real(p2), f=imag(p2), c=fn1(pixel):
z=(a*(z^b))+(d*((-z)^f))+c,
|z|<=2500
}

MytestAG {; Jim Muth
z=c=pixel,
a=flip(real(p1)), b=flip(imag(p1)):
z=(z^a)^(-b)+c,
|z|<=100
}

MytestAH {; Jim Muth
z=1, c=pixel:
z=z^p1+z^(-p1)+c,
|z|<=100
}

N-XY-XWrotation {; Jim Muth, thanks to Benno Schmid
; real(p1)=rotation angle in degrees, imag(p1)=power of Z
; p2=parallel planes, p3=rotation point and parallel planes
a=real(p1), b=imag(p1),
z=sin(a*.01745329251994)*flip(imag(pixel))+p2,
c=cos(a*.01745329251994)*flip(imag(pixel))+real(pixel)+p3:
z=z^b+c,
|z| <= 16
}

N-XY-XZrotation {; formula, Jim Muth
; real(p1)=rotation angle in degrees, imag(p1)=power of Z
; p2=parallel planes, p3=rotation point and parallel planes
a=real(p1), b=imag(p1),
z=sin(a*.01745329251994)*imag(pixel)+p2,
c=cos(a*.01745329251994)*flip(imag(pixel))+real(pixel)+p3:
z=z^b+c,
|z| <= 16
}

N-XY-YWrotation {; Jim Muth, thanks to Benno Schmid
; real(p1)=rotation angle in degrees, imag(p1)=power of Z
; p2=parallel planes, p3=rotation point and parallel planes
a=real(p1), b=imag(p1),
z=sin(a*.01745329251994)*flip(real(pixel))+p2,
c=cos(a*.01745329251994)*real(pixel)+flip(imag(pixel))+p3:
z=z^b+c,
|z| <= 16
}

N-XY-YZrotation {; Jim Muth, thanks to Benno
; real(p1)=rotation angle in degrees, imag(p1)=power of Z
; p2=parallel planes, p3=rotation point and parallel planes
a=real(p1), b=imag(p1),
z=sin(a*.01745329251994)*real(pixel)+p2,
c=cos(a*.01745329251994)*real(pixel)+flip(imag(pixel))+p3:
z=z^b+c,
|z| <= 16
}

neon {; Jim Muth
z=c=pixel:
z=z^1.045+(.02*z^(-2))+c,
|z| <= 100 
}

NewtTest03 {; Jim Muth, June 1997
a=real(p1), b=imag(p1), c=real(p2),
d=imag(p2), k=real(p3), f=imag(p3),
z=(pixel):
zx=(z^b)-a
zy=(c*z)^d
z=z-(k*zx/zy),
|zx| >= f
}

NewtonTest26 {; Jim Muth
a=real(p1), b=imag(p1), c=real(p2),
d=imag(p2), k=real(p3), f=imag(p3),
z=(pixel):
zx=z^b-a
zy=c*z*z
z=z-(d*zx/zy)^k,
|zx| >= f
}

NewtonTest27 {; Jim Muth
a=real(p1), b=imag(p1), c=real(p2),
d=imag(p2), k=real(p3), f=imag(p3),
z=(pixel):
zx=(z^b)-a
zy=(c*z)^d
z=z-(k*zx/zy),
|zx| >= f
}

Oblate {; Jim Muth
z=real(pixel)+flip(real(p1)),
c=flip(imag(pixel))+imag(p1):
z=sqr(z)+c,
|z| <= 36
}

OblateMix {; Jim Muth
z=real(pixel)+flip(real(p3)),
c=flip(imag(pixel))+imag(p3),
a=real(p1), b=imag(p1), d=real(p2), f=imag(p2):
z=(a*(z^b))+(d*(z^f))+c,
|z| <= 100
}

OblateN {; Jim Muth
z=real(pixel)+flip(real(p1)),
c=flip(imag(pixel))+imag(p1):
z=z^p2+c,
|z| <= 16
}

OblateNa {; Jim Muth
; formulaname appended to "a" to differentiate from
; previously posted OblateN formula
b=p1, z=real(pixel)+p2,
c=flip(imag(pixel))+p3:
z=z^b+c,
|z| <= 16
}

OblatePM {; formula Jim Muth
z=real(pixel)+flip(real(p1)),
c=flip(imag(pixel))+imag(p1):
z=p2*(.5*((-z)^p3+z^p3))+c,
|z| <= 250
}

OblateVB {; Jim Muth
z=real(pixel)+flip(real(p1)),
c=flip(imag(pixel))+imag(p1),
a=sqr(p2):
z=sqr(z)+c,
|z| <= a
}

OblateXLow {; Jim Muth
z=real(pixel)+flip(real(p3)),
c=flip(imag(pixel))+imag(p3),
a=real(p1), b=imag(p1), d=real(p2), f=imag(p2):
z=(a*(z^b))+(d*((-z)^f))+c,
|z| <=2500
}

ObliqueMand {; Jim Muth
z=c=pixel:
z=sqr(z)+p1+(c*p2),
|z| <= 100
}

ObliqueManPlus {;Jim Muth
z=(p1+pixel), c=p2+(p3*pixel):
z=sqr(z)+c,
|z| <=100
}

ObliqueMixPlus {;Jim Muth
z=(p1+pixel), c=p2+(p3*pixel):
z=sqr(z)+(0.2*(z*z*z))+c,
|z| <=100
}

ObliqueSqrt {; Jim Muth
z=c=pixel:
z=z^(1.4142)+p1+(c*p2),
|z| <= 100
}

OblManPlusLow {;Jim Muth
z=p1+pixel, c=p2+(p3*pixel):
z=sqr(z)+c,
|z| <=4
}

other {; Jim Muth
z=c=pixel:
z=z+(-4*(z^(-4)))+c^10+c,
|z| <= 100
}

Parabolic {; Jim Muth
z=imag(pixel)+flip(real(p1)),
c=real(pixel)+flip(imag(p1)):
z=sqr(z)+c,
|z| <= 36
}

ParabolicMiN {; Jim Muth
z=imag(pixel)+flip(real(p1)),
c=real(pixel)+flip(imag(p1)):
z=(-z)^p2+c,
|z| <= 16
}

ParabolicMiNa {; Jim Muth
;note: formula appended with "a" to differentiate from 
;formula of same name previously posted (see above)
b=p1, z=imag(pixel)+p2,
c=real(pixel)+p3:
z=(-z)^(b)+c,
|z| <= 16
}

ParabolicMix {; Jim Muth
z=imag(pixel)+flip(real(p3)),
c=real(pixel)+flip(imag(p3)),
a=real(p1), b=imag(p1), d=real(p2), f=imag(p2):
z=(a*(z^b))+(d*(z^f))+c,
|z| <= 100
}

Rectangular {; Jim Muth
z=flip(real(pixel))+real(p1),
c=flip(imag(pixel))+imag(p1):
z=sqr(z)+c,
|z| <= 36
}

RectangularN {; Jim Muth
z=flip(real(pixel))+real(p1),
c=flip(imag(pixel))+imag(p1):
z=z^p2+c,
|z| <= 16
}

RectangularNa {; formula Jim Muth
; formulaname appended to "a" to differentiate from
; previously posted RectangularN formula
z=flip(real(pixel))+p1,
c=flip(imag(pixel))+p2:
z=z^p3+c,
|z| <= 16
}

RectangularNb {; formula, Jim Muth
; formulaname appended to "b" to differentiate from
; previously posted RectangularN formulas
z=flip(real(pixel))+p2,
c=flip(imag(pixel))+p3:
z=z^p1+c,
|z| <= 16
}

RectangularPM {; Jim Muth
z=flip(real(pixel))+real(p1),
c=flip(imag(pixel))+imag(p1):
z=p2*(.5*((-z)^p3+z^p3))+c,
|z| <= 250
}

RectXLow {; Jim Muth
z=flip(real(pixel))+real(p3),
c=flip(imag(pixel))+imag(p3),
a=real(p1), b=imag(p1), d=real(p2), f=imag(p2):
z=(a*(z^b))+(d*((-z)^f))+c,
|z| <=2500
}

SkewPlanes {; Jim Muth
;p1=(0,0)=YW, (0,1)=XW, (1,0)=XZ, (1,1)=YZ
;p2=parallel planes, p3=optional extra term
a=real(p1), b=flip(cos(asin(real(p1)))), d=a+b,
f=imag(p1), g=flip(cos(asin(imag(p1)))), h=f+g,
z=real(pixel)+flip(real(p2)),
c=flip(imag(pixel))+imag(p2):
z=(d*(sqr(z)))+(real(p3))*(z^(imag(p3)))+(h*c),
|z| <= 36
}

SkewPlanesSqr {; Jim Muth
;p1=(0,0)=YW, (0,1)=XW, (1,0)=XZ, (1,1)=YZ
a=real(p1), b=flip(cos(asin(real(p1)))), d=a+b,
f=imag(p1), g=flip(cos(asin(imag(p1)))), h=f+g,
z=real(pixel)+flip(real(p2)),
c=flip(imag(pixel))+imag(p2):
z=(d*(sqr(z)))+(h*c),
|z| <= 36
}

SnakeTree {; Jim Muth
 z=pixel:
  z=(-z)^1.095+3.4
   |z| <= 100
  }

snowarch {; Jim Muth
z=c=pixel:
a=sqr(z)+c-p1*z-c
b=p2*sqr(z)+c-1
z=z-1*a/b
p3 <= |a|
}

Test02 {; Jim Muth
z=pixel, d=real(p3),
f=imag(p3), c=d*(pixel^f):
z=sqr(z)+(p1*z^p2)+c,
|z| <= 100
}

Test0622       { ; Jim Muth
z=p1, c=fn1(pixel)+p2:
z=sqr(z)+c
|z| <16  }

Test15 {; Jim Muth
z=pixel, a=real(p1), b=imag(p1), c=real(p2),
d=imag(p2), k=real(p3), f=imag(p3), g=f*(pixel):
z=((a*(z^b))+(c*(z^d)))^k+g,
|z| <= 100
}

Test16 {; Jim Muth
z=pixel, a=real(p1), b=imag(p1), c=real(p2),
d=imag(p2), k=real(p3), f=imag(p3), g=f*(pixel):
z=((a*(-z^b))+(c*(-z^d)))^k+g,
|z| <= 100
}

Test17 {; Jim Muth
z=pixel, a=real(p1), b=imag(p1), c=real(p2),
d=imag(p2), k=real(p3), f=imag(p3), g=f*(pixel):
z=(((a/z)^b)+((c/z)^d))^k+g,
|z| <= 100
}

TowerExp11 {; Jim Muth
z=pixel, c=p2+(p3*pixel):
z=z^(z^(z^(z^(z^(z^(z^(z^(z^(z^(z^(z+p1)))))))))))+c,
|z| <= 100
}

TowerMinExp01 {; Jim Muth
z=pixel, c=p2+(p3*pixel):
z=z^(-z+p1)+c,
|z| <= 100
}

TowerMinExp02 {; Jim Muth
z=pixel, c=p2+(p3*pixel):
z=z^(-z^(z+p1))+c,
|z| <= 100
}

TowerMinExp03 {; Jim Muth
z=pixel, c=p2+(p3*pixel):
z=z^(-z^(z^(-z+p1)))+c,
|z| <= 100
}

TowerMinExp04a {; Jim Muth
z=pixel, c=p2+(p3*pixel):
z=z^fn1(z^fn2(-z^fn3(z^fn4(-z+p1))))+c,
|z| <= 100
}

TowerMinExp05 {; Jim Muth
z=pixel, c=p2+(p3*pixel):
z=z^(-z^(z^(-z^(z^(-z+p1)))))+c,
|z| <= 100
}

VB-XY-YZrotation {; Jim Muth, thanks to Benno
; real(p1)=rotation angle in degrees, imag(p1)=bailout
; p2=parallel planes, p3=rotation point and parallel planes
a=real(p1), b=sqr(imag(p1)),
z=sin(a*.01745329251994)*real(pixel)+p2,
c=cos(a*.01745329251994)*real(pixel)+flip(imag(pixel))+p3:
z=sqr(z)+c,
|z| <= b
}

Woven {; Jim Muth
z=pixel, c=p1:
z=(-z)^1.05+c,
|z| <= 100
}

XWplane {; Jim Muth
z=flip(imag(pixel))+real(p1),
c=real(pixel)+flip(imag(p1)):
z=sqr(z)+c,
|z| <= 36
}

XWplaneN {; Jim Muth
z=flip(imag(pixel))+real(p1),
c=real(pixel)+flip(imag(p1)):
z=z^p2+c,
|z| <= 36
}

XY-XWrot-N {; Jim Muth, thanks to Benno Schmid
; real(p1) = rotation angle in degrees, imag(p1 = exponent of Z,
; p2 = parallel planes,
; p3 = point of rotation and parallel planes,
z=sin(real(p1)*.01745329251994)*flip(imag(pixel))+p2,
c=cos(real(p1)*.01745329251994)*flip(imag(pixel))+real(pixel)+p3:
z=(-z)^imag(p1)+c
|z| <= 25
}

XY-XWrotation {; Jim Muth, thanks to Benno Schmid
; p1 = rotation angle in degrees, p2 = parallel planes
; p3 = point of rotation and parallel planes
z=sin(p1*.01745329251994)*flip(imag(pixel))+p2,
c=cos(p1*.01745329251994)*flip(imag(pixel))+real(pixel)+p3:
z=sqr(z)+c
|z| <= 16
}

XY-XZrotation {; Jim Muth, thanks to Benno Schmid
; p1 = rotation angle in degrees, p2 = parallel planes
; p3 = point of rotation and parallel planes
z=sin(p1*.01745329251994)*imag(pixel)+p2,
c=cos(p1*.01745329251994)*flip(imag(pixel))+real(pixel)+p3:
z=sqr(z)+c
|z| <= 16
}

XY-XZrotN {; Jim Muth, thanks to Benno Schmid
 ; real(p1) = rotation angle in degrees, imag(p1 = exponent of Z,
 ; p2 = parallel planes,
 ; p3 = point of rotation and parallel planes,
  z=sin(real(p1)*.01745329251994)*imag(pixel)+p2,
  c=cos(real(p1)*.01745329251994)*flip(imag(pixel))+real(pixel)+p3:
   z=z^imag(p1)+c
    |z| <= 25
  }

XY-YZrot-N {; Jim Muth, thanks to Benno
; real(p1) = rotation angle in degrees, imag(p1 = exponent of Z,
; p2 = parallel planes,
; p3 = point of rotation and parallel planes,
z=sin(real(p1)*.01745329251994)*real(pixel)+p2,
c=cos(real(p1)*.01745329251994)*real(pixel)+flip(imag(pixel))+p3:
z=(-z)^imag(p1)+c,
|z| <= 25
}

XY-YZ-test02 {; Jim Muth (2nd revision)
; p1 = rotation angle in degrees, p2 = parallel planes
; p3 = axis of rotation and parallel planes
z=sin(p1*.01745329251994)*real(pixel)+p2,
c=cos(p1*.01745329251994)*real(pixel)+flip(imag(pixel))+p3:
z=sqr(z)+c,
|z| <= 16
}

XY-YZ-test03 {; Jim Muth
; real(p1)=rotation angle in degrees, imag(p1)=exponent of z
; p2=parallel planes, real(p3)=axis of rotation and parallel planes
; imag(p3) = escape radius
z=sin(real(p1)*.01745329251994)*real(pixel)+p2,
c=cos(real(p1)*.01745329251994)*real(pixel)+flip(imag(pixel))+real(p3):
z=z^imag(p1)+c,
|z| <= imag(p3)
}

XY-YZrotation {; Jim Muth, thanks to Benno
; p1 = rotation angle in degrees, p2 = parallel planes
; p3 = point of rotation and parallel planes
z=sin(p1*.01745329251994)*real(pixel)+p2,
c=cos(p1*.01745329251994)*real(pixel)+flip(imag(pixel))+p3:
z=sqr(z)+c,
|z| <= 16
}

XY-YZrotlow {; Jim Muth, thanks to Benno
; p1 = rotation angle in degrees, p2 = parallel planes
; p3 = point of rotation and parallel planes
z=sin(p1*.01745329251994)*real(pixel)+p2,
c=cos(p1*.01745329251994)*real(pixel)+flip(imag(pixel))+p3:
z=sqr(z)+c,
|z| <= 4
}

XYplane {; Jim Muth
z=p1, c=pixel:
z=sqr(z)+c,
|z| <=36
}

XZplane {; Jim Muth
z=imag(pixel)+flip(real(p1)),
c=real(pixel)+flip(imag(p1)):
z=sqr(z)+c,
|z| <= 36
}

YWplane {; Jim Muth
z=flip(real(pixel))+real(p1),
c=flip(imag(pixel))+imag(p1):
z=sqr(z)+c,
|z| <= 36
}

YZplane {; Jim Muth
z=real(pixel)+flip(real(p1)),
c=flip(imag(pixel))+imag(p1):
z=sqr(z)+c,
|z| <= 36
}

YZplaneN {; Jim Muth
z=real(pixel)+flip(real(p1)),
c=flip(imag(pixel))+imag(p1):
z=z^p2+c,
|z| <= 36
}

ZWplane {; Jim Muth
z=pixel, c=p1:
z=sqr(z)+c,
|z| <=36
}

ZWplane-N {; Jim Muth
z=pixel, c=p1:
z=(-z)^p2+c,
|z| <= 36
}