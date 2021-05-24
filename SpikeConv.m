clc;
clear all;
close all;

nmitx = 5;
nmity = 5;
npgx  = 5;
npgy  = 5;
ngranx = 10;
ngrany = 10;

nMit = 25;
nPG  = 25;
nGC  = 100;

        
%load Odor;
    path=strcat('/home/shivangi/Desktop/sem/sem7/odors_DC/less inhibition/odor4_var/high noise/Trial 5/data0');
    cd(path);

    
    for i = 0:1:(nmitx-1)
        for j = 0:1:(nmity-1)   
            s = ['load Ms' '_' int2str(i) '_' int2str(j) ';'];    
            eval(s); 
        end
    end


    u= linspace (0,3000,1500001);

    for k = 0:1:(nmitx-1)   
        for l = 0:1:(nmity-1)   
            s = ['F=Ms' '_' int2str(k) '_' int2str(l) ';'];    
            eval(s); 
            M = zeros(1500001,1);
            for i= 1:length(u)    
                for j=1:length(F)         
                    if u(i)== (F(j))
                       M(i,1)= 1;
                    end 
                end 
            end
            s = ['M' '_' int2str(k) '_' int2str(l) '= M;'];    
            eval(s); 
        end
    end

    H =  sigwin.tukeywin(25000,0.05);
    kernel = generate(H);

    for i = 0:1:(nmitx-1)
        for j = 0:1:(nmity-1)   
            p = ['F = M' '_' int2str(i) '_' int2str(j) ';'];
            eval(p); 
            s = ['V' '_' int2str(i) '_' int2str(j) '= conv(F,kernel);'];
            eval(s); 
        end 
    end


% figure(1), clf
% % plot the signal
% subplot(311)
% plot(M_0_0)
% title('Signal')
% 
% % plot the kernel
% subplot(312)
% plot(kernel)
% title('Kernel')
% 
% % plot the result of convolution
% subplot(313)
% plot(V_0_0)
% title('Result of convolution')

    S4_5= [V_0_0  V_0_1  V_0_2  V_0_3  V_0_4  V_1_0  V_1_1  V_1_2  V_1_3  V_1_4  V_2_0  V_2_1  V_2_2  V_2_3  V_2_4  V_3_0  V_3_1  V_3_2  V_3_3  V_3_4  V_4_0  V_4_1  V_4_2  V_4_3  V_4_4];
    %C= corrcoef(S2_3);


    %[c,lags] = xcorr(S1_1(1,:), S2_1(1,:));

    path = strcat('/home/shivangi/Desktop/sem/sem7/odors_DC/Analysis/Convolve/less inhibition/high noise');
    cd(path);
    save('S4_5')
    
    nmitx
   
    
    




