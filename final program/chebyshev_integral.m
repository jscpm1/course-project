function integral_value = chebyshev_integral(a, b, n, c)
    % Chebyshev nodes
    xi = cos((2*(0:n-1) + 1) * pi / (2*n));
    
    % Transformation to interval [a, b]
    x = (b - a) * (xi + 1) / 2 + a;
    
    % Chebyshev weights
    wi = pi / n;
    
    % Calculate integral approximation
    integral_value = (b - a) / 2 * sum(c .* sqrt(1 - xi.^2) .* wi);
end

