function [M, E] = IsingStats(spin, j, h, L)
    M = 0;
    E = 0;
    for row = 1:L
        for col = 1:L
            N = Neighbor(L, row, col);
            M = M + spin(row,col);
            E = E - spin(row,col) * (h + j * (spin(row,N(2)) + spin(N(4),col)));
        end
    end
end