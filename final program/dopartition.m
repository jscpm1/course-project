function y=dopartition(A,target_interval,interior_node)
A_size=size(A);
N=A_size(1);
n=find(A(:,1)==target_interval);
B=zeros(N+2,20);
B(1:N,:)=A;
a=B(n,2);
if a~=0
    y=A;
else
B(n,2)=N+1;B(n,3)=N+2;
B(N+1,1)=N+1;B(N+2,1)=N+2;
B(N+1,4)=B(n,4);B(N+1,5)=interior_node;
B(N+2,4)=interior_node;B(N+2,5)=B(n,5);
y=B;
end