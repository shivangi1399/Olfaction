%% Find average V of PGC

clc;
clear all;
close all;

path = strcat('/home/shivangi/Desktop/sem/sem7/gamma_DC/project/data0');
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


for i = 0:(npgx-1)
   for j = 0:(npgy-1) 
    
    s = ['load Vpb' '_' int2str(i) '_' int2str(j) ';']; 
    eval(s);
    
   end
end

Vap = zeros(length(Vpb_0_0),1);

% for k= 1:length(Vgb_0_0)
%     s=0;
%     for i = 0:(ngranx-1)
%         for j = 0:(ngrany-1) 
%             p= ['print Vgb' '_' int2str(i) '_' int2str(j) '(' '[' int2str(k) ']' ')' ';'] 
%             eval(p)
%             
%             meanl(k,1)=s;
%         
%         end
%     end
% end

for k= 1:length(Vpb_0_0)
    Vap(k,1) = (Vpb_0_0([k]) + Vpb_0_1([k])+ Vpb_0_2([k]) + Vpb_0_3([k]) + Vpb_0_4([k]) + Vpb_1_0([k]) + Vpb_1_1([k]) +Vpb_1_2([k]) + Vpb_1_3([k]) + Vpb_1_4([k]) + Vpb_2_0([k]) + Vpb_2_1([k]) + Vpb_2_2([k]) + Vpb_2_3([k]) + Vpb_2_4([k]) + Vpb_3_0([k])+Vpb_3_1([k]) +Vpb_3_2([k]) +Vpb_3_3([k]) +Vpb_3_4([k]) +Vpb_4_0([k]) +Vpb_4_1([k]) +Vpb_4_2([k]) +Vpb_4_3([k])+Vpb_4_4([k]))/nPG;
end

path = strcat('/home/shivangi/Desktop/sem/sem7/odors_DC/odor1_var/data0');
cd(path);
save Vap.mat