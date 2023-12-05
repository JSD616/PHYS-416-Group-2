function A = latticeAdjacencyMatrix(N,M)
    % N rows, M columns, denoting the size of the rectangular lattice
    % A - N*M by N*M square adjacency matrix
    % Connect nodes (i,j) to (i+1,j)
    [i,j] = ndgrid(1:N-1,1:M);
    ind1 = sub2ind([N,M],i,j);
    ind2 = sub2ind([N,M],i+1,j);
    
    % Connect nodes (i,j) to (i,j+1)
    [i,j] = ndgrid(1:N,1:M-1);
    ind3 = sub2ind([N,M],i,j);
    ind4 = sub2ind([N,M],i,j+1);
    
    % build the global adjacency matrix
    totalnodes = N*(M-1) + (N-1)*M;
    A = sparse([ind1(:);ind3(:)],[ind2(:);ind4(:)],ones(totalnodes,1),N*M,N*M);
    
    % symmetrize, since the above computations only followed the edges in one direction.
    % that is to say, if a talks to b, then b also talks to a.
    A = A + A';
end
