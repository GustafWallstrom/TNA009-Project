function [er,pr,close2] = classificationQR(S, G, F, H, z,tol)
    
    B = ttm(S,G,2);
    Hp = H';
    zhat = transpose(F)*z;
    close = 11*ones(3,3);
    pr = 0;
    er = 0;
    
    for e = 1:size(B(1,:,1))
        
        [Q,R] = qr(double(B(:,e,:)),0);
        
        mina = lscov(R, Q'*zhat);
        
        
        for p = 1:size(B(1,1,:))
           diff = norm(mina - Hp(:,p));
           if(diff < tol)
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
    close2 = close([2 3],:);
end

