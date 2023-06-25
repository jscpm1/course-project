b=0.1:0.1:0.9;
p=@(x) -0.5;
q=p;f=@(x) 0;
boundary_condition=[1,0;0,1];
ODEsolver(0,1,b,p,q,f,4,boundary_condition,[1;exp(1)])