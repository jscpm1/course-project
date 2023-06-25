function y=matrix_of_Isr(f)
K=max(size(f));
m=zeros(K,K);
m(2,1)=1;m(2,3)=-1/2;
for i=3:(K-1)
    m(i,i-1)=1/(2*i);
    m(i,i+1)=-1/(2*i);
end
m(K,K-1)=1/(2*K);
m=-m;
for j=1:K
    for i=2:(K-1)
        m(1,j)=m(1,j)-m(i,j);
    end
end
y=m;