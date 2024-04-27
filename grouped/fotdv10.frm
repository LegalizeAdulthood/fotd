; FOTDv10.frm
; Compilation of Fractint formulas required for Jim Muth's FOTD series 12.Apr.06 - 11.Apr.07.
; This is a companion file to FOTD_v10.par
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

multirot-XZ-YW-new {
; Jim Muth
  ; 0,0=para, 90,0=obl, 0,90=elip, 90,90=rect
  e=exp(flip(real(p1*.01745329251994))),
  f=exp(flip(imag(p1*.01745329251994))),
  z=f*real(pixel)+p3, c=e*imag(pixel)+p4:
  z=z^(p2)+c,
  |z| <= 36 
}

multimin-XY-ZW-new {
; draws 6 planes and rotations
  ;when fn1-2=i,f, then p1 0,0=M, 0,90=O, 90,0=E, 90,90=J
  ;when fn1-2=f,i, then p1 0,0=M, 0,90=R, 90,0=P, 90,90=J
  a=real(p1)*.01745329251994, b=imag(p1)*.01745329251994,
  z=sin(b)*fn1(real(pixel))+sin(a)*fn2(imag(pixel))+p3,
  c=cos(b)*real(pixel)+cos(a)*flip(imag(pixel))+p4:
  z=(-z)^(p2)+c,
  |z| <= 36 
}

OldOblate {
; Jim Muth  real(z),imag(c)
  z=real(pixel)+flip(real(p1)),
  c=flip(imag(pixel))+imag(p1):
  z=sqr(z)+c,
  |z| <= 16 
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

JulibrotZ-New {
; Jim Muth
  ; Draws oblique slices of order n Julibrot Figure
  ; P1 defines power of Z, P2 determines center of slice
  ; P3 determines angle of slice
  z=pixel, c=p2+(pixel*p3):
  z=z^p1+c,
  |z| < p4+100 
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

Neo_T-set {
 ; Russell Walsmith
  X=real(pixel), Y=imag(pixel), V=real(p1) 
  x1 = y1 = v1 = 0: 
  x2 = x1^2-y1^2-v1^2 + X 
  y2 = 2*x1*y1 + Y 
  v2 = 2*x1*v1 + V 
  x1=x2, y1=y2, v1=v2 
  z = x1^2+y1^2+v1^2 
  z < 8 
}

MandelbrotCube {
; Jim Muth  real(c),imag(c)
  z=p1, c=pixel+p2:
  z=z*(sqr(z))+c,
  |z| <= 16 
}

MandelbrotN {
; Jim Muth
  b=p1, z=p2, c=p3+pixel:
  z=z^(b)+c,
  |z| <= 16 
}

HyperSquare {
; Jim Muth
  a=(p1),b=(0,0):
  q=sqr(a)-sqr(b)+pixel
  b=p2*a*b+p3
  a=q,
  |a|+|b| <= 100 
}
