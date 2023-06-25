function y=phi_l(pt,qt,boundary_condition,a,c)
s=s0(boundary_condition,a,c);
gl0=gl(boundary_condition,a,c);
gl1=glder(boundary_condition,a,c);
gr0=gr(boundary_condition,a,c);
gr1=grder(boundary_condition,a,c);
f=@(x) (pt(x)*gr1(x)+qt(x)*gr0(x))/s;
y=f;
