clear;
clc;
close;

path = strcat('/home/shivangi/Desktop/sem/sem7/odors_DC/Analysis/Convolve/standard inhibition/high noise');
cd(path);

%% loading data

load('S1_1.mat')
load('S1_2.mat')
load('S1_3.mat')
load('S1_4.mat')
load('S1_5.mat')

%% Average corrcoef

p = length(S1_1)
W = zeros(10,p);
k=1;

for i= 1:p
    N1 = zeros(p,1);
    s = ['C = corrcoef(S' int2str(k) '_1(i,:),S' int2str(k) '_2(i,:));'];
    eval(s);
    N1(i) = C(1,2);
    W(1,:) = N1;
    
    N2 = zeros(p,1);
    s = ['C = corrcoef(S' int2str(k) '_1(i,:),S' int2str(k) '_3(i,:));'];
    eval(s);
    N2(i) = C(1,2);
    W(2,:) = N2;
    
    N3 = zeros(p,1);
    s = ['C = corrcoef(S' int2str(k) '_1(i,:),S' int2str(k) '_4(i,:));'];
    eval(s);
    N3(i) = C(1,2);
    W(3,:) = N3;
    
    N4 = zeros(p,1);
    s = ['C = corrcoef(S' int2str(k) '_1(i,:),S' int2str(k) '_5(i,:));'];
    eval(s);
    N4(i) = C(1,2);
    W(4,:) = N4;
    
    N5 = zeros(p,1);
    s = ['C = corrcoef(S' int2str(k) '_2(i,:),S' int2str(k) '_3(i,:));'];
    eval(s);
    N5(i) = C(1,2);
    W(5,:) = N5;
    
    N6 = zeros(p,1);
    s = ['C = corrcoef(S' int2str(k) '_2(i,:),S' int2str(k) '_4(i,:));'];
    eval(s);
    N6(i) = C(1,2);
    W(6,:) = N6;
    
    N7 = zeros(p,1);
    s = ['C = corrcoef(S' int2str(k) '_2(i,:),S' int2str(k) '_5(i,:));'];
    eval(s);
    N7(i) = C(1,2);
    W(7,:) = N7;
    
    N8 = zeros(p,1);
    s = ['C = corrcoef(S' int2str(k) '_3(i,:),S' int2str(k) '_4(i,:));'];
    eval(s)
    N8(i) = C(1,2);
    W(8,:) = N8;
    
    N9 = zeros(p,1);
    s = ['C = corrcoef(S' int2str(k) '_3(i,:),S' int2str(k) '_5(i,:));'];
    eval(s);
    N9(i) = C(1,2);
    W(9,:) = N9;
    
    N10 = zeros(p,1);
    s = ['C = corrcoef(S' int2str(k) '_4(i,:),S' int2str(k) '_5(i,:));'];
    eval(s);
    N10(i) = C(1,2);
    W(10,:) = N10;

end

W1 = W;   
B = mean(W);
plot(B)

path = strcat('/home/shivangi/Desktop/sem/sem7/odors_DC/Analysis/Convolve/standard inhibition/high noise');
cd(path);
save('W1')



 %% Matrix of corrcoef at every time point

% H = zeros(10,10);
% 
% for i=567890 %:length(S1_1)
%     for j=1:5
%         for k=1:5
%             s = ['Ca = corrcoef(S1_' int2str(j) '(i,:),S1_' int2str(k) '(i,:));'];
%             eval(s); 
%             H(j,k)=Ca(1,2);
%             s = ['Cb = corrcoef(S1_' int2str(j) '(i,:),S2_' int2str(k) '(i,:));'];
%             eval(s); 
%             H(j,k+5)=Cb(1,2);
%             s = ['Cc = corrcoef(S2_' int2str(k) '(i,:),S1_' int2str(j) '(i,:));'];
%             eval(s); 
%             H(j+5,k)= Cc(1,2);
%             s = ['Cd = corrcoef(S2_' int2str(j) '(i,:),S2_' int2str(k) '(i,:));'];
%             eval(s); 
%             H(j+5,k+5)=Cd(1,2);
%         end
%     end
% end
% H

