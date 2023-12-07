% Returns an L*L square array of angles in units of pi.
% Vector coordinates corresponding to each angle should be
% calculated via sinpi & cospi
%
% Later on I might add different modes of initialization like
% vortices or something; until then, it might be more efficient
% to just inline all of this

function [spin, X, Y] = XYInitialization(L)
    spin = rand(L,L).*2;
    X = cospi(spin);
    Y = sinpi(spin);