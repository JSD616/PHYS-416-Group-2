% For an LxL spin lattice in the XY model, this
% function returns an (L-1)x(L-1) matrix with
% vorticity data for each "face" of the lattice,
% as the sum of directed angles going clockwise
% around the 4 corners.

function [vort] = Vorticity(spin, L)
    vort = zeros(L-1);
    for x = 1:L-1
        for y = 1:L-1
            vort(x,y) = DirAngle(spin(x,y),spin(x+1,y)) + DirAngle(spin(x+1,y),spin(x+1,y+1)) + DirAngle(spin(x+1,y+1),spin(x,y+1)) + DirAngle(spin(x,y+1),spin(x,y));
        end
    end
end