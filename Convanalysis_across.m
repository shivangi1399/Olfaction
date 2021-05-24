clear all;
clc;
close all;

path = strcat('/home/shivangi/Desktop/sem/sem7/odors_DC/Analysis/Convolve/less inhibition/high noise');
cd(path);

%% loading data

load('S1_1.mat')
load('S1_2.mat')
load('S1_3.mat')
load('S1_4.mat')
load('S1_5.mat')
load('S2_1.mat')
load('S2_2.mat')
load('S2_3.mat')
load('S2_4.mat')
load('S2_5.mat')

%% Average corrcoef

A = zeros(25,length(S2_1));
p=0;

for k=1:5
    for l=1:5
        N = zeros(length(S2_1),1);
        for i= 1:length(S2_1)
            s = ['C = corrcoef(S1_' int2str(k) '(i,:),S2_' int2str(l) '(i,:));'];
            eval(s);
            N(i)= C(1,2);
        end
        p = p+1;
        A(p,:)= N;
        s = ['A' '_' int2str(k) '_' int2str(l) '= N;'];    
        eval(s); 
    end
end

B = mean(A);
plot(B)


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

