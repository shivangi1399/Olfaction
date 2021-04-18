
clc;
clear all;
close all;

%load Odor;
path = strcat('/home/shivangi/Desktop/sem/sem7/odors_DC/odor4_var/Trial 1/data0');
cd(path);

nmitx = 5;
nmity = 5;
npgx  = 5;
npgy  = 5;
ngranx = 10;
ngrany = 10;

nMit = 25;
nPG  = 25;
nGC  = 100;

T1000 = 0;
T2000 = 0;
T3000 = 0;


y = linspace (0,3000,100);
% L = [0];
% for i = 2:length(y)
%     L =horzcat(L,y(i));
% end
% A = repmat("T_",1, length(y));
% N = A + L;
M = repmat(0,1,length(y));

% 
% for i = 1:length(M)
%     disp(M(i))= 0
% end
    
   
for i = 0:1:(nmitx-1)
   for j = 0:1:(nmity-1)   
     s = ['load Ms' '_' int2str(i) '_' int2str(j) ';'];    
     eval(s); 
   end
end


for i = 0:1:(nmitx-1)
   for j = 0:1:(nmity-1)   
     
     p = ['F = Ms' '_' int2str(i) '_' int2str(j) ';'];
     eval(p); 
     
     for q = 1: length(y)
         for k = 1: length(F) 
             if F(k) < y(q);
                M(q) = M(q) + F (k);
             end
         end
     end
   end
end

plot(y,M)
odvar1_1=M;

path = strcat('/home/shivangi/Desktop/sem/sem7/odors_DC/AddSpike');
cd(path);
save('odvar1_1')

   


























































