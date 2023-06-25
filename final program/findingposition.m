function y=findingposition(A,x)
indices = find((A(:, 2)== 0) & (A(:, 4) < x) & (A(:, 5) > x));
j=indices;
y=A(j,1);
