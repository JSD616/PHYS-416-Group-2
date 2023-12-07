clear;clc;close all;
figure(1)
figure(2)
L = 10;
j = 1;
kT = 0.1;
n = 1000;
sigma = 0.01; % Relative variation in point selection
%tMax = (L/sigma)^2;
tMax = 100;
corr = CorrW(j, kT, L, n, tMax);
figure(3)
imagesc([-L L], [-L L], corr);
colorbar
title(sprintf("Spin-Spin Correlation (kT = %d)", kT))




% Uses the XY Wolff Algorithm to estimate the
% correlation between spins with respect to distance.
% (Here defined as expectation val. of dot product of spins)
% j, kT are stats for the Hamiltonian and lattice as usual
% L: Maximum horizontal/vertical distance from center (actual lattice size 2L+1)
% n: number of trials
% tMax: number of timesteps

function [corr] = CorrW(j, kT, L, n, tMax)
    corr = zeros(2*L+1);
    for i = 1:n
        i
        [spin,X,Y] = XYInitialization(2*L+1);
        for t = 1:tMax
            spin = XYWolff(spin, j, kT, 2*L + 1, 1);
        end
        for row = 1:2*L+1
            for col = 1:2*L+1
                corr(row,col) = corr(row,col) + cospi(spin(L+1,L+1)-spin(row,col));
            end
        end
    end
    corr = corr./n;
end

% Uses the XY Metropolis Algorithm to estimate the
% correlation between spins with respect to distance.
% (Here defined as expectation val. of dot product of spins)
% j, kT are stats for the Hamiltonian and lattice as usual
% L: Maximum horizontal/vertical distance from center (actual lattice size 2L+1)
% n: number of trials
% tMax: number of timesteps

function [corr] = CorrM(j, kT, L, n, tMax)
    corr = zeros(2*L+1);
    for i = 1:n
        i
        [spin,X,Y] = XYInitialization(2*L+1);
        spin = XYMetropolis(spin, j, kT, 2*L + 1, tMax, 1);
        for row = 1:2*L+1
            for col = 1:2*L+1
                corr(row,col) = corr(row,col) + cospi(spin(L+1,L+1)-spin(row,col));
            end
        end
    end
    corr = corr./n;
end