function y=Pinverse(f,a,c,bl,br,boundary_condition,K,pt,qt)
P=matrix_of_Pb(a,c,boundary_condition,K,bl,br,pt,qt);
nodes=chebyshev_nodes(bl,br,K);
v=zeros(K,1);
for i=1:K
    v(i)=f(nodes(i));
end
sigma=v\P;
y=@(x) sigma_bar(sigma,x,bl,br);
