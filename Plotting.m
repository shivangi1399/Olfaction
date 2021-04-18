clear all;
clc;
close all;

path = strcat('/home/shivangi/Desktop/sem/sem7/odors_DC/AddSpike');
cd(path);

load('odvar1_1.mat')
load('odvar2_1.mat')

figure;
plot(y,odvar1_1)
hold on
plot(y,odvar2_1)


% for i = 1:length(y)
%     scatter (odvar1_1(i))
%     hold on
%     scatter (odvar2_1(i))
% end


figure;
for y = linspace(0,3000,100)
    plot(y, odvar1_1, 'g*'), hold on
    drawnow;
    pause(0.1)
end