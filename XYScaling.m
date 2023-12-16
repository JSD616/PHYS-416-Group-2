clear;clc;close all;
N = 1000;
L = 50;
n = 100000;
j = 1;
kT = 2;
syms x y;
mode = 'M';
corr = zeros(L-1,1);
for i = 1:N
    %i
    if 
    corr = corr + AvgCorr(kT, j, L, n, mode);
end
corr = corr./N;
figure(1)
plot(corr)
hold on
if kT/j < pi/2
    fplot(corr(1)*(x/L)^(-6*kT/(1*pi*j)),[1 L-1])
else
    fplot((j/(2*kT))^(x),[1 L-1])
end
title(sprintf("Correlation over distance (kT = %g, L = %d)",kT,L))
ylabel("Corr.")
xlabel("r")
hold off