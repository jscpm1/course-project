function y=precalintegral(finest_interval)
a=size(finest_interval);M=a(1);K=a(2)-1;
Jr=zeros(1,M);Jl=zeros(1,M);
for i=1:(M-1)
    alpha_l=finest_interval(i,6);
    beta_l=finest_interval(i,8);
    delta_l=finest_interval(i,10);
    lamda_l=finest_interval(i,13);
    lamda_r=finest_interval(i,14);
    Jl(i+1)=Jl(i)+delta_l+lamda_l*alpha_l+lamda_r*beta_l;
end
for i=M:-1:2
    alpha_r=finest_interval(i,7);
    beta_r=finest_interval(i,9);
    delta_r=finest_interval(i,11);
    lamda_l=finest_interval(i,13);
    lamda_r=finest_interval(i,14);
    Jr(i-1)=Jr(i)+delta_r+lamda_l*alpha_r+lamda_r*beta_r;
end
y=[Jr;Jl];


