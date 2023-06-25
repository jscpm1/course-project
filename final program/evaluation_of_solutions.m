function y=evaluation_of_solutions(boundary_condition,ui,uider,jli,jri,K,gr1,gl1,grder1,glder1,value_sigmai,bl,br)
u=zeros(1,K);uder=zeros(1,K);
taui=chebyshev_nodes(bl,br,K);
s=s0(boundary_condition,bl,br);
v=zeros(1,K);
for j=1:K
    v(j)=value_sigmai(j)*gl1(taui(j));
end
coe=chebyshev_coefficient1(v,bl,br,K);
coefl=left_spectral_integration(coe);
coefr=right_spectral_integration(coe);
for j=1:K
    u(j)=ui(taui(j))+gr1(taui(j))*(jli+sigma_bar(coefl,taui(j),bl,br))/s+gl1(taui(j))*(jri+sigma_bar(coefr,taui(j),bl,br))/s;
    uder(j)=uider+grder1(taui(j))*(jli+sigma_bar(coefl,taui(j),bl,br))/s+glder1(taui(j))*(jri+sigma_bar(coefr,taui(j),bl,br))/s;
end
y=[u;uder];