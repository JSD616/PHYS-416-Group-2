clear;clc;close all;
L = 100;
sigma = 0.05;
n = (L/sigma)^2;
j = 1;
kT = 0.05;

[spin, X, Y] = XYInitialization(L);
figure(1)
imagesc(spin);
axis equal
colormap('hsv')
colorbar
clim([0,2])
title("Spin Lattice")

[spin, X, Y] = XYMetropolis(spin, kT, j, L, n, 1);
vort = XYVorticity(spin,L);
div = XYDivergence(X,Y,L);
figure(2)
quiver(X,Y);
axis equal
figure(3);
imagesc(spin);
axis equal
colormap('hsv')
colorbar
clim([0,2])
title(sprintf("Spin Lattice (kT = %g)",kT))


figure(4)
imagesc(vort);
axis equal
colorbar
title(sprintf("Vorticity (kT = %g)",kT))
%figure(5)
%imagesc(div);
%axis equal
%colorbar
%title("Divergence")