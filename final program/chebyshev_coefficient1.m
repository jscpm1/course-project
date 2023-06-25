function y=chebyshev_coefficient1(f,a,b,K)
tau=chebyshev_nodes(a,b,K);
alpha=zeros(1,K);
for j=1:K
    alpha(1)=alpha(1)+f(j);
end
for i=2:K
    for j=1:K
        alpha(i)=alpha(i)+2*f(j)*cos(i*acos(tau(j)));
    end
end
y=alpha/K;