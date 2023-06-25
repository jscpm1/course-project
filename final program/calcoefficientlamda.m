function y=calcoefficientlamda(A,i)
son1=A(i,2);son2=A(i,3);
lamda_Bl=A(i,13);lamda_Br=A(i,14);
alpha_Bl=A(i,6);alpha_Br=A(i,7);
beta_Bl=A(i,8);beta_Br=A(i,9);
delta_Bl=A(i,10);delta_Br=A(i,11);
alpha_Dl=A(son1,6);alpha_Dr=A(son1,7);
beta_Dl=A(son1,8);beta_Dr=A(son1,9);
delta_Dl=A(son1,10);delta_Dr=A(son1,11);
alpha_El=A(son2,6);alpha_Er=A(son2,7);
beta_El=A(son2,8);beta_Er=A(son2,9);
delta_El=A(son2,10);delta_Er=A(son2,11);
lamda_Dl=lamda_Bl;
lamda_Er=lamda_Br;
x=inv([1,alpha_Er;beta_Dl,1])*[lamda_Br*(1-beta_Er)-delta_Er;lamda_Bl*(1-alpha_Dl)-delta_Dl];
lamda_Dr=x(1);
lamda_El=x(2);
B=A;
B(son1,13:14)=[lamda_Dl,lamda_Dr];B(son1,15)=1;
B(son2,13:14)=[lamda_El,lamda_Er];B(son2,15)=1;
y=B;