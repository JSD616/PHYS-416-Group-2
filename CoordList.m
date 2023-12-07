% Returns a MN*2 array containing all valid pairs of indices
% for an array of dimensions M * N

function [coords] = CoordList(M, N)
    coords = zeros(M*N, 2);
    for row = 1:M
        for col = 1:N
            coords(N*(row-1) + col,:) = [row, col];
        end
    end
end