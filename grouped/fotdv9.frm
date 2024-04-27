; FOTDv9.frm
; Compilation of Fractint formulas required for Jim Muth's FOTD series 12.Apr.05 - 11.Apr.06.
; This is a companion file to FOTD_v9.par
; Compiled by Roger Kaufman.

MandelbrotMix4 {
; Jim Muth
  a=real(p1), b=imag(p1), d=real(p2), f=imag(p2),
  g=1/f, h=1/d, j=1/(f-b), z=(-a*b*g*h)^j,
  k=real(p3)+1, l=imag(p3)+100, c=fn1(pixel):
  z=k*((a*(z^b))+(d*(z^f)))+c,
  |z| < l 
}

MandelbrotBC2 {
 ; by several Fractint users
  e=p1, a=imag(p2)+100
  p=real(p2)+PI
  q=2*PI*floor(p/(2*PI))
  r=real(p2)-q
  Z=C=Pixel:
    Z=log(Z)
    IF(imag(Z) > r)
      Z=Z+flip(2*PI)
    ENDIF
    Z=exp(e*(Z+flip(q)))+C
  |Z| < a 
}

Mystic2 {
; Jim Muth
  a=real(p1), b=imag(p1), c=real(p2),
  d=imag(p2), k=real(p3), f=imag(p3),
  g=pixel, z=(pixel)^a+(b*(pixel))^c:
  z=(fn1(z)+(d*(g)))^k+(f*(cos(g)))
  g=sqr(g),
  LastSqr <= 100 
}

JulibrotZ {
; Jim Muth
  ; Draws oblique slices of order n Julibrot Figure
  ; P1 defines power of Z, P2 determines center of slice
  ; P3 determines angle of slice
  z=pixel, c=p2+(pixel*p3):
  z=z^p1+c,
  |z| < 100 
}

JulibrotInvZ {
; Jim Muth
  ; Draws oblique slices of order n inverse Julibrot Figure
  ; P1 defines power of Z, P2 determines center of slice
  ; P3 determines angle of slice
  z=pixel, c=p2+(pixel*p3):
  z=(-z)^p1+c,
  |z| < 100 
}

MandelbrotN {
; Jim Muth
b=p1, z=p2, c=p3+pixel:
z=z^(b)+c,
|z| <= 16 
}

multirot-XZ-YW-new {
; Jim Muth
  ; 0,0=para, 90,0=obl, 0,90=elip, 90,90=rect
  e=exp(flip(real(p1*.01745329251994))),
  f=exp(flip(imag(p1*.01745329251994))),
  z=f*real(pixel)+p3, c=e*imag(pixel)+p4:
  z=z^(p2)+c,
  |z| <= 36 
}

multirot-XY-ZW-new {
; draws 6 planes and rotations
  ;when fn1-2=i,f, then p1 0,0=M, 0,90=O, 90,0=E, 90,90=J
  ;when fn1-2=f,i, then p1 0,0=M, 0,90=R, 90,0=P, 90,90=J
  a=real(p1)*.01745329251994, b=imag(p1)*.01745329251994,
  z=sin(b)*fn1(real(pixel))+sin(a)*fn2(imag(pixel))+p3,
  c=cos(b)*real(pixel)+cos(a)*flip(imag(pixel))+p4:
  z=z^(p2)+c,
  |z| <= 36 
}

JimsCompMand {
; Jim Muth
  z=c=pixel:
  z=z^p1*(c^p2)+c,
  |z| <= p3+100 
}

MandelbrotVE-VP {
; variable escape and power
  a=p1, z=p2, c=pixel+p3,
  b=sqr(real(p4)):
  z=z^(a)+c,
  |z| < b 
}

MandelbrotMix2way {
; Jim Muth
  z=0,0, c=pixel,
  a=real(p1), b=imag(p1), d=real(p2), f=imag(p2):
  z=(a*(z^b))+(d*(z^f))+c,
  |z| <= 100 
}

MandelbrotMix3a {
; Jim Muth
  z=real(p5), c=fn1(pixel), a=real(p1), b=imag(p1),
  d=real(p2), f=imag(p2), g=real(p3), h=imag(p3),
  j=real(p4), k=imag(p4), l=imag(p5)+100:
  z=(a*(z^b))+(d*(z^f))+(g*(z^h))+(j*(z^k))+c,
  |z| <=l 
}

ParabolicMix3 {
; Jim Muth
  z=imag(pixel)+flip(real(p5)),
  c=fn1(real(pixel))+flip(imag(p5)),
  a=real(p1), b=imag(p1), d=real(p2), f=imag(p2),
  g=real(p3), h=imag(p3), j=real(p4), k=imag(p4):
  z=(a*(z^b))+(d*(z^f))+(g*(z^h))+(j*(z^k))+c,
  |z| <= 100 
}

ManZpwrAbs {
; Jim Muth
  z=c=pixel:
  z=(p1*(z^|z|))+(p2*z^p3)+c,
  |z| <= 100 
}

TowerExp02 {
; Jim Muth
  z=pixel, c=p2+(p3*pixel):
  z=z^(z^(z+p1))+c,
  |z| <= 100 
}

TestZero {
 ; Jim Muth
z=p1, c=pixel:
z=z*c^fn1(z),
|z| <p2 
}

CrazyMidgets {
; Jim Muth
  c=pixel, a=real(p1), b=imag(p1), d=real(p2), f=imag(p2),
  g=1/f, h=1/d, j=1/(f-b), z=(-a*b*g*h)^j:
  z=(a*(z^b))+(d*(z^f))+c,
  |z| <= 100 
}

FrankJim04 {
; by Frank and Jim
  z=c=pixel:
  z=((z^z)^(1/z))^2+c,
  |z| <= 100 
}

cascade {
 ; 
  z=c=pixel:
  a=sqr(z)+(c-1)*z-c
  b=3*sqr(z)+c-1
  z=z-2*a/b,
  .000000000000000000000000000001 <= |a| 
}

Mytest07 {
; Jim Muth
  z=pixel, a=real(p2), b=imag(p2), c=b*(pixel):
  z=(((z^p1)*(z+a))^p3)^(-p3)+c,
  |z| <= 100 
}

Mytest09 {
; Jim Muth
  z=fn1(pixel), a=real(p3),
  b=imag(p3), c=a+(b*pixel):
  z=(((z^p1)*fn2(z))^p2)^(-p2)+c,
  |z| <= 100 
}

MandelPMnew {
; Jim Muth
  z=p2+10^(-100),
  c=pixel+(p3)
  a=real(p1)+1, b=imag(p1):
  z=a*((-z)^b+z^b)+c,
  |z| <= 250 
}

MytestAG {
; Jim Muth
  z=c=pixel,
  a=flip(real(p1)), b=flip(imag(p1)):
  z=(z^a)^(-b)+c,
  |z| <= 100 
}

MytestAH {
; Jim Muth
  z=1, c=pixel:
  z=z^p1+z^(-p1)+c,
  |z| <= 100 
}

MytestAGnew {
; Jim Muth
  z=c=pixel,
  a=flip(real(p1)), b=flip(imag(p1)),
  d=real(p2), f=imag(p2):
  z=(d*(z^a))^(f*(-b))+c,
  |z| <= 100 
}

Test0622 {
 ; Jim Muth
  z=p1, c=fn1(pixel)+p2:
  z=sqr(z)+c
  |z| < 16 
}

MixUpJ2 {
; (c) Jay Hill, 1998
      ; make sure p1 <> p2 and p3 <> 0
  u=p1, v=p2, w=p3, x=v-u
  c=pixel/w, z=(-u/v/w)^(1/x):
  z=z^u + w*z^v + c
  |z| <= 1000 
}

Wallpaper {
 ; 
  ; use fp math, no periodicity, XY symmetry
  ; p1=location in M-set
  ; p2=magnitude
  z=c=p1+(1/p2)*(tan(cos(real(pixel)))\
  +flip(tan(cos(imag(pixel))))):
  z=z*z+c,
  |z| <= 64 
}

ManJul2CPwr {
; Jim Muth
  ; Creates and rotates ^2 Hyperbrot Figure
  ; P1 sets point of rotation, P2 sets angle of rotation
  ; P3 sets power of C
  z=c=pixel:
  z=sqr(z)+p1+(p2*(c^p3)),
  |z| <= 100 
}

Test-01 {
; Jim Muth
  z=real(pixel)+(p1*(fn1(imag(pixel))))
  c=p2*real(pixel)+fn2(imag(pixel)):
  z=z^p3+c
  |z| <= 100 
}

JuliaBC {
 ; Formula by Andrew Coppin
  e=p1, p=real(p2)+PI, q=2*PI*floor(p/(2*PI)),
  r=real(p2)-q, C=p3, Z=Pixel:
    Z=log(Z)
    IF(imag(Z)>r)
      Z=Z+flip(2*PI)
    ENDIF
    Z=exp(e*(Z+flip(q)))+C
  |Z|< p4+100 
}

C4G {
; p1 is (plus or minus) 1 or i 
  x=real(pixel), y=imag(pixel)*p1
  a=b=0:
  a1 = a^2-p1^2*b^2
  b1 = 2*a*b
  a=a1+x, b=b1+y
  z = sqrt(a^2 + b^2)
  z < 4 
}

JuliaMix-1 {
; Jim Muth
  z=pixel, c=p3, a=real(p1), b=imag(p1),
  d=real(p2), f=imag(p2):
  z=(a*(z^b))+(d*(z^f))+fn1(c),
  |z| <= 100 
}

SliceJulibrot2 {
; draws all slices of Julibrot
  pix=pixel, u=real(pix), v=imag(pix),
  a=pi*real(p1*0.0055555555555556),
  b=pi*imag(p1*0.0055555555555556),
  g=pi*real(p2*0.0055555555555556),
  d=pi*imag(p2*0.0055555555555556),
  ca=cos(a), cb=cos(b), sb=sin(b), cg=cos(g),
  sg=sin(g), cd=cos(d), sd=sin(d),
  p=u*cg*cd-v*(ca*sb*sg*cd+ca*cb*sd),
  q=u*cg*sd+v*(ca*cb*cd-ca*sb*sg*sd),
  r=u*sg+v*ca*sb*cg, s=v*sin(a),
  c=p+flip(q)+p3, z=r+flip(s)+p4:
  z=sqr(z)+c
  |z| <= 9 
}

Elliptic {
; Jim Muth  imag(z),real(c)
  z=flip(imag(pixel))+p1,
  c=real(pixel)+p2:
  z=sqr(z)+c,
  |z| <= 16 
}

JuliaMixRecip {
; Jim Muth
  z=pixel, c=p3,
  a=real(p1), b=imag(p1), d=real(p2), f=imag(p2):
  z=(a*(z^b))+(d*(z^f))+(1/c),
  |z| <= 100 
}

SliceJulibrot4 {
; draws most slices of Julibrot
  pix=pixel, u=real(pix), v=imag(pix),
  a=pi*real(p1*0.0055555555555556),
  b=pi*imag(p1*0.0055555555555556),
  g=pi*real(p2*0.0055555555555556),
  d=pi*imag(p2*0.0055555555555556),
  ca=cos(a), cb=cos(b), sb=sin(b), cg=cos(g),
  sg=sin(g), cd=cos(d), sd=sin(d),
  p=u*cg*cd-v*(ca*sb*sg*cd+ca*cb*sd),
  q=u*cg*sd+v*(ca*cb*cd-ca*sb*sg*sd),
  r=u*sg+v*ca*sb*cg, s=v*sin(a),
  c=p+flip(q)+p3, z=r+flip(s)+p4:
  z=z^(p5)+c
  |z| <= 9 
}
