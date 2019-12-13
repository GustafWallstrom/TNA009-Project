function [S, F, G, H, D, C] = createTensor(inputMatrix)

    T = hosvd(tensor(inputMatrix), 0.001);
    S = T.core;
    F = T.U{1};
    G = T.U{2};
    H = T.U{3};
    D = ttm(S, F, 1);
    C = ttm(D, G, 2);

end

