clear all;
clc;
close all;

path = strcat('/home/shivangi/Desktop/sem/sem7/odors_DC/AddSpike');
cd(path);

load('odvar1_1.mat')
load('odvar2_1.mat')
load('odvar3_1.mat')
load('odvar4_1.mat')

y = linspace(0,3000,100);

figure;
for k = 1:length(y)
    scatter(y(k),odvar1_1(k), 'r');hold on
    scatter(y(k),odvar2_1(k), 'b');hold on
    drawnow
    legend({'y=odvar1_1','y = odvar2_1'})
end

figure;
for k = 1:length(y)
    scatter(y(k),odvar3_1(k), 'b');hold on
    scatter(y(k),odvar4_1(k), 'r');hold on
    drawnow
    legend({'y=odvar3_1','y = odvar4_1'})
end

figure;
for k = 1:length(y)
    scatter(y(k),odvar1_1(k), 'b');hold on
    scatter(y(k),odvar3_1(k), 'r');hold on
    drawnow
    legend({'y=odvar1_1','y = odvar3_1'})
end

figure;
for k = 1:length(y)
    scatter(y(k),odvar2_1(k), 'b');hold on
    scatter(y(k),odvar4_1(k), 'r');hold on
    drawnow
    legend({'y=odvar2_1','y = odvar4_1'})
end
