function y=ODEsolver(a,c,b,p,q,f,K,boundary_condition,gamma)
pt=p;
A1=boundary_condition;A1=abs(A1);
if A1(1,1)<A1(1,2) && A1(2,1)<A1(2,2)
    qt=@(x) q(x)+1;
else
    qt=q;
end
B=[A1(1,1)*a+A1(1,2),A1(1,1);A1(2,1)*c+A1(2,2),A1(2,1)];
b0=gamma\B;
ui=@(x) b0(1)*x+b0(2);
ft=@(x) f(x)-(p(x)*b0(1)+q(x)*ui(x));
A=zeros(1,20);
A(1,1)=1;A(1,4)=a;A(1,5)=c;A(1,15)=1;
m=max(size(b));
for i=1:m
    A=dopartition1(A,b(i));
end
As=size(A);M=As(1);
for i=1:M
    if A(i,2)==0
        bl=A(i,4);br=A(i,5);
        A(i,6:11)=localcalculating(ft,pt,qt,a,c,bl,br,K,boundary_condition);
        A(i,12)=1;
    end
end
while any(A(:,12)==0)
    for i=1:M
        if A(i,12)==0
            son1=A(i,2);son2=A(i,3);
            if A(son1,12)==1 && A(son2,12)==1
                A=calcoefficient(A,i);
            end
        end
    end
end
while any(A(:,15)==0)
    for i=1:M
        if A(i,15)==1
            son1=A(i,2);
            if son1~=0
            if A(son1,15)==0
                A=calcoefficientlamda(A,i);
            end
            end
        end
    end
end
value_sigmab=zeros(m+1,K);
temp1=A(:,2);
finest_interval=A(temp1==0,:);
finest_interval=sortrows(finest_interval,4);
for i=1:(m+1)
    lamda_l=finest_interval(i,13);lamda_r=finest_interval(i,14);
    bl=finest_interval(i,4);br=finest_interval(i,5);
    value_sigmab(i,:)=localvalue(ft,pt,qt,a,c,bl,br,K,boundary_condition,lamda_l,lamda_r);
end
J=precalintegral(finest_interval);
jr=zeros(1,m+1);jl=zeros(1,m+1);
for i=1:m+1
    jr(i)=J(1,i);jl(i)=J(2,i);
end
U=zeros(m+1,K);Uder=zeros(m+1,K);
gr1=gr(boundary_condition,a,c);
grder1=grder(boundary_condition,a,c);
gl1=gl(boundary_condition,a,c);
glder1=glder(boundary_condition,a,c);
for i=1:(m+1)
    bl=finest_interval(i,4);br=finest_interval(i,5);
    temp2=evaluation_of_solutions(boundary_condition,ui,b0(1),jl(i),jr(i),K,gr1,gl1,grder1,glder1,value_sigmab(i,:),bl,br);
    U(i,:)=temp2(1,:);Uder(i,:)=temp2(2,:);
end
y=[U,Uder];


