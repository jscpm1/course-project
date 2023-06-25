function y=localvalue(ft,pt,qt,a,c,bl,br,K,boundary_condition,lamda_l,lamda_r)
f1=Pinverse(ft,a,c,bl,br,boundary_condition,K,pt,qt);
phir=phi_r(pt,qt,boundary_condition,a,c);
phil=phi_l(pt,qt,boundary_condition,a,c);
phir1=Pinverse(phir,a,c,bl,br,boundary_condition,K,pt,qt);
phil1=Pinverse(phil,a,c,bl,br,boundary_condition,K,pt,qt);
node=chebyshev_nodes(bl,br,K);value=zeros(1,K);
for i=1:K
    value(i)=f1(node(i))+lamda_l*phil1(node(i))+lamda_r*phir1(node(i));
end
y=value;