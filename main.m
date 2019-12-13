
load('yface10.mat');
X = imcomplement(yface10/max(max(max(yface10))));
WINK = X(:,11,:);
X = X(:,1:10,:);
z = im2double(reshape(imresize(rgb2gray(imread('Gustaf.JPG')),[112 78]),[8736 1]));


tol = 1.2;
e = 5;
p = 2;

z = WINK(:,1,p);

subplot(1,4,1);
imshow(reshape(z,[112, 78]))
%[S, F, G, H, D, C] = createTensor(X);

% Least square
tic;
[e1, p1, close1] = classification(C, H, z, tol);
timeLS = toc;

%QR
tic;
[e2, p2, close2] = classificationQR(S, G , F, H, z, tol);
timeQR = toc;

%Compression

k = 11;
tic;
[e3, p3, close3] = compression(S, G, F, H, z, k, tol);
timeComp = toc;

%Plot closest

subplot(2,3,1);
imshow(reshape(X(:,close2(2,1),close2(1,1)),[112,78]));
ylabel('QR')
title('1')
subplot(2,3,2);
imshow(reshape(X(:,close2(2,2),close2(1,2)),[112,78]));
title('2')
subplot(2,3,3);
imshow(reshape(X(:,close2(2,3),close2(1,3)),[112,78]));
title('3')

subplot(2,3,4);
imshow(reshape(X(:,close3(2,1),close3(1,1)),[112,78]));
ylabel('HOSVD Compression')
subplot(2,3,5);
imshow(reshape(X(:,close3(2,2),close3(1,2)),[112,78]));
subplot(2,3,6);
imshow(reshape(X(:,close3(2,3),close3(1,3)),[112,78]));

% Test phase

for p = 1:size(X(1,1,:))
    for e = 1:size(X(1,:,1))
       
       z = WINK(:,1,p);
       [e1, p1, close1] = classification(C, H, z, tol);
       [e2, p2, close2] =  classificationQR(S, G, F, H, z, tol);
       [e3, p3, close3] = compression(S, G, F, H, z, k, tol);
       if(p ~= p1)
           fprintf('p: %d ', p);
           fprintf('p1: %d \n', p1);
%           fprintf('e: %d ', e);
%           fprintf('e1: %d \n', e1);
       end
       if(p ~= p2)
           fprintf('p: %d ', p);
           fprintf('p1: %d \n', p2);
%           fprintf('e: %d ', e);
%           fprintf('e1: %d \n', e1);
       end
       if(p ~= p3)
           fprintf('p: %d ', p);
           fprintf('p1: %d \n', p3);
%           fprintf('e: %d ', e);
%           fprintf('e1: %d \n', e1);
       end
    end
end

fprintf('Run time for QR: %d \n', timeQR);
fprintf('Run time for Compressed: %d \n', timeComp);
fprintf('Compressed/QR ratio: %d \n', timeComp/timeQR);
fprintf('Done \n \n');

%%

