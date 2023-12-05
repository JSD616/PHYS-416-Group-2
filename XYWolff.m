% Single iteration of Wolff algorithm on a XY-model square spin lattice
% with size L, temperature kT, nearest-neighbor Hamiltonian
% E = -J*sum(i,j nn) cos(θ_i - θ_j)
% mode: 0 for toroidal, 1 for non-toroidal
% 
% Each iteration selects a uniformly random angle θ, corresponding
% to the normal vector of the random "Wolff plane."
% We then check each pair of neighboring spins to see if
% they are on the "same side" of the Wolff plane
% (i.e. cos(θi - θ) * cos(θj - θ) is positive). If so, the
% bond between them is activated with probability
% p = 1 - exp(-2j/kT * cos(θi - θ)*cos(θj - θ)), which
% defines a graph over the lattice. 
% The connected components of this graph are called "clusters,"
% and each cluster is reflected across the Wolff plane with
% probability 1/2.


function [spin, X, Y, clusterMap] = XYWolff(spin, kT, j, L, mode)
    assert((mode == 0) || (mode == 1), 'mode value can only be 0 or 1.');
    theta = 2*rand;
    %A = latticeAdjacencyMatrix(L,L);
    B = zeros(L^2); % Stores bond activation states
    for x = 1:(L-mode)
        for y = 1:(L-mode)
            % Incorporates toroidal wrap-around when mode = 0
            xNext = mod(x, L) + 1;
            yNext = mod(y, L) + 1;
            row = [x,xNext,x];
            col = [y,y,yNext];
            ind = sub2ind(size(spin),row,col);
            ind
            cosProdRight = cospi(spin(x,y)-theta)*cospi(spin(xNext,y)-theta);
            cosProdDown = cospi(spin(x,y)-theta)*cospi(spin(x,yNext)-theta);
            if cosProdRight >= 0
                p = rand;
                if p <= 1 - exp(-2*j/kT*cosProdRight)
                    % Create link between this site and right neighbor
                    B(ind(1),ind(2)) = 1;
                    B(ind(2),ind(1)) = 1;
                end
            end
            
            if cosProdDown >= 0
                p = rand;
                if p <= 1 - exp(-2*j/kT*cosProdDown)
                    % Create link between this site and downward neighbor
                    B(ind(1),ind(3)) = 1;
                    B(ind(3),ind(1)) = 1;
                end
            end
            
        end
    end
    
    G = graph(B);
    clusters = conncomp(G);
    
    % Effectively assign a coin flip to each cluster
    p = rand(max(clusters),1);
    
    clusterMap = zeros(L,L);
    for ind = 1:L^2
        [row, col] = ind2sub(size(spin),ind);
        clusterMap(row,col) = clusters(ind);
        if p(clusters(ind)) <= 0.5
            spin(row, col) = mod(2*theta + 1 - spin(row, col), 2);
        end
    end
    
    X = cospi(spin);
    Y = sinpi(spin);
end
