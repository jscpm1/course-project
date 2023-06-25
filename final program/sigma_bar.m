function y=sigma_bar(sigma,x,bl,br)
K=max(size(sigma));s=0;
for i=1:K
    s=s+sigma(i)*chebshevpoly(i-1,2*(x-bl)/(br-bl)-1);
end
y=s;
