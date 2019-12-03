
load('yface10.mat');
X = imcomplement(yface10/max(max(max(yface10))));

tol = 0.001;
e = 1;
p = 2;

z = X(:,e,p);
subplot(1,3,1);
imshow(reshape(z,[112, 78]))
%[S, F, G, H, D, C] = createTensor(X, tol);

% Least square
[e1, p1] = classification(C, H, z, tol);

im = reshape(X(:,e1,p1),[112,78]);
subplot(1,3,2)
imshow(im)

%QR

Be = ttm(S,G,2);
[e2, p2] = classificationQR(Be, F, H, z, tol);

subplot(1,3,3);
imshow(reshape(X(:,e2,p2),[112,78]));

%%
clc
tol = 0.001;
for e = 1:11
    for p = 1:10
       z = X(:,e,p);
       [e1, p1] =  classificationQR(Be, F, H, z, tol);
       if(e1 ~= e || p ~= p1)
           fprintf('p: %d ', p);
           fprintf('p1: %d ', p1);
           fprintf('e: %d ', e);
           fprintf('e1: %d\n', e1);
       end
    end
end
fprintf('Done \n');
