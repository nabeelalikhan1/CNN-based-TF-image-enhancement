close all;
clear all;
addpath('D:\tfsa_5-5\windows\win64_bin');
N=128;
n=0:N-1;

JJ=1;
%SL_1=[0.25 0.25 0.35 -0.35 0  0   0  0.1 ];   
for k=1:50 % 5000

c=rand(1,16)-0.5;

IF1=c(1)+c(2)*(n/N)+c(3)*(n/N).^2;
IF2=c(4)+c(5)*(n/N)+c(6)*(n/N).^2;
%IF3=c(7)+c(8)*(n/N)+c(9)*(n/N).^2;
%IF4=c(10)+c(11)*(n/N)+c(12)*(n/N).^2;

s1=exp(2*pi*1i*filter(1,[1 -1],IF1));
s2=exp(2*pi*1i*filter(1,[1 -1],IF2));
%s3=exp(2*pi*1i*filter(1,[1 -1],IF3));
%s4=exp(2*pi*1i*filter(1,[1 -1],IF4));
cc=rand(1);
s_train=zeros(1,N);
start_index=randperm(20,1)+1;
i=0:5;
loc=start_index+20*i;
s_train(loc)=cc;
%s1=exp(2*pi*1i*(0.05*n+0.0025*n.^2));
%s2=exp(2*pi*1i*(0.15*n+0.0025*n.^2));

x=s_train;
 [~, Wv] = wvd1(x);
 %figure;
 %tfsapl(x,Wv)
 Inew=zeros(N,N);

 


for kk=-1:1 
    if and(loc+kk>0,loc+kk<=N)
    Inew(:,loc+kk)=(1/(2*abs(kk)+1))*cc^2;
    end

end
 
 
%Output(:,:,1,k)=Inew/max(abs(Inew(:)));


[I1,~]= post_processing_directional(Wv,3,8,64);

[I2,~]= post_processing_directional(Wv,2,20,84);
% Input(k,:,:,1)=abs(Ia1)/max(abs(Ia1(:)));
% Input(k,:,:,2)=abs(Ia2)/max(abs(Ia2(:)));
 %Input(k,:,:,3)=Wv/max(abs(Wv(:)));

 
 Input_wvd=Wv/max(abs(Wv));
 Output(JJ,:,:,1)=Inew/max(abs(Inew(:)));
    Input(JJ,:,:,1)=I1/max(abs(I1(:)));
    Input(JJ,:,:,2)=I2/max(abs(I2(:)));
 

    JJ=JJ+1;

end

save('multi_view_adtfd_spike','Input','Output');
save('wvd_spike','Input_wvd','Output');
