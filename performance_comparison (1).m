close all
clear all;
SampFreq = 128;
t = 0:1/SampFreq:1-1/SampFreq;
f = linspace(0,SampFreq/2,128);
%% 

 load CNNTFDs.mat
load spike_tone;
noisy_crossing_FM(noisy_crossing_FM<0)=0;
I=post_processing_directional(Wv,3,8,44);
figure;
set(gcf,'Position',[20 100 640 500]);	    
set(gcf,'Color','w'); 
imagesc(t,f,I);
xlabel('Time / Sec','FontSize',24,'FontName','Times New Roman');
ylabel('Frequency / Hz','FontSize',20,'FontName','Times New Roman');title('(a)','FontSize',24,'FontName','Times New Roman');
set(gca,'FontSize',20);
%%%%%%%%%%%%%%%%%%%%%%%
%% EMBD
gsig=ifft(fft(Wv.').');
%%% 150
beta =0.1;
alpha = 0.1;
g=extnd_mbd(beta,alpha,0.5,128);
smg=gsig.*g;
tfd2=real(fft(ifft(smg.').'));
tfd2(tfd2<0)=0;
figure;
set(gcf,'Position',[20 100 640 500]);	    
set(gcf,'Color','w'); 
imagesc(t,f,tfd2);
xlabel('Time / Sec','FontSize',24,'FontName','Times New Roman');
ylabel('Frequency / Hz','FontSize',20,'FontName','Times New Roman');title('(b)','FontSize',24,'FontName','Times New Roman');
set(gca,'FontSize',20);
%%%%%%%%%%%%%%%%%%%%%%%

%% Compact kernel distribution
I = Wv;
g=cskabedbelchourini(128, 1, 0.2, 0.9);
am = (fftshift(ifft(I,[], 1),1));
am = (fftshift(fft(am, [], 2),2));
am=am.*g;

tfd = (fft(ifftshift(am,1), [], 1));
tfd=  ifft(fftshift(tfd,2), [], 2);
tfd=real(tfd);
atfd(tfd<0)=0;
figure;
set(gcf,'Position',[20 100 640 500]);	    
set(gcf,'Color','w'); 
imagesc(t,f,tfd);
xlabel('Time / Sec','FontSize',24,'FontName','Times New Roman');
ylabel('Frequency / Hz','FontSize',20,'FontName','Times New Roman');title('(c)','FontSize',24,'FontName','Times New Roman');
set(gca,'FontSize',20);
%%%%%%%%%%%%%%%%%%%%%%%

%% Autoencoder

%figure;imagesc(I)

figure;
set(gcf,'Position',[20 100 640 500]);	    
set(gcf,'Color','w'); 
imagesc(t,f,noisy_crossing_FM(:,:,1));
xlabel('Time / Sec','FontSize',24,'FontName','Times New Roman');
ylabel('Frequency / Hz','FontSize',20,'FontName','Times New Roman');title('(d)','FontSize',24,'FontName','Times New Roman');
set(gca,'FontSize',20);
%% 


%load Input_wvd_eeg_11;
%I=post_processing_directional(Input_wvd_eeg_11,3,8,44);
%figure;imagesc(I)

load Input_wvd_eeg_175;
I=post_processing_directional(Input_wvd_eeg_175,3,8,44);
%figure;imagesc(I)
figure;
set(gcf,'Position',[20 100 640 500]);	    
set(gcf,'Color','w'); 
imagesc(t,f,I);
xlabel('Time / Sec','FontSize',24,'FontName','Times New Roman');
ylabel('Frequency / Hz','FontSize',20,'FontName','Times New Roman');title('(a)','FontSize',24,'FontName','Times New Roman');
set(gca,'FontSize',20);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%
%% EMBD
Wv = Input_wvd_eeg_175;
gsig=ifft(fft(Wv.').');
%%% 150
beta =0.1;
alpha = 0.1;
g=extnd_mbd(beta,alpha,0.5,128);
smg=gsig.*g;
tfd2=real(fft(ifft(smg.').'));
tfd2(tfd2<0)=0;
figure;
set(gcf,'Position',[20 100 640 500]);	    
set(gcf,'Color','w'); 
imagesc(t,f,tfd2);
xlabel('Time / Sec','FontSize',24,'FontName','Times New Roman');
ylabel('Frequency / Hz','FontSize',20,'FontName','Times New Roman');title('(b)','FontSize',24,'FontName','Times New Roman');
set(gca,'FontSize',20);
%%%%%%%%%%%%%%%%%%%%%%%

%% Compact kernel distribution
I = Wv;
g=cskabedbelchourini(128, 1, 0.2, 0.9);
am = (fftshift(ifft(I,[], 1),1));
am = (fftshift(fft(am, [], 2),2));
am=am.*g;

tfd = (fft(ifftshift(am,1), [], 1));
tfd=  ifft(fftshift(tfd,2), [], 2);
tfd=real(tfd);
atfd(tfd<0)=0;
figure;
set(gcf,'Position',[20 100 640 500]);	    
set(gcf,'Color','w'); 
imagesc(t,f,tfd);
xlabel('Time / Sec','FontSize',24,'FontName','Times New Roman');
ylabel('Frequency / Hz','FontSize',20,'FontName','Times New Roman');title('(c)','FontSize',24,'FontName','Times New Roman');
set(gca,'FontSize',20);
%%%%%%%%%%%%%%%%%%%%%%%
% figure;imagesc(noisy_crossing_FM(:,:,6))
figure;
set(gcf,'Position',[20 100 640 500]);	    
set(gcf,'Color','w'); 
imagesc(t,f,noisy_crossing_FM(:,:,6));
xlabel('Time / Sec','FontSize',24,'FontName','Times New Roman');
ylabel('Frequency / Hz','FontSize',20,'FontName','Times New Roman');title('(d)','FontSize',24,'FontName','Times New Roman');
set(gca,'FontSize',20);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
load EEG_WVD;
I=post_processing_directional(squeeze(EEG_WVD(1,:,:)),3,8,44);

%figure;imagesc(I)
figure;
set(gcf,'Position',[20 100 640 500]);	    
set(gcf,'Color','w'); 
imagesc(t,f,I);
xlabel('Time / Sec','FontSize',24,'FontName','Times New Roman');
ylabel('Frequency / Hz','FontSize',20,'FontName','Times New Roman');title('(a)','FontSize',24,'FontName','Times New Roman');
set(gca,'FontSize',20);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%
%% EMBD
Wv = squeeze(EEG_WVD(1,:,:));
gsig=ifft(fft(Wv.').');
%%% 150
beta =0.1;
alpha = 0.1;
g=extnd_mbd(beta,alpha,0.5,128);
smg=gsig.*g;
tfd2=real(fft(ifft(smg.').'));
tfd2(tfd2<0)=0;
figure;
set(gcf,'Position',[20 100 640 500]);	    
set(gcf,'Color','w'); 
imagesc(t,f,tfd2);
xlabel('Time / Sec','FontSize',24,'FontName','Times New Roman');
ylabel('Frequency / Hz','FontSize',20,'FontName','Times New Roman');title('(b)','FontSize',24,'FontName','Times New Roman');
set(gca,'FontSize',20);
%%%%%%%%%%%%%%%%%%%%%%%

%% Compact kernel distribution
I = Wv;
g=cskabedbelchourini(128, 1, 0.2, 0.9);
am = (fftshift(ifft(I,[], 1),1));
am = (fftshift(fft(am, [], 2),2));
am=am.*g;

tfd = (fft(ifftshift(am,1), [], 1));
tfd=  ifft(fftshift(tfd,2), [], 2);
tfd=real(tfd);
atfd(tfd<0)=0;
figure;
set(gcf,'Position',[20 100 640 500]);	    
set(gcf,'Color','w'); 
imagesc(t,f,tfd);
xlabel('Time / Sec','FontSize',24,'FontName','Times New Roman');
ylabel('Frequency / Hz','FontSize',20,'FontName','Times New Roman');title('(c)','FontSize',24,'FontName','Times New Roman');
set(gca,'FontSize',20);
%%%%%%%%%%%%%%%%%%%%%%%


% figure;imagesc(noisy_crossing_FM(:,:,7))
figure;
set(gcf,'Position',[20 100 640 500]);	    
set(gcf,'Color','w'); 
imagesc(t,f,noisy_crossing_FM(:,:,7));
xlabel('Time / Sec','FontSize',24,'FontName','Times New Roman');
ylabel('Frequency / Hz','FontSize',20,'FontName','Times New Roman');title('(d)','FontSize',24,'FontName','Times New Roman');
set(gca,'FontSize',20);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
load adtfd_test_128;

I=post_processing_directional(squeeze(yy(2,:,:,3)),3,8,64);
% figure; 
% imagesc(I)
figure;
set(gcf,'Position',[20 100 640 500]);	    
set(gcf,'Color','w'); 
imagesc(t,f,I);

xlabel('Time / Sec','FontSize',24,'FontName','Times New Roman');
ylabel('Frequency / Hz','FontSize',20,'FontName','Times New Roman');title('(a)','FontSize',24,'FontName','Times New Roman');
set(gca,'FontSize',20);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% figure;
%%%%%%%%%%%%%%%%%%%%%%%
%% EMBD
Wv = squeeze(yy(2,:,:,3));
gsig=ifft(fft(Wv.').');
%%% 150
beta =0.1;
alpha = 0.1;
g=extnd_mbd(beta,alpha,0.5,128);
smg=gsig.*g;
tfd2=real(fft(ifft(smg.').'));
tfd2(tfd2<0)=0;
figure;
set(gcf,'Position',[20 100 640 500]);	    
set(gcf,'Color','w'); 
imagesc(t,f,tfd2);
xlabel('Time / Sec','FontSize',24,'FontName','Times New Roman');
ylabel('Frequency / Hz','FontSize',20,'FontName','Times New Roman');title('(b)','FontSize',24,'FontName','Times New Roman');
set(gca,'FontSize',20);
%%%%%%%%%%%%%%%%%%%%%%%

%% Compact kernel distribution
I = Wv;
g=cskabedbelchourini(128, 1, 0.2, 0.9);
am = (fftshift(ifft(I,[], 1),1));
am = (fftshift(fft(am, [], 2),2));
am=am.*g;

tfd = (fft(ifftshift(am,1), [], 1));
tfd=  ifft(fftshift(tfd,2), [], 2);
tfd=real(tfd);
atfd(tfd<0)=0;
figure;
set(gcf,'Position',[20 100 640 500]);	    
set(gcf,'Color','w'); 
imagesc(t,f,tfd);
xlabel('Time / Sec','FontSize',24,'FontName','Times New Roman');
ylabel('Frequency / Hz','FontSize',20,'FontName','Times New Roman');title('(c)','FontSize',24,'FontName','Times New Roman');
set(gca,'FontSize',20);
%%%%%%%%%%%%%%%%%%%%%%%


% imagesc(squeeze(noisy_crossing_FM(:,:,3)))
figure;
set(gcf,'Position',[20 100 640 500]);	    
set(gcf,'Color','w'); 
imagesc(t,f,noisy_crossing_FM(:,:,3));
xlabel('Time / Sec','FontSize',24,'FontName','Times New Roman');
ylabel('Frequency / Hz','FontSize',20,'FontName','Times New Roman');title('(d)','FontSize',24,'FontName','Times New Roman');
set(gca,'FontSize',20);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

load adtfd_test_128;

I=post_processing_directional(squeeze(yy(4,:,:,3)),3,8,64);
% figure; 
% imagesc(I)
figure;
set(gcf,'Position',[20 100 640 500]);	    
set(gcf,'Color','w'); 
imagesc(t,f,I);
xlabel('Time / Sec','FontSize',24,'FontName','Times New Roman');
ylabel('Frequency / Hz','FontSize',20,'FontName','Times New Roman');title('(a)','FontSize',24,'FontName','Times New Roman');
set(gca,'FontSize',20);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% figure;
%%%%%%%%%%%%%%%%%%%%%%%
%% EMBD
Wv = squeeze(yy(4,:,:,3));
gsig=ifft(fft(Wv.').');
%%% 150
beta =0.1;
alpha = 0.1;
g=extnd_mbd(beta,alpha,0.5,128);
smg=gsig.*g;
tfd2=real(fft(ifft(smg.').'));
tfd2(tfd2<0)=0;
figure;
set(gcf,'Position',[20 100 640 500]);	    
set(gcf,'Color','w'); 
imagesc(t,f,tfd2);
xlabel('Time / Sec','FontSize',24,'FontName','Times New Roman');
ylabel('Frequency / Hz','FontSize',20,'FontName','Times New Roman');title('(b)','FontSize',24,'FontName','Times New Roman');
set(gca,'FontSize',20);
%%%%%%%%%%%%%%%%%%%%%%%

%% Compact kernel distribution
I = Wv;
g=cskabedbelchourini(128, 1, 0.2, 0.9);
am = (fftshift(ifft(I,[], 1),1));
am = (fftshift(fft(am, [], 2),2));
am=am.*g;

tfd = (fft(ifftshift(am,1), [], 1));
tfd=  ifft(fftshift(tfd,2), [], 2);
tfd=real(tfd);
atfd(tfd<0)=0;
figure;
set(gcf,'Position',[20 100 640 500]);	    
set(gcf,'Color','w'); 
imagesc(t,f,tfd);
xlabel('Time / Sec','FontSize',24,'FontName','Times New Roman');
ylabel('Frequency / Hz','FontSize',20,'FontName','Times New Roman');title('(c)','FontSize',24,'FontName','Times New Roman');
set(gca,'FontSize',20);
%%%%%%%%%%%%%%%%%%%%%%%


% imagesc(squeeze(noisy_crossing_FM(:,:,4)))
figure;
set(gcf,'Position',[20 100 640 500]);	    
set(gcf,'Color','w'); 
imagesc(t,f,noisy_crossing_FM(:,:,4));
xlabel('Time / Sec','FontSize',24,'FontName','Times New Roman');
ylabel('Frequency / Hz','FontSize',20,'FontName','Times New Roman');title('(d)','FontSize',24,'FontName','Times New Roman');
set(gca,'FontSize',20);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
load adtfd_test_128_noisy;

I=post_processing_directional(squeeze(yy(4,:,:,3)),3,8,64);
% figure; 
% imagesc(I)
figure;
set(gcf,'Position',[20 100 640 500]);	    
set(gcf,'Color','w'); 
imagesc(t,f,I);
xlabel('Time / Sec','FontSize',24,'FontName','Times New Roman');
ylabel('Frequency / Hz','FontSize',20,'FontName','Times New Roman');title('(a)','FontSize',24,'FontName','Times New Roman');
set(gca,'FontSize',20);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% figure;
%%%%%%%%%%%%%%%%%%%%%%%
%% EMBD
Wv = squeeze(yy(4,:,:,3));
gsig=ifft(fft(Wv.').');
%%% 150
beta =0.1;
alpha = 0.1;
g=extnd_mbd(beta,alpha,0.5,128);
smg=gsig.*g;
tfd2=real(fft(ifft(smg.').'));
tfd2(tfd2<0)=0;
figure;
set(gcf,'Position',[20 100 640 500]);	    
set(gcf,'Color','w'); 
imagesc(t,f,tfd2);
xlabel('Time / Sec','FontSize',24,'FontName','Times New Roman');
ylabel('Frequency / Hz','FontSize',20,'FontName','Times New Roman');title('(b)','FontSize',24,'FontName','Times New Roman');
set(gca,'FontSize',20);
%%%%%%%%%%%%%%%%%%%%%%%

%% Compact kernel distribution
I = Wv;
g=cskabedbelchourini(128, 1, 0.2, 0.9);
am = (fftshift(ifft(I,[], 1),1));
am = (fftshift(fft(am, [], 2),2));
am=am.*g;

tfd = (fft(ifftshift(am,1), [], 1));
tfd=  ifft(fftshift(tfd,2), [], 2);
tfd=real(tfd);
atfd(tfd<0)=0;
figure;
set(gcf,'Position',[20 100 640 500]);	    
set(gcf,'Color','w'); 
imagesc(t,f,tfd);
xlabel('Time / Sec','FontSize',24,'FontName','Times New Roman');
ylabel('Frequency / Hz','FontSize',20,'FontName','Times New Roman');title('(c)','FontSize',24,'FontName','Times New Roman');
set(gca,'FontSize',20);
%%%%%%%%%%%%%%%%%%%%%%%


% imagesc(squeeze(noisy_crossing_FM(:,:,5)))
figure;
set(gcf,'Position',[20 100 640 500]);	    
set(gcf,'Color','w'); 
imagesc(t,f,noisy_crossing_FM(:,:,5));
xlabel('Time / Sec','FontSize',24,'FontName','Times New Roman');
ylabel('Frequency / Hz','FontSize',20,'FontName','Times New Roman');title('(d)','FontSize',24,'FontName','Times New Roman');
set(gca,'FontSize',20);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
