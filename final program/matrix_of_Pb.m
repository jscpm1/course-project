function y=matrix_of_Pb(a,c,boundary_condition,K,bl,br,pt,qt)
p=zeros(K,K);
tau=chebyshev_nodes(bl,br,K);
sigma=zeros(1,K);
for i=1:K
    for j=1:K
        sigma=zeros(K);
        sigma(i)=1;
        p(j,i)=Pb(sigma,K,a,c,bl,br,tau(j),boundary_condition,pt,qt);
    end
end
y=p;