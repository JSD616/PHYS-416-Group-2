clear;clc;close all;
L = 50;
r = 0.05;
n = (L/r)^2;
sigma = 1/4;

j = 10;
kT = 1;

spin = rand(L,L);
figure(1)
imagesc(spin);
axis equal
colormap('hsv')
colorbar
clim([0,2])
title("Spin Lattice")

[spin, X, Y] = XYMetropolis(spin, kT, j, L, n, sigma, 1);
figure(2)
quiver(X,Y);
axis equal
figure(3)
imagesc(spin);
axis equal
colormap('hsv')
colorbar
clim([0,2])
title("Spin Lattice")
