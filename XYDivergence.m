% Creates a divergence matrix of size L-1 
% for the spin lattice of size L with X and Y
% corresponding to vector components at each site

function [div] = XYDivergence(X, Y, L)
    div = zeros(L-1);
    for x = 1:L-1
        for y = 1:L-1
            div(x,y) = (X(x+1,y)-X(x,y)+X(x+1,y+1)-X(x,y+1)+Y(x,y+1)-Y(x,y)+Y(x+1,y+1)-Y(x+1,y))/2;
        end
    end
end
            