close all;
clear all;

%% Load data
raw = csvread("ntc.csv")';

temp1 = raw(1,:);
r = raw(2,:);


%% Calculate temp. values for corresponding ADC values
ad1 = r./(r+10).*(2^10);

figure;
plot(ad1, temp1, 'o');
grid on;
hold on;

%% Interpolate the data
p = polyfit(ad1, temp1, 10);

ad2 = 0:1023;
temp2 = round(polyval(p, ad2), 1).*10; % In tenths of deg. C
plot(ad2, temp2./10);


%% Generate output file
dlmwrite("data.dlm", temp2, ',');



