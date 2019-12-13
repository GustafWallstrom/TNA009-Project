function [er, pr, close1] = classification(C,H,z,tol)
    
    Hp = H';
    close = 11*ones(3,3);
    pr = 0;
    er = 0;

    for e = 1:size(C(1,:,1))
        
        Ce = double(C(:,e,:));
        mina = lscov(Ce,z);
        
        for p = 1:size(C(1,1,:))
           
            diff = norm(mina - Hp(:,p));
            
            if (diff < tol)
                er = e;
                pr = p;
            end
            
            if(diff < close(1,1)) 
                close(1,3) = close(1,2); close(1,2) = close(1,1); close(1,1) = diff;
                close(2,3) = close(2,2); close(2,2) = close(2,1); close(2,1) = p;
                close(3,3) = close(3,2); close(3,2) = close(3,1); close(3,1) = e;
            elseif(diff < close(1,2))
                close(1,3) = close(1,2); close(1,2) = diff;
                close(2,3) = close(2,2); close(2,2) = p;
                close(3,3) = close(3,2); close(3,2) = e;
            elseif(diff < close(1,3))
                close(1,3) = diff;
                close(2,3) = p;
                close(3,3) = e;
            end
        end  
    end
    
    close1 = close([2 3],:);
end

