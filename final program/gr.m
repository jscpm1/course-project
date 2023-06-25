function y=gr(boundary_condition,u,v)
A=boundary_condition;A=abs(A);
a=A(1,1);b=A(1,2);c=A(2,1);d=A(2,2);
if a<b && c<d
    y=@(x) d*cosh(x-v)-c*sinh(x-v);
else
    y=@(x) d*(x-v)-c;
end