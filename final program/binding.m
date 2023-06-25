function y=binding(A,i,j)
A_size=size(A);
B=A;
N=A_size(1);
a1=max(i,j);a2=min(i,j);
B([i,j],:)=[];
if a1==N && a2==(N-1)
    y=B;
elseif a1==N && a2<(N-1)
    y=rename(B,N-1,a2);
elseif a1==(N-1)
    y=rename(B,N,a2);
else
    B=rename(B,N,a1);
    B=rename(B,N-1,a2);
    y=B;
end
