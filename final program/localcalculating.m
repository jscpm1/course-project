function y=localcalculating(ft,pt,qt,a,c,bl,br,K,boundary_condition)
f1=Pinverse(ft,a,c,bl,br,boundary_condition,K,pt,qt);
phir=phi_r(pt,qt,boundary_condition,a,c);
phil=phi_l(pt,qt,boundary_condition,a,c);
phir1=Pinverse(phir,a,c,bl,br,boundary_condition,K,pt,qt);
phil1=Pinverse(phil,a,c,bl,br,boundary_condition,K,pt,qt);
gl1=gl(boundary_condition,a,c);gr1=gr(boundary_condition,a,c);
a1=@(x) phil1(x).*gl1(x);a2=@(x) phil1(x).*gr1(x);
b1=@(x) phir1(x).*gl1(x);b2=@(x) phir1(x).*gr1(x);
d1=@(x) f1(x).*gl1(x);d2=@(x) f1(x).*gr1(x);
alphal=integral(a1,bl,br);alphar=integral(a2,bl,br);
betal=integral(b1,bl,br);betar=integral(b2,bl,br);
deltal=integral(d1,bl,br);deltar=integral(d2,bl,br);
y=[alphal,alphar,betal,betar,deltal,deltar];