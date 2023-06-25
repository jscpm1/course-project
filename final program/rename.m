function y=rename(A,old_name,new_name)
i=old_name;i=old_name;
A(:, 1:3) = A(:, 1:3) .* (A(:, 1:3) ~= i) + (A(:, 1:3) == i) * j;