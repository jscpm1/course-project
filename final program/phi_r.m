function y=phi_r(pt,qt,boundary_condition,a,c)
s=s0(boundary_condition,a,c);
gl0=gl(boundary_condition,a,c);
gl1=glder(boundary_condition,a,c);
gr0=gr(boundary_condition,a,c);
gr1=grder(boundary_condition,a,c);
f=@(x) (pt(x)*gl1(x)+qt(x)*gl0(x))/s;
y=f;