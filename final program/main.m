p=@(x) x;
q=@(x) x;
f=@(x) x;
a=-1;c=1;
boundary_condition=[1,2;3,4];
gammal=1;gammmar=2;gamma=[gammmal;gammmar];
pt=p;
A=boundary_condition,A=abs(A);
if A(1,1)<A(1,2) && A(2,1)<A(2,2)
    qt=@(x) q(x)+1;
else
    qt=q;
end
B=[A(1,1)*a+A(1,2),A(1,1);A(2,1)*c+A(2,2),A(2,1)];
b0=gamma\B;
ui=@(x) b0(1)*x+b0(2);
ft=@(x) f(x)-(p(x)*b0(1)+q(x)*ui(x));