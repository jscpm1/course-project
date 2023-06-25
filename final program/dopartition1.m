function y=dopartition1(A,x)
i=findingposition(A,x);
B=dopartition(A,i,x);
y=B;