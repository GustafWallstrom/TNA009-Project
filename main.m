
 load('imgTensor.mat')
 load('tens.mat')
 z = imageTensor(:,4,12); %orl
 
 subplot(1,2,1);
 imshow(reshape(z,[112, 92]))

tol = 0.001;
%[S, F, G, H, D, C] = createTensor(imageTensor, tol);

[e, p] = classification(C, H, z, tol);

im = reshape(imageTensor(:,e,p),[112,92]);
subplot(1,2,2)
imshow(im)