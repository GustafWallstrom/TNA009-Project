function [e,p] = classificationQR(Be, F, H, z,tol)
    
    Hp = H';
    zhat = transpose(F)*z;
    
    for e = 1:size(Be(1,:,1))
        
        [Q,R] = qr(double(Be(:,e,:)),0);
        
        mina = lscov(R, Q'*zhat);
        
        for p = 1:size(Be(1,1,:))
           if(norm(mina - Hp(:,p)) < tol)
               return;
           end
        end    
    end
    %if person not found
    p = 0;
    e = 0;
end

