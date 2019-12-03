
 load('imgTensor.mat')
 load('tens.mat')
 z = imageTensor(:,5,16); %orl
 
 subplot(1,3,1);
 imshow(reshape(z,[112, 92]))

tol = 0.1;
%[S, F, G, H, D, C] = createTensor(imageTensor, tol);

% Least square
[e1, p1] = classification(C, H, z, tol);

im = reshape(imageTensor(:,e1,p1),[112,92]);
subplot(1,3,2)
imshow(im)

%QR

Be = ttm(S,G,2);
[e2, p2] = classificationQR(Be, F, H, z, tol);

subplot(1,3,3);
imshow(reshape(imageTensor(:,e2,p2),[112,92]));
%%
clc
tol = 0.1;
for e = 1:10
    for p = 1:40
       z = imageTensor(:,e,p);
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
