function [e,p] = classificationQR(Be, F, H, z,tol)
    
    % preprocess
    Q = zeros(10,400,40);
    R = zeros(10,40,40);
    Hp = H';
    
    for i = 1:10
        [Q(i,:,:),R(i,:,:)] = qr(double(Be(:,i,:)),0);
    end
    
    zhat = transpose(F)*z;
    
    %qr
    
    for e = 1:10
        mina = lscov(transpose(double(R(e,:,:))), transpose(double(Q(e,:,:)))*zhat);
        for p = 1:40
           if(norm(mina - Hp(:,p))<tol)
               return;
           end
            
        end    
    end
end

