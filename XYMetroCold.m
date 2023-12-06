% Over n iterations, randomly chooses one angle at a time and
% sets it to value that minimizes (or maximizes) enertgy

function [spin, X, Y] = XYMetroCold(spin, kT, j, L, n, mode)
    for i = 1:n
        linearIndex = randi(numel(spin));
        [row, col]  = ind2sub(size(spin), linearIndex);
        %dTheta = sigma * randn;
        N = XYNeighbor(L, row, col, mode);
        sinSum = 0;
        cosSum = 0;
        for k = 1:size(N,1)
            %N(k)
            %spin(N(k,1),N(k,2))
            sinSum = sinSum + sinpi(spin(N(k,1),N(k,2)));
            cosSum = cosSum + cospi(spin(N(k,1),N(k,2)));
        end
        %sinSum
        %cosSum
        thetaNew = atan2(sinSum,cosSum)/pi;
        dTheta = thetaNew - spin(row,col);
        %dTheta
        dE = 0;
        for k = 1:size(N,1)
            dE = dE + sinpi(spin(row,col) - spin(N(k,1),N(k,2)) + dTheta/2);
        end
        dE = dE * 2*j*sinpi(dTheta/2);
    
        if  dE <= 0
            spin(row, col) = mod(thetaNew, 2);
        else
            x = rand;
            if x <= exp(-dE/kT)
                spin(row, col) = mod(thetaNew, 2);
            end
        end
    end
    X = cospi(spin);
    Y = sinpi(spin);
end