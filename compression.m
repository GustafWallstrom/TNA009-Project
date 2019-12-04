function [e, p] = compression(S, G, F, H, z, k, tol)

    Hp = H';
    Bhat = ttm(S(1:k,:,:), G, 2);
    Fk = F(:,1:k);
    Chat = ttm(Bhat, Fk, 1);
    zhatk = transpose(Fk)*z;
    
    for e = 1:size(Bhat(1,:,1))
        
        mina = lscov(double(Bhat(:,e,:)), zhatk);
        
        for p = 1:size(Bhat(1,1,:))
           if(norm(mina - Hp(:,p)) < tol)
               return;
           end
        end    
    end
    %if person not found
    p = 0;
    e = 0;
end

