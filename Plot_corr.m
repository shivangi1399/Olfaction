clear all;
clc;
close all;
%% Standard inhibition

path = strcat('D:\Desktop data\Semester\sem8\Project 8\Analysis\Convolve\standard inhibition\high noise');
cd(path);

load('A12.mat')
AS12 = A;
load('A13.mat')
AS13 = A;
load('A24.mat')
AS24 = A;
load('A34.mat')
AS34 = A;

% Mean and Stdev

MAS12 = mean(AS12);
SAS12 = std(AS12);
MAS13 = mean(AS13);
SAS13 = std(AS13);
MAS24 = mean(AS24);
SAS24 = std(AS24);
MAS34 = mean(AS34);
SAS34 = std(AS34);

%% More inhibition

path = strcat('D:\Desktop data\Semester\sem8\Project 8\Analysis\Convolve\more inhibition\high noise');
cd(path);

load('A12.mat')
AM12 = A;
load('A13.mat')
AM13 = A;
load('A24.mat')
AM24 = A;
load('A34.mat')
AM34 = A;

% Mean and Stdev

MAM12 = mean(AM12);
SAM12 = std(AM12);
MAM13 = mean(AM13);
SAM13 = std(AM13);
MAM24 = mean(AM24);
SAM24 = std(AM24);
MAM34 = mean(AM34);
SAM34 = std(AM34);

%% Standard inhibition

path = strcat('D:\Desktop data\Semester\sem8\Project 8\Analysis\Convolve\less inhibition\high noise');
cd(path);

load('A12.mat')
AL12 = A;
load('A13.mat')
AL13 = A;
load('A24.mat')
AL24 = A;
load('A34.mat')
AL34 = A;

% Mean and Stdev

MAL12 = mean(AL12);
SAL12 = std(AL12);
MAL13 = mean(AL13);
SAL13 = std(AL13);
MAL24 = mean(AL24);
SAL24 = std(AL24);
MAL34 = mean(AL34);
SAL34 = std(AL34);

%% Plot

% Across odor

% figure(1);
% errorbar(MAS12(1:2000:end),SAS12(1:2000:end))
% hold on;
% errorbar(MAM12(1:2000:end),SAM12(1:2000:end))
% hold on;
% errorbar(MAL12(1:2000:end),SAL12(1:2000:end))
% hold on;
% xline(250, '--')
% legend('Case 1','Case 2', 'Case 3', 'Odor start')
% xlabel('Scaled time')
% ylabel('Correlation coefficient')
% title('Across odor correlation for odor 1 and odor 2')
% 
% figure(2);
% errorbar(MAS13(1:2000:end),SAS13(1:2000:end))
% hold on;
% errorbar(MAM13(1:2000:end),SAM13(1:2000:end))
% hold on;
% errorbar(MAL13(1:2000:end),SAL13(1:2000:end))
% hold on;
% xline(250, '--')
% legend('Case 1','Case 2', 'Case 3', 'Odor start')
% xlabel('Scaled time')
% ylabel('Correlation coefficient')
% title('Across odor correlation for odor 1 and odor 3')
% 
% figure(3);
% errorbar(MAS24(1:2000:end),SAS24(1:2000:end))
% hold on;
% errorbar(MAM24(1:2000:end),SAM24(1:2000:end))
% hold on;
% errorbar(MAL24(1:2000:end),SAL24(1:2000:end))
% hold on;
% xline(250, '--')
% legend('Case 1','Case 2', 'Case 3', 'Odor start')
% xlabel('Scaled time')
% ylabel('Correlation coefficient')
% title('Across odor correlation for odor 2 and odor 4')
% 
% figure(4);
% errorbar(MAS34(1:2000:end),SAS34(1:2000:end))
% hold on;
% errorbar(MAM34(1:2000:end),SAM34(1:2000:end))
% hold on;
% errorbar(MAL34(1:2000:end),SAL34(1:2000:end))
% hold on;
% xline(250, '--')
% legend('Case 1','Case 2', 'Case 3', 'Odor start')
% xlabel('Scaled time')
% ylabel('Correlation coefficient')
% title('Across odor correlation for odor 3 and odor 4')

figure(1);
plot(MAS12(1:2000:end))
hold on;
plot(MAM12(1:2000:end))
hold on;
plot(MAL12(1:2000:end))
hold on;
xline(250, '--')
legend('Case 1','Case 2', 'Case 3', 'Odor start')
xlabel('Scaled time')
ylabel('Correlation coefficient')
title('Across odor correlation for odor 1 and odor 2')

figure(2);
plot(MAS13(1:2000:end))
hold on;
plot(MAM13(1:2000:end))
hold on;
plot(MAL13(1:2000:end))
hold on;
xline(250, '--')
legend('Case 1','Case 2', 'Case 3', 'Odor start')
xlabel('Scaled time')
ylabel('Correlation coefficient')
title('Across odor correlation for odor 1 and odor 3')

figure(3);
plot(MAS24(1:2000:end))
hold on;
plot(MAM24(1:2000:end))
hold on;
plot(MAL24(1:2000:end))
hold on;
xline(250, '--')
legend('Case 1','Case 2', 'Case 3', 'Odor start')
xlabel('Scaled time')
ylabel('Correlation coefficient')
title('Across odor correlation for odor 2 and odor 4')

figure(4);
plot(MAS34(1:2000:end))
hold on;
plot(MAM34(1:2000:end))
hold on;
plot(MAL34(1:2000:end))
hold on;
xline(250, '--')
legend('Case 1','Case 2', 'Case 3', 'Odor start')
xlabel('Scaled time')
ylabel('Correlation coefficient')
title('Across odor correlation for odor 3 and odor 4')

%% Save data

path = strcat('D:\Desktop data\Semester\sem8\Project 8\Analysis\Convolve\Comparison');
cd(path);
for k=1:4
    saveas(figure(k),sprintf('acrossm_%d.jpg',k))
end



