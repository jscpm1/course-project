function y=right_spectral_integration(f)
K=max(size(f));
a=zeros(1,K);
a(2)=2*f(1)-f(3);a(2)=-a(2)/2;
for k=3:(K-1)
    a(k)=(f(k-1)-f(k+1));
    a(k)=-a(k)/(2*k);
end
a(K)=f(K-1)/(2*K);
for i=2:K
    a(1)=a(1)-a(i);
end
y=a;