function y=calcoefficient(A,i)
son1=A(i,2);son2=A(i,3);
alpha_Dl=A(son1,6);alpha_Dr=A(son1,7);
beta_Dl=A(son1,8);beta_Dr=A(son1,9);
delta_Dl=A(son1,10);delta_Dr=A(son1,11);
alpha_El=A(son2,6);alpha_Er=A(son2,7);
beta_El=A(son2,8);beta_Er=A(son2,9);
delta_El=A(son2,10);delta_Er=A(son2,11);
delta1=1-alpha_Er*beta_Dl;
alpha_Bl=(1-alpha_El)*(alpha_Dl-beta_Dl*alpha_Er)/delta1+alpha_El;
alpha_Br=alpha_Er*(1-beta_Dr)*(1-alpha_Dl)/delta1+alpha_Dr;
beta_Bl=beta_Dl*(1-beta_Er)*(1-alpha_El)/delta1+beta_El;
beta_Br=(1-beta_Dr)*(beta_Er-beta_Dl*alpha_Er)/delta1+beta_Dr;
delta_Bl=(1-alpha_El)*delta_Dl/delta1+delta_El+alpha_Dl*delta_Er*(alpha_El-1)/delta1;
delta_Br=(1-beta_Dr)*delta_Er/delta1+delta_Dr+alpha_Er*delta_Dl*(beta_Dr-1)/delta1;
B=A;B(i,6:11)=[alpha_Bl,alpha_Br,beta_Bl,beta_Br,delta_Bl,delta_Br];B(i,12)=1;
y=B;