% Returns an (L-1)x1 vector of average spin correlation
% with respect to distance for the XY model.
% Temperature kT, coupling constant j.
% Evolves an LxL spin lattice by n steps.
% alg = 'M' for Metropolis, 'W' for Wolff.

function [corr] = AvgCorr(kT, j, L, n, alg)
    spin = XYInitialization(L);
    if alg == 'M'
        spin = XYMetropolis(spin, kT, j, L, n , 1);
    else
        for i = 1:n
            spin = XYWolff(spin, kT, j, L, 1);
        end 
    end
    corr = zeros(L-1,1);
    count = zeros(L-1,1);
    for i = 1:L
        for j = 1:L
            if j ~= i
                count(abs(i-j)) = count(abs(i-j))+2;
                corr(abs(i-j)) = corr(abs(i-j)) + cospi(spin(i,j)-spin(i,i)) + cospi(spin(j,i)-spin(i,i));
            end
        end
    end
    corr = corr./count;
end