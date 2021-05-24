%% Corr

clc;
clear all;
close all;

path = strcat('/home/shivangi/Desktop/sem/sem7/odors_DC/odor2_var/Trial 1/data0');
cd(path);

DT = 0.2;        % sampling time: ms

nmitx = 5;
nmity = 5;
npgx  = 5;
npgy  = 5;
ngranx = 10;
ngrany = 10;


for i = 0:1:(nmitx-1)
   for j = 0:1:(nmity-1) 
     s = ['load Vms' '_' int2str(i) '_' int2str(j) ';'];    
     eval(s);
   
   end
end

% V= smoothdata(Vms_0_0);
% Filt = designfilt('hilbertfir','FilterOrder',18,'TransitionWidth',0.25);
% data= filter(Filt,Vms_0_0);

H =  sigwin.tukeywin(50,0.001);
kernel = generate(H);

for i = 0:1:(nmitx-1)
   for j = 0:1:(nmity-1)   
     p = ['F = Vms' '_' int2str(i) '_' int2str(j) ';'];
     eval(p); 
     s = ['V' '_' int2str(i) '_' int2str(j) '= conv(F,kernel);'];
     eval(s); 
   end 
end


figure(1), clf
% plot the signal (impulse or boxcar)
subplot(311)
plot(Vms_0_0)
title('Signal')

% plot the kernel
subplot(312)
plot(kernel)
title('Kernel')

% plot the result of convolution
subplot(313)
plot(V_0_0)
title('Result of convolution')

P2_1 = [V_0_0  V_0_1  V_0_2  V_0_3  V_0_4  V_1_0  V_1_1  V_1_2  V_1_3  V_1_4  V_2_0  V_2_1  V_2_2  V_2_3  V_2_4  V_3_0  V_3_1  V_3_2  V_3_3  V_3_4  V_4_0  V_4_1  V_4_2  V_4_3  V_4_4];
C= corrcoef(P2_1);
%[c,lags] = xcorr(P1_1(1,:), P2_1(1,:));

path = strcat('/home/shivangi/Desktop/sem/sem7/odors_DC/Analysis/Convolve');
cd(path);
save('P2_1')







