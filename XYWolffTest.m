clear;clc;close all;
L = 80;
j = 10;
kT = 1;
mode = 0;
[spin, X, Y] = XYInitialization(L);

%figure(1)
%quiver(X,Y);
%axis equal
figure(1)
imagesc(spin);
axis equal
colormap('hsv')
colorbar
clim([0,2])
title("Spin Lattice")
for N = 1:8
    N
    [spin, X, Y, clusterMap] = XYWolff(spin, kT, j, L, mode);
end
figure(2)
imagesc(spin);
axis equal
colormap('hsv')
colorbar
clim([0,2])
title("Spin Lattice")
figure(3)
imagesc(clusterMap);
axis equal
colorbar
title("Clusters")