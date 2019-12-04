function [e,p] = classificationQR(S, G, F, H, z,tol)
    
    B = ttm(S,G,2);
    Hp = H';
    zhat = transpose(F)*z;
    
    for e = 1:size(B(1,:,1))
        
        [Q,R] = qr(double(B(:,e,:)),0);
        
        mina = lscov(R, Q'*zhat);
        
        for p = 1:size(B(1,1,:))
           if(norm(mina - Hp(:,p)) < tol)
               return;
           end
        end    
    end
    %if person not found
    p = 0;
    e = 0;
end

