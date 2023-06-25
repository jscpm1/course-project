function y=glder(boundary_condition,u,v)
A=boundary_condition;A=abs(A);
a=A(1,1);b=A(1,2);c=A(2,1);d=A(2,2);
if a<b && c<d
    y=@(x) b*sinh(x-u)-a*cosh(x-u);
else
    y=@(x) a;
end