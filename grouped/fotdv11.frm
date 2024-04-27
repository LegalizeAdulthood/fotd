; FOTDv11.frm
; Compilation of Fractint formulas required for Jim Muth's FOTD series 12.Apr.07 - 11.Apr.08.
; This is a companion file to FOTD_v11.par
; Compiled by Roger Kaufman.

MandAutoCritInZ {; Jim Muth
  a=real(p1), b=imag(p1), d=real(p2), f=imag(p2),
  g=1/f, h=1/d, j=1/(f-b), z=(((-a*b*g*h)^j)+(p4)),
  k=real(p3)+1, l=imag(p3)+100, c=fn1(pixel):
  z=k*((a*(z^b))+(d*(z^f)))+c,
  |z| < l }

MandelbrotBC1   { ; by several Fractint users
  f=p1, a=imag(p2)+100
  p=real(p2)+PI
  q=2*PI*fn1(p/(2*PI))
  r=real(p2)-q
  Z=C=Pixel:
    Z=log(Z)
    IF(imag(Z) > r)
      Z=Z+flip(2*PI)
    ENDIF
    Z=exp(f*(Z+flip(q)))+C
  |Z| < a }

MandelbrotBC2   { ; by several Fractint users
  f=p1, a=imag(p2)+100, p=real(p2)+PI
  q=2*PI*floor(p/(2*PI)), r=real(p2)-q
  Z=C=Pixel:
    Z=log(Z)
    IF(imag(Z) > r)
      Z=Z+flip(2*PI)
    ENDIF
    Z=exp(f*(Z+flip(q)))+C
  |Z| < a }

MandelbrotBC3 {
 ; by several Fractint users
  f=p1, a=imag(p2)+100
  p=real(p2)+PI
  q=2*PI*fn1(p/(2*PI))
  r=real(p2)+PI-q
  Z=C=Pixel:
    Z=log(Z)
    IF(imag(Z) > r)
      Z=Z+flip(2*PI)
    ENDIF
    Z=exp(f*(Z+flip(q)))+C
  |Z| < a
}

MandelbrotMixImag {; Jim Muth
  z=p3, c=fn1(pixel),
  a=real(p1), b=imag(p1),
  d=real(p2), f=imag(p2):
  z=a*(z^b)+d*(z^flip(f))+c,
  |z| <= 100 }

HyperMandelbrot {
; periodicity must be turned off
  a=(p1),b=(0,0):
  q=sqr(a)-sqr(b)+pixel,
  b=(p2+2)*a*b+p3,
  a=q,
  |a|+|b| <= 100 
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

MandelbrotMiN {
; Jim Muth
  b=p1, z=p2, c=p3+pixel:
  z=(-z)^(b)+c,
  |z| <= 16 
}

SliceJulibrot2 {
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
  z=sqr(z)+c
  |z| <= 9 
}

SliceJulibrot2a {
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
  z=sqr(z)+c
  |z| <= real(p5+9) 
}

MandelPMnew {
; Jim Muth
  z=p2+10^(-100), c=pixel+(p3),
  a=real(p1)+1, b=imag(p1):
  z=a*((-z)^b+z^b)+c,
  |z| <= 250 
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

ManJul2CPwr {
; Jim Muth
  ; Creates and rotates ^2 Hyperbrot Figure
  ; P1 sets point of rotation, P2 sets angle of rotation
  ; P3 sets power of C
  z=c=pixel:
  z=sqr(z)+p1+(p2*(c^p3)),
  |z| <= 100 
}

MandelbrotVE-VP {
; Jim Muth  real(c),imag(c)
  a=p1, z=p2, c=pixel+p3,
  b=sqr(real(p4)):
  z=z^(a)+c,
  |z| < b 
}

MandelbrotN {
; Jim Muth
  b=p1, z=p2, c=p3+pixel:
  z=z^(b)+c,
  |z| <= 16 
}

MandelbrotCube {
; Jim Muth  real(c),imag(c)
  z=p1, c=pixel+p2:
  z=z*(sqr(z))+c,
  |z| <= 16 
}

Oblate {
; Jim Muth  real(z),imag(c)
  z=real(pixel)+p1,
  c=flip(imag(pixel))+p2:
  z=sqr(z)+c,
  |z| <= 16 
}

MoreSlices {
; Jim Muth
  ; P1 -- M-center of slice
  ; P2 -- angle of slice
  ; P3 -- J-center of slice
  z=pixel+(p3), c=p1+(pixel*p2):
  z=sqr(z)+c,
  |z| < 16 
}

SliceJulibrot5 {
; draws slices of (-Z)^n Julibrot
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
  z=(-z)^(p5)+c
  |z|<=9 
}

EvenMoreSlices {
; Jim Muth
  ; P1--exponent, P2--angle,
  ; P3--M center, P4--J center,
  z=pixel+(p4), c=p3+(pixel*p2):
  z=(-z)^(p1)+c,
  |z| < 16 
}

HyperMandelbrot2 {
; periodicity must be turned off
  a=(p1),b=(p2):
  q=sqr(a)-sqr(b)+pixel,
  b=(p3+2)*a*b+p4,
  a=q,
  |a|+|b| <= 100 
}

MandelbrotGold {
; Jim Muth
  z=p1, c=p2+pixel,
  a=((sqrt(5)+1)*0.5):
  z=(-z)^(a)+c,
  |z| < 16 
}

MandelbrotMixImag2 {; Jim Muth
  z=p3, c=fn1(pixel),
  a=real(p1), b=imag(p1),
  d=real(p2), f=imag(p2):
  z=(a*(z^b))+(d*(z^flip(f)))+c,
  |z| <= 100
}

