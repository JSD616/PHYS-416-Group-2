% Returns an array of coordinates corresponding to
% nearest neighbors of the given point
% in the square lattice of given size
%
% mode: 0 for toroidal boundary conditions, 1 for non-toroidal

function [Neighbors] = XYNeighbor(L,x,y,mode)
    above = x - 1;
    below = x + 1;
    left  = y - 1;
    right = y + 1;
    if mode == 0
        above = mod(above - 1, L) + 1;
        below = mod(below - 1, L) + 1;
        left = mod(left - 1, L) + 1;
        right = mod(right - 1, L) + 1;
        Neighbors = [above, y; x, right; x, left; below, y];
    else
        Neighbors = [above, y; x, right; x, left; below, y];
        if below == L + 1
            Neighbors(4,:) = [];
        end
        if left == 0
            Neighbors(3,:) = [];
        end
        if right == L + 1
            Neighbors(2,:) = [];
        end
        if above == 0
            Neighbors(1,:) = [];
        end
    end
end
