function [e, p] = classification(C,H,z,tol)
    
    Hp = H';

    for e = 1:size(C(1,:,1))
        
        Ce = double(C(:,e,:));
        mina = lscov(Ce,z);
        
        for p = 1:size(C(1,1,:))
           
            if (norm(mina - Hp(:,p)) < tol)
                return;
            end
            
        end  
    end
    %if person not found
    p = 0;
    e = 0;
end

