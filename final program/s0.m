function y=s0(boundary_condition,u,v)
A=boundary_condition;A=abs(A);
a=A(1,1);b=A(1,2);c=A(2,1);d=A(2,2);
gl0=gl(boundary_condition,u,v);
gl1=glder(boundary_condition,u,v);
gr0=gr(boundary_condition,u,v);
gr1=grder(boundary_condition,u,v);
y=gl0(u)*gr1(u)-gl1(u)*gr0(u);
