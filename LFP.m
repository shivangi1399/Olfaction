% Plot LFP, FFT spectrum etc. 

clc;
clear all;
close all;

path = strcat('/home/shivangi/Desktop/sem/sem7/odors_DC/less inhibition/odor1_var/high noise/Trial 1/data0');
cd(path);

load tt;   %t     
load Vam;        
load Vag;
load Vap;


FILORDER = 1000;

%============================================
% Load each MC/GC voltage and get the average
nmitx = 5;
nmity = 5;
ngranx=10;
ngrany=10;
nMit = nmitx*nmity;
nGran= ngranx*ngrany;

U = 0;
MU= 0;


%============================================
DT = 0.2;          % sampling time: ms

T1 = 1;   %2000
T2 = 3000;    %3000
n1 = T1/DT+1;
n2 = T2/DT;

t = tt;
t = t(n1:n2);

Vaf = zeros(length(Vam),1);

for i= 1:length(Vam)
    Vaf(i,1)= (Vam([i])+Vag([i])+Vap([i]))/3;
end
    
y = Vam(n1:n2);
%y = Vag(n1:n2);
%y = Vap(n1:n2);
%y = Vaf(n1:n2);

y = y-mean(y);

Fs = 1/DT*1000;    % sampling frequency: Hz

maxlags = 2000;   % For auto-correlation 

Fmax = 100;        % maximal frequency to plot
Fc   = [10 100];   % Cut-off frequency
Wc   = Fc/(Fs/2);  % 

L = length(y);
NFFT = 2^nextpow2(L);     % Next power of 2 from length of y
Y = fft(y,NFFT)/L;
YY = 2*abs(Y(1:NFFT/2));

f = Fs/2*linspace(0,1,NFFT/2);

m = Fmax/(0.5*Fs)*(0.5*NFFT);
m = floor(m);

%=================================================
xmin = 1000;
xmax = 2000;

% figure;
% plot(t,y,'b');
% title('Original Signal');
% % axis([xmin, xmax, -80, -20]);

% % Plot single-sided amplitude spectrum.
figure(1);
plot(f(1:m),YY(1:m));
title('Single-Sided Amplitude Spectrum of y(t)')
xlabel('Frequency (Hz)')
ylabel('|Y(f)|')


%=================================================

h = fir1(FILORDER, Wc);
x = filtfilt(h,1, y);


X = fft(x,NFFT)/L;
XX = 2*abs(X(1:NFFT/2));
% XX = abs(X(1:NFFT/2)).^2;

[Peak, I] = max(XX);
fo=f(I);
disp('The oscillation frequency is:');
fo
disp('The oscillation power is:');
Peak

%=======================================
%         Auto-correlation 
%=======================================
u  = mean(x)
yn = x-u;

[cy, lags] = xcorr(yn, maxlags,'coeff');


for k=(maxlags+2):length(cy)
    
      if cy(k)>cy(k-1) && cy(k)>cy(k+1)  
      break;
    end
end

% disp('The oscillation index is:');
% OI = cy(k)
% 
% PI=k-maxlags-1;
% 
% disp('The oscillation frequency from auto-correlation is:');
% focs = 1/(PI*DT)*1000


xmin1 = 1;
xmax1 = 3000;

figure(6); 
%x = x';
[Frq,timespec,spec] = WaveSpec(x,[1 150],150,6,1/Fs,'lin');
spec= abs(spec);
imagesc(timespec,Frq,spec); colormap(jet); set(gca,'YDir','normal');ylabel('frq');xlabel('time');

figure(2);
plot(t, x, 'LineWidth',0.5);
xlabel('ms', 'FontSize',14);
ylabel('mV', 'FontSize',14);
title('Filtered LFP', 'FontSize',14);
set(gca, 'FontSize',12);
axis([xmin1, xmax1, -10, 10]);
box('off');


% Plot auto-correlation of LFP
figure(3);
plot(lags, cy);
xlabel('Lags (ms)', 'FontSize',14);
title('Autocorrelation of sLFP', 'FontSize',14);


% Plot single-sided amplitude spectrum.
figure(4);
% plot(f, 2*abs(Y(1:NFFT/2))) 
plot(f(1:m),XX(1:m));
title('FFT Spectrum', 'FontSize',14);
xlabel('Frequency (Hz)', 'FontSize',14);
ylabel('Power', 'FontSize',14);
set(gca, 'FontSize',12);
% axis([0, 150, 0, 2]);
box('off');


%========================================== 
figure(5);
subplot(3,1,1);
plot(t-2000, x, 'LineWidth',1);
set(gca, 'FontSize',12);
xlabel('ms', 'FontSize',12,'FontWeight','bold');
ylabel('sLFP (mV)', 'FontSize',12,'FontWeight','bold');
axis([0, 1000, -10, 10]);
box('off');

subplot(3,1,2);
plot(lags*DT, cy, 'LineWidth',1);
xlabel('Lags (ms)', 'FontSize',12, 'FontWeight','bold');
set(gca, 'FontSize',12);
axis([-400, 400, -1.0, 1]);
box('off');

subplot(3,1,3);
plot(f(1:m),XX(1:m), 'LineWidth',1);
xlabel('Frequency (Hz)', 'FontSize',12,'FontWeight','bold')
ylabel('Power', 'FontSize',12,'FontWeight','bold')
set(gca, 'FontSize',12);
axis([0, 100, 0, 4.0]);
box('off');

% path = strcat('/home/shivangi/Desktop/project/data0');
% cd(path);
% save Vaf.mat

path = strcat('/home/shivangi/Desktop/sem/sem7/odors_DC/less inhibition/odor1_var/high noise/Trial 1/Figures/MC');
cd(path);
for k=1:6
  saveas(figure(k),sprintf('figuref_%d.jpg',k))
end

