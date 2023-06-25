function y=chebyshev_nodes(a,b,K)
x=zeros(1,K);
for i=1:K
    x(i)=(b-a)*cos((2*K-2*i+1)*pi/(2*K))/2+(a+b)/2;
end
y=x;