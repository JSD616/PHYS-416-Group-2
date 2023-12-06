% Applies the Metropolis algorithm to a XY-model square spin lattice
% with size L, temperature kT, nearest-neighbor Hamiltonian
% E = -J*sum(i,j nn) cos(θ_i - θ_j), n iterations
%
% mode: 0 for toroidal, 1 for non-toroidal


function [spin, X, Y] = XYMetropolis(spin, kT, j, L, n, mode)
    for i = 1:n
        linearIndex = randi(numel(spin));
        [row, col]  = ind2sub(size(spin), linearIndex);
        dTheta = 2*rand;
        N = XYNeighbor(L, row, col, mode);
        dE = 0;
        for k = 1:size(N,1)
            dE = dE + sinpi(spin(row,col) - spin(N(k,1),N(k,2)) + dTheta/2);
        end
        dE = dE * 2*j*sinpi(dTheta/2);
    
        if dE >= 0
            prob = exp(-dE / kT);
            x = rand;
            if  x<= prob
                spin(row, col) = spin(row, col) + dTheta;
            end
        else
            spin(row, col) = spin(row, col) + dTheta; 
        end
        spin(row, col) = mod(spin(row, col), 2);
    end
    X = cospi(spin);
    Y = sinpi(spin);
end